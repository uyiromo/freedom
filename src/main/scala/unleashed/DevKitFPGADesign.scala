// See LICENSE for license details.

package sifive.freedom.unleashed

import Chisel._
import chisel3.experimental.{withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.interrupts._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.system._
import freechips.rocketchip.util.{ElaborationArtefacts,ResetCatchAndSync}

import sifive.blocks.devices.msi._
import sifive.blocks.devices.chiplink._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._
import sifive.blocks.devices.gpio._
import sifive.blocks.devices.pinctrl.{BasePin}

import sifive.fpgashells.devices.xilinx.xilinxvc707mig._
import sifive.fpgashells.devices.xilinx.xilinxvc707pciex1._

import sifive.fpgashells.shell._
import sifive.fpgashells.clocks._
import sifive.fpgashells.ip.xilinx.PowerOnResetFPGAOnly

import sifive.freedom.unleashed.u500vc707devkit.U500VC707DevKitConfig

object PinGen {
  def apply(): BasePin = {
    new BasePin()
  }
}

class DevKitWrapper()(implicit p: Parameters) extends LazyModule
{
  val sysClock  = p(ClockInputOverlayKey).head(ClockInputOverlayParams())
  val sysTap    = ClockIdentityNode()
  val corePLL   = p(PLLFactoryKey)()
  val coreGroup = ClockGroup()
  val wrangler  = LazyModule(new ResetWrangler)
  val coreClock = ClockSinkNode(freqMHz = p(DevKitFPGAFrequencyKey))
  coreClock := wrangler.node := coreGroup := corePLL := sysTap := sysClock

  // removing the debug trait is invasive, so we hook it up externally for now
  val jt = p(JTAGDebugOverlayKey).headOption.map(_(JTAGDebugOverlayParams())).get

  val topMod = LazyModule(new DevKitFPGADesign(wrangler.node)(p))

  override lazy val module = new LazyRawModuleImp(this) {
    val (core, _) = coreClock.in(0)
    childClock := core.clock

    val djtag     = topMod.module.debug.systemjtag.get
    djtag.jtag.TCK := jt.jtag_TCK
    djtag.jtag.TMS := jt.jtag_TMS
    djtag.jtag.TDI := jt.jtag_TDI
    jt.jtag_TDO       := djtag.jtag.TDO.data

    djtag.mfr_id   := p(JtagDTMKey).idcodeManufId.U(11.W)
    djtag.reset    := PowerOnResetFPGAOnly(sysTap.in(0)._1.clock)

    childReset := core.reset | topMod.module.debug.ndreset
  }
}

case object DevKitFPGAFrequencyKey extends Field[Double](100.0)

class DevKitFPGADesign(wranglerNode: ClockAdapterNode)(implicit p: Parameters) extends RocketSubsystem
    with HasPeripheryMaskROMSlave
    with HasPeripheryDebug
    with HasSystemErrorSlave
{
  val tlclock = new FixedClockResource("tlclk", p(DevKitFPGAFrequencyKey))

  // hook up UARTs, based on configuration and available overlays
  val divinit = (p(PeripheryBusKey).frequency / 115200).toInt
  val uartParams = p(PeripheryUARTKey)
  val uartOverlays = p(UARTOverlayKey)
  val uartParamsWithOverlays = uartParams zip uartOverlays
  uartParamsWithOverlays.foreach { case (uparam, uoverlay) => {
    val u = uoverlay(UARTOverlayParams(pbus.beatBytes, uparam, divinit, pbus, ibus.fromAsync, None))
    tlclock.bind(u.device)
  } }

  (p(PeripherySPIKey) zip p(SDIOOverlayKey)).foreach { case (sparam, soverlay) => {
    val s = soverlay(SDIOOverlayParams(sparam, pbus, ibus.fromAsync, None))
    tlclock.bind(s.device)

    // Assuming MMC slot attached to SPIs. See TODO above.
    val mmc = new MMCDevice(s.device)
    ResourceBinding {
      Resource(mmc, "reg").bind(ResourceAddress(0))
    }
  } }


  // TODO: currently, only hook up one memory channel
  require(nMemoryChannels == 1, "Core complex must have 1 master memory port")
  val ddr = p(DDROverlayKey).headOption.map(_(DDROverlayParams(p(ExtMem).get.base, wranglerNode)))
  ddr.get := memBuses.head.toDRAMController(Some("xilinxvc707mig"))()

  // Work-around for a kernel bug (command-line ignored if /chosen missing)
  val chosen = new DeviceSnippet {
    def describe() = Description("chosen", Map())
  }

  // hook up as many PCIe as the board has
  val pcies = p(PCIeOverlayKey).map(_(PCIeOverlayParams(wranglerNode)))
  pcies.zipWithIndex.map { case((pcieNode, pcieInt), i) =>
    val pciename = Some(s"pcie_$i")
    sbus.fromMaster(pciename) { pcieNode }
    sbus.toFixedWidthSlave(pciename) { pcieNode }
    ibus.fromSync := pcieInt
  }

  // LEDs / GPIOs
  val gpioParams = p(PeripheryGPIOKey)
  val gpios = gpioParams.map { case(params) =>
    val g = GPIO.attach(AttachedGPIOParams(params), pbus, ibus.fromAsync, None)
    g.ioNode.makeSink
  }

  val leds = p(LEDOverlayKey).headOption.map(_(LEDOverlayParams()))

  override lazy val module = new U500VC707DevKitSystemModule(this)
}

class U500VC707DevKitSystemModule[+L <: DevKitFPGADesign](_outer: L)
  extends RocketSubsystemModuleImp(_outer)
    with HasRTCModuleImp
    with HasPeripheryDebugModuleImp
{
  // Reset vector is set to the location of the mask rom
  val maskROMParams = p(PeripheryMaskROMKey)
  global_reset_vector := maskROMParams(0).address.U

  // hook up GPIOs to LEDs
  val gpioParams = _outer.gpioParams
  val gpio_pins = Wire(new GPIOPins(() => PinGen(), gpioParams(0)))

  GPIOPinsFromPort(gpio_pins, _outer.gpios(0).bundle)

  gpio_pins.pins.foreach { _.i.ival := Bool(false) }
  val gpio_cat = Cat(Seq.tabulate(gpio_pins.pins.length) { i => gpio_pins.pins(i).o.oval })
  _outer.leds.get := gpio_cat
}

// Allow frequency of the design to be controlled by the Makefile
class WithDevKitFrequency(MHz: Double) extends Config((site, here, up) => {
  case DevKitFPGAFrequencyKey => MHz
})

class WithDevKit25MHz extends WithDevKitFrequency(25)
class WithDevKit50MHz extends WithDevKitFrequency(50)
class WithDevKit100MHz extends WithDevKitFrequency(100)
class WithDevKit125MHz extends WithDevKitFrequency(125)
class WithDevKit150MHz extends WithDevKitFrequency(150)
class WithDevKit200MHz extends WithDevKitFrequency(200)

class DevKitFPGAConfig extends Config(
  new U500VC707DevKitConfig().alter((site, here, up) => {
    case DesignKey => { (p:Parameters) => new DevKitWrapper()(p) }
  }))

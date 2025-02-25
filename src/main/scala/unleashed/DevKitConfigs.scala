// See LICENSE for license details.
package sifive.freedom.unleashed

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.system._
import freechips.rocketchip.tile._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._
import sifive.blocks.devices.nvmmctr._

// Default FreedomU500Config
class FreedomU500Config extends Config(
  new WithJtagDTM            ++
  new WithNMemoryChannels(1) ++
  new WithExtMemSize(0x100000000L) ++
  new WithInclusiveCache(nWays=16, capacityKB=2048) ++  // Sifive L2 cache (default: 512 KiB, 8-way)
  new WithL1ICacheWays(4)    ++  // nWays (default: 4)
  new WithL1ICacheSets(64)   ++  // nSets (default: 64)
  new WithL1DCacheWays(8)    ++  // nWays (default: 4)
  new WithL1DCacheSets(64)   ++  // nSets (default: 64)
   new WithNBigCores(4)       ++
  new BaseConfig
)

// Freedom U500 Dev Kit Peripherals
class U500DevKitPeripherals extends Config((site, here, up) => {
  case PeripheryUARTKey => List(
    UARTParams(address = BigInt(0x64000000L)))
  case PeripherySPIKey => List(
    SPIParams(rAddress = BigInt(0x64001000L)))
  case PeripheryGPIOKey => List(
    GPIOParams(address = BigInt(0x64002000L), width = 4))
  case PeripheryMaskROMKey => List(
    MaskROMParams(address = 0x78000000L, depth = 0x1e0000, name = "BootROM"))
  case PeripheryNVMMCTRKey => Some(NVMMCTRParams(address = 0x64003000L))
})

// Freedom U500 Dev Kit
class U500DevKitConfig extends Config(
  new WithNExtTopInterrupts(0)   ++
  new U500DevKitPeripherals ++
  new FreedomU500Config().alter((site,here,up) => {
    case SystemBusKey => up(SystemBusKey).copy()
      //errorDevice = Some(DevNullParams(
      //  Seq(AddressSet(0x3000, 0xfff)),
      //  maxAtomic=site(XLen)/8,
      //  maxTransfer=128,
      //  region = RegionType.TRACKED)))
    case PeripheryBusKey => up(PeripheryBusKey, site).copy(dtsFrequency =
    Some(BigDecimal(site(DevKitFPGAFrequencyKey)*1000000).setScale(0, BigDecimal.RoundingMode.HALF_UP).toBigInt))  
    case DTSTimebase => BigInt(1000000)
    case JtagDTMKey => new JtagDTMConfig (
      idcodeVersion = 2,      // 1 was legacy (FE310-G000, Acai).
      idcodePartNum = 0x000,  // Decided to simplify.
      idcodeManufId = 0x489,  // As Assigned by JEDEC to SiFive. Only used in wrappers / test harnesses.
      debugIdleCycles = 5)    // Reasonable guess for synchronization
  })
)

`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT
`define RANDOM 0
// 347036 - 347355

module VC707PCIeShell(
  input         sys_clock_p,
  input         sys_clock_n,
  inout         jtag_jtag_TCK,
  inout         jtag_jtag_TMS,
  inout         jtag_jtag_TDI,
  inout         jtag_jtag_TDO,
  inout         jtag_srst_n,
  inout         uart_txd,
  inout         uart_rxd,
  inout         uart_rtsn,
  inout         uart_ctsn,
  output        sdio_sdio_clk,
  output        sdio_sdio_cmd,
  input         sdio_sdio_dat_0,
  inout         sdio_sdio_dat_1,
  inout         sdio_sdio_dat_2,
  output        sdio_sdio_dat_3,
  output [15:0] ddr_ddr3_addr,
  output [2:0]  ddr_ddr3_ba,
  output        ddr_ddr3_ras_n,
  output        ddr_ddr3_cas_n,
  output        ddr_ddr3_we_n,
  output        ddr_ddr3_reset_n,
  output        ddr_ddr3_ck_p,
  output        ddr_ddr3_ck_n,
  output        ddr_ddr3_cke,
  output        ddr_ddr3_cs_n,
  output [7:0]  ddr_ddr3_dm,
  output        ddr_ddr3_odt,
  inout  [63:0] ddr_ddr3_dq,
  inout  [7:0]  ddr_ddr3_dqs_n,
  inout  [7:0]  ddr_ddr3_dqs_p,
  //input  [2:0]  ddr_nvmm_begin,
  //input  [7:0]  ddr_lat_fr,
  //input  [7:0]  ddr_lat_fw,
  //output [63:0] ddr_cnt_act,
  output        pcie_pci_exp_txp,
  output        pcie_pci_exp_txn,
  input         pcie_pci_exp_rxp,
  input         pcie_pci_exp_rxn,
  input         pcie_REFCLK_rxp,
  input         pcie_REFCLK_rxn,
  output        led_0,
  output        led_1,
  output        led_2,
  output        led_3,
  output        led_4,
  output        led_5,
  output        led_6,
  output        led_7,
  input         reset
);
  wire  topDesign_auto_topMod_led_source_out_7;
  wire  topDesign_auto_topMod_led_source_out_6;
  wire  topDesign_auto_topMod_led_source_out_5;
  wire  topDesign_auto_topMod_led_source_out_4;
  wire  topDesign_auto_topMod_led_source_out_3;
  wire  topDesign_auto_topMod_led_source_out_2;
  wire  topDesign_auto_topMod_led_source_out_1;
  wire  topDesign_auto_topMod_led_source_out_0;
  wire  topDesign_auto_topMod_io_out_1_port_REFCLK_rxp;
  wire  topDesign_auto_topMod_io_out_1_port_REFCLK_rxn;
  wire  topDesign_auto_topMod_io_out_1_port_pci_exp_txp;
  wire  topDesign_auto_topMod_io_out_1_port_pci_exp_txn;
  wire  topDesign_auto_topMod_io_out_1_port_pci_exp_rxp;
  wire  topDesign_auto_topMod_io_out_1_port_pci_exp_rxn;
  wire  topDesign_auto_topMod_io_out_1_port_axi_aresetn;
  wire  topDesign_auto_topMod_io_out_1_port_axi_aclk_out;
  wire  topDesign_auto_topMod_io_out_1_port_mmcm_lock;
  wire [15:0] topDesign_auto_topMod_io_out_0_port_ddr3_addr;
  wire [2:0] topDesign_auto_topMod_io_out_0_port_ddr3_ba;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_ras_n;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_cas_n;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_we_n;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_reset_n;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_ck_p;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_ck_n;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_cke;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_cs_n;
  wire [7:0] topDesign_auto_topMod_io_out_0_port_ddr3_dm;
  wire  topDesign_auto_topMod_io_out_0_port_ddr3_odt;
  //wire [2:0] topDesign_auto_topMod_io_out_0_port_nvmm_begin;
  //wire [7:0] topDesign_auto_topMod_io_out_0_port_lat_fr;
  //wire [7:0] topDesign_auto_topMod_io_out_0_port_lat_fw;
  //wire [63:0] topDesign_auto_topMod_io_out_0_port_cnt_act;
  wire  topDesign_auto_topMod_io_out_0_port_sys_clk_i;
  wire  topDesign_auto_topMod_io_out_0_port_ui_clk;
  wire  topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst;
  wire  topDesign_auto_topMod_io_out_0_port_mmcm_locked;
  wire  topDesign_auto_topMod_io_out_0_port_aresetn;
  wire  topDesign_auto_topMod_io_out_0_port_sys_rst;
  wire  topDesign_auto_topMod_spi_source_out_sck;
  wire  topDesign_auto_topMod_spi_source_out_dq_0_o;
  wire  topDesign_auto_topMod_spi_source_out_dq_1_i;
  wire  topDesign_auto_topMod_spi_source_out_cs_0;
  wire  topDesign_auto_topMod_uart_source_out_txd;
  wire  topDesign_auto_topMod_uart_source_out_rxd;
  wire  topDesign_auto_wrangler_in_1_clock;
  wire  topDesign_auto_wrangler_in_1_reset;
  wire  topDesign_auto_wrangler_in_0_clock;
  wire  topDesign_auto_wrangler_in_0_reset;
  wire  topDesign_auto_wrangler_out_1_reset;
  wire  topDesign_auto_wrangler_out_0_reset;
  wire  topDesign_auto_coreGroup_in_member_0_clock;
  wire  topDesign_auto_coreGroup_in_member_0_reset;
  wire  topDesign_auto_jtag_debug_source_out_TCK;
  wire  topDesign_auto_jtag_debug_source_out_TMS;
  wire  topDesign_auto_jtag_debug_source_out_TDI;
  wire  topDesign_auto_jtag_debug_source_out_TDO_data;
  wire  corePLL_clk_in1;
  wire  corePLL_clk_out1;
  wire  corePLL_reset;
  wire  corePLL_locked;
  wire  sys_clock_ibufds_O;
  wire  sys_clock_ibufds_I;
  wire  sys_clock_ibufds_IB;
  wire  AnalogToUInt_b;
  wire  AnalogToUInt_1_b;
  wire  AnalogToUInt_2_b;
  wire  UIntToAnalog_b;
  wire  UIntToAnalog_b_en;
  wire  AnalogToUInt_3_b;
  wire  UIntToAnalog_1_b;
  wire  UIntToAnalog_1_b_en;
  wire  AnalogToUInt_4_b;
  wire  reset_ibuf_O;
  wire  reset_ibuf_I;
  wire  fpga_power_on_clock;
  wire  fpga_power_on_power_on_reset;
  wire  _T_22;
  wire  _T_36;
  wire  _T_25;
  wire  _T_8_port_mmcm_locked;
  wire  _T_29;
  wire  _T_8_port_ui_clk_sync_rst;
  wire  _T_1_clock;
  wire  _T_10_reset;
  wire  _T_11_port_mmcm_lock;
  wire  _T_13_reset;
  DevKitWrapper topDesign (
    .auto_topMod_led_source_out_7(topDesign_auto_topMod_led_source_out_7),
    .auto_topMod_led_source_out_6(topDesign_auto_topMod_led_source_out_6),
    .auto_topMod_led_source_out_5(topDesign_auto_topMod_led_source_out_5),
    .auto_topMod_led_source_out_4(topDesign_auto_topMod_led_source_out_4),
    .auto_topMod_led_source_out_3(topDesign_auto_topMod_led_source_out_3),
    .auto_topMod_led_source_out_2(topDesign_auto_topMod_led_source_out_2),
    .auto_topMod_led_source_out_1(topDesign_auto_topMod_led_source_out_1),
    .auto_topMod_led_source_out_0(topDesign_auto_topMod_led_source_out_0),
    .auto_topMod_io_out_1_port_REFCLK_rxp(topDesign_auto_topMod_io_out_1_port_REFCLK_rxp),
    .auto_topMod_io_out_1_port_REFCLK_rxn(topDesign_auto_topMod_io_out_1_port_REFCLK_rxn),
    .auto_topMod_io_out_1_port_pci_exp_txp(topDesign_auto_topMod_io_out_1_port_pci_exp_txp),
    .auto_topMod_io_out_1_port_pci_exp_txn(topDesign_auto_topMod_io_out_1_port_pci_exp_txn),
    .auto_topMod_io_out_1_port_pci_exp_rxp(topDesign_auto_topMod_io_out_1_port_pci_exp_rxp),
    .auto_topMod_io_out_1_port_pci_exp_rxn(topDesign_auto_topMod_io_out_1_port_pci_exp_rxn),
    .auto_topMod_io_out_1_port_axi_aresetn(topDesign_auto_topMod_io_out_1_port_axi_aresetn),
    .auto_topMod_io_out_1_port_axi_aclk_out(topDesign_auto_topMod_io_out_1_port_axi_aclk_out),
    .auto_topMod_io_out_1_port_mmcm_lock(topDesign_auto_topMod_io_out_1_port_mmcm_lock),
    .auto_topMod_io_out_0_port_ddr3_addr(topDesign_auto_topMod_io_out_0_port_ddr3_addr),
    .auto_topMod_io_out_0_port_ddr3_ba(topDesign_auto_topMod_io_out_0_port_ddr3_ba),
    .auto_topMod_io_out_0_port_ddr3_ras_n(topDesign_auto_topMod_io_out_0_port_ddr3_ras_n),
    .auto_topMod_io_out_0_port_ddr3_cas_n(topDesign_auto_topMod_io_out_0_port_ddr3_cas_n),
    .auto_topMod_io_out_0_port_ddr3_we_n(topDesign_auto_topMod_io_out_0_port_ddr3_we_n),
    .auto_topMod_io_out_0_port_ddr3_reset_n(topDesign_auto_topMod_io_out_0_port_ddr3_reset_n),
    .auto_topMod_io_out_0_port_ddr3_ck_p(topDesign_auto_topMod_io_out_0_port_ddr3_ck_p),
    .auto_topMod_io_out_0_port_ddr3_ck_n(topDesign_auto_topMod_io_out_0_port_ddr3_ck_n),
    .auto_topMod_io_out_0_port_ddr3_cke(topDesign_auto_topMod_io_out_0_port_ddr3_cke),
    .auto_topMod_io_out_0_port_ddr3_cs_n(topDesign_auto_topMod_io_out_0_port_ddr3_cs_n),
    .auto_topMod_io_out_0_port_ddr3_dm(topDesign_auto_topMod_io_out_0_port_ddr3_dm),
    .auto_topMod_io_out_0_port_ddr3_odt(topDesign_auto_topMod_io_out_0_port_ddr3_odt),
    .auto_topMod_io_out_0_port_ddr3_dq(ddr_ddr3_dq),
    .auto_topMod_io_out_0_port_ddr3_dqs_n(ddr_ddr3_dqs_n),
    .auto_topMod_io_out_0_port_ddr3_dqs_p(ddr_ddr3_dqs_p),
    //.auto_topMod_io_out_0_port_nvmm_begin(topDesign_auto_topMod_io_out_0_port_nvmm_begin),
    //.auto_topMod_io_out_0_port_lat_fr(topDesign_auto_topMod_io_out_0_port_lat_fr),
    //.auto_topMod_io_out_0_port_lat_fw(topDesign_auto_topMod_io_out_0_port_lat_fw),
    //.auto_topMod_io_out_0_port_cnt_act(topDesign_auto_topMod_io_out_0_port_cnt_act),
    .auto_topMod_io_out_0_port_sys_clk_i(topDesign_auto_topMod_io_out_0_port_sys_clk_i),
    .auto_topMod_io_out_0_port_ui_clk(topDesign_auto_topMod_io_out_0_port_ui_clk),
    .auto_topMod_io_out_0_port_ui_clk_sync_rst(topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst),
    .auto_topMod_io_out_0_port_mmcm_locked(topDesign_auto_topMod_io_out_0_port_mmcm_locked),
    .auto_topMod_io_out_0_port_aresetn(topDesign_auto_topMod_io_out_0_port_aresetn),
    .auto_topMod_io_out_0_port_sys_rst(topDesign_auto_topMod_io_out_0_port_sys_rst),
    .auto_topMod_spi_source_out_sck(topDesign_auto_topMod_spi_source_out_sck),
    .auto_topMod_spi_source_out_dq_0_o(topDesign_auto_topMod_spi_source_out_dq_0_o),
    .auto_topMod_spi_source_out_dq_1_i(topDesign_auto_topMod_spi_source_out_dq_1_i),
    .auto_topMod_spi_source_out_cs_0(topDesign_auto_topMod_spi_source_out_cs_0),
    .auto_topMod_uart_source_out_txd(topDesign_auto_topMod_uart_source_out_txd),
    .auto_topMod_uart_source_out_rxd(topDesign_auto_topMod_uart_source_out_rxd),
    .auto_wrangler_in_1_clock(topDesign_auto_wrangler_in_1_clock),
    .auto_wrangler_in_1_reset(topDesign_auto_wrangler_in_1_reset),
    .auto_wrangler_in_0_clock(topDesign_auto_wrangler_in_0_clock),
    .auto_wrangler_in_0_reset(topDesign_auto_wrangler_in_0_reset),
    .auto_wrangler_out_1_reset(topDesign_auto_wrangler_out_1_reset),
    .auto_wrangler_out_0_reset(topDesign_auto_wrangler_out_0_reset),
    .auto_coreGroup_in_member_0_clock(topDesign_auto_coreGroup_in_member_0_clock),
    .auto_coreGroup_in_member_0_reset(topDesign_auto_coreGroup_in_member_0_reset),
    .auto_jtag_debug_source_out_TCK(topDesign_auto_jtag_debug_source_out_TCK),
    .auto_jtag_debug_source_out_TMS(topDesign_auto_jtag_debug_source_out_TMS),
    .auto_jtag_debug_source_out_TDI(topDesign_auto_jtag_debug_source_out_TDI),
    .auto_jtag_debug_source_out_TDO_data(topDesign_auto_jtag_debug_source_out_TDO_data)
  );
  AnalogToUInt AnalogToUInt (
    .a(jtag_jtag_TCK),
    .b(AnalogToUInt_b)
  );
  AnalogToUInt AnalogToUInt_1 (
    .a(jtag_jtag_TMS),
    .b(AnalogToUInt_1_b)
  );
  AnalogToUInt AnalogToUInt_2 (
    .a(jtag_jtag_TDI),
    .b(AnalogToUInt_2_b)
  );
  UIntToAnalog UIntToAnalog (
    .a(jtag_jtag_TDO),
    .b(UIntToAnalog_b),
    .b_en(UIntToAnalog_b_en)
  );
  AnalogToUInt AnalogToUInt_3 (
    .a(jtag_srst_n),
    .b(AnalogToUInt_3_b)
  );
  UIntToAnalog UIntToAnalog_1 (
    .a(uart_txd),
    .b(UIntToAnalog_1_b),
    .b_en(UIntToAnalog_1_b_en)
  );
  AnalogToUInt AnalogToUInt_4 (
    .a(uart_rxd),
    .b(AnalogToUInt_4_b)
  );

   /* Generate Clock
    *
    * Clock Flow
    *  sys_clock_ibufds_I  =  sys_clock_p
    *  sys_clock_ibufds_O <-- sys_clock_ibufds_I
    *  sys_clk_i           =  sys_clock_ibufds_O
    *
    * corePLL_clk_in1      = sys_clock_ibufds_O
    * corePLL_clk_out1    <-- corePLL_clk_in1
    * coreGroup_clock      =  corePLL_clk_out1
    */
   assign sys_clock_ibufds_O = sys_clock_n;
   assign corePLL_clk_out1   = sys_clock_p;
   assign reset_ibuf_O       = reset_ibuf_I;
   assign corePLL_locked     = 1'b1;

  PowerOnResetFPGAOnly fpga_power_on (
    .clock(fpga_power_on_clock),
    .power_on_reset(fpga_power_on_power_on_reset)
  );
  assign _T_22 = corePLL_locked == 1'h0;
  assign _T_36 = reset_ibuf_O | fpga_power_on_power_on_reset;
  assign _T_25 = AnalogToUInt_b;
  assign _T_8_port_mmcm_locked = topDesign_auto_topMod_io_out_0_port_mmcm_locked;
  assign _T_29 = _T_8_port_mmcm_locked == 1'h0;
  assign _T_8_port_ui_clk_sync_rst = topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst;
  assign _T_1_clock = sys_clock_ibufds_O;
  assign _T_10_reset = topDesign_auto_wrangler_out_0_reset;
  assign _T_11_port_mmcm_lock = topDesign_auto_topMod_io_out_1_port_mmcm_lock;
  assign _T_13_reset = topDesign_auto_wrangler_out_1_reset;
  assign sdio_sdio_clk = topDesign_auto_topMod_spi_source_out_sck;
  assign sdio_sdio_cmd = topDesign_auto_topMod_spi_source_out_dq_0_o;
  assign sdio_sdio_dat_3 = topDesign_auto_topMod_spi_source_out_cs_0;
  assign ddr_ddr3_addr = topDesign_auto_topMod_io_out_0_port_ddr3_addr;
  assign ddr_ddr3_ba = topDesign_auto_topMod_io_out_0_port_ddr3_ba;
  assign ddr_ddr3_ras_n = topDesign_auto_topMod_io_out_0_port_ddr3_ras_n;
  assign ddr_ddr3_cas_n = topDesign_auto_topMod_io_out_0_port_ddr3_cas_n;
  assign ddr_ddr3_we_n = topDesign_auto_topMod_io_out_0_port_ddr3_we_n;
  assign ddr_ddr3_reset_n = topDesign_auto_topMod_io_out_0_port_ddr3_reset_n;
  assign ddr_ddr3_ck_p = topDesign_auto_topMod_io_out_0_port_ddr3_ck_p;
  assign ddr_ddr3_ck_n = topDesign_auto_topMod_io_out_0_port_ddr3_ck_n;
  assign ddr_ddr3_cke = topDesign_auto_topMod_io_out_0_port_ddr3_cke;
  assign ddr_ddr3_cs_n = topDesign_auto_topMod_io_out_0_port_ddr3_cs_n;
  assign ddr_ddr3_dm = topDesign_auto_topMod_io_out_0_port_ddr3_dm;
  assign ddr_ddr3_odt = topDesign_auto_topMod_io_out_0_port_ddr3_odt;
  //assign ddr_cnt_act = topDesign_auto_topMod_io_out_0_port_cnt_act;
  assign pcie_pci_exp_txp = topDesign_auto_topMod_io_out_1_port_pci_exp_txp;
  assign pcie_pci_exp_txn = topDesign_auto_topMod_io_out_1_port_pci_exp_txn;
  assign led_0 = topDesign_auto_topMod_led_source_out_0;
  assign led_1 = topDesign_auto_topMod_led_source_out_1;
  assign led_2 = topDesign_auto_topMod_led_source_out_2;
  assign led_3 = topDesign_auto_topMod_led_source_out_3;
  assign led_4 = topDesign_auto_topMod_led_source_out_4;
  assign led_5 = topDesign_auto_topMod_led_source_out_5;
  assign led_6 = topDesign_auto_topMod_led_source_out_6;
  assign led_7 = topDesign_auto_topMod_led_source_out_7;
  assign topDesign_auto_topMod_io_out_1_port_REFCLK_rxp = pcie_REFCLK_rxp;
  assign topDesign_auto_topMod_io_out_1_port_REFCLK_rxn = pcie_REFCLK_rxn;
  assign topDesign_auto_topMod_io_out_1_port_pci_exp_rxp = pcie_pci_exp_rxp;
  assign topDesign_auto_topMod_io_out_1_port_pci_exp_rxn = pcie_pci_exp_rxn;
  assign topDesign_auto_topMod_io_out_1_port_axi_aresetn = _T_13_reset == 1'h0;
  //assign topDesign_auto_topMod_io_out_0_port_nvmm_begin = ddr_nvmm_begin;
  //assign topDesign_auto_topMod_io_out_0_port_lat_fr = ddr_lat_fr;
  //assign topDesign_auto_topMod_io_out_0_port_lat_fw = ddr_lat_fw;
  assign topDesign_auto_topMod_io_out_0_port_sys_clk_i = $unsigned(_T_1_clock);
  assign topDesign_auto_topMod_io_out_0_port_aresetn = _T_10_reset == 1'h0;
  assign topDesign_auto_topMod_io_out_0_port_sys_rst = reset_ibuf_O | fpga_power_on_power_on_reset;
  assign topDesign_auto_topMod_spi_source_out_dq_1_i = sdio_sdio_dat_0;
  assign topDesign_auto_topMod_uart_source_out_rxd = AnalogToUInt_4_b;
  assign topDesign_auto_wrangler_in_1_clock = topDesign_auto_topMod_io_out_1_port_axi_aclk_out;
  assign topDesign_auto_wrangler_in_1_reset = _T_11_port_mmcm_lock == 1'h0;
  assign topDesign_auto_wrangler_in_0_clock = topDesign_auto_topMod_io_out_0_port_ui_clk;
  assign topDesign_auto_wrangler_in_0_reset = _T_29 | _T_8_port_ui_clk_sync_rst;
  assign topDesign_auto_coreGroup_in_member_0_clock = corePLL_clk_out1;
  assign topDesign_auto_coreGroup_in_member_0_reset = _T_22 | _T_36;
  assign topDesign_auto_jtag_debug_source_out_TCK = _T_25;
  assign topDesign_auto_jtag_debug_source_out_TMS = AnalogToUInt_1_b;
  assign topDesign_auto_jtag_debug_source_out_TDI = AnalogToUInt_2_b;
  assign corePLL_clk_in1 = sys_clock_ibufds_O;
  assign corePLL_reset = reset_ibuf_O | fpga_power_on_power_on_reset;
  assign sys_clock_ibufds_I = sys_clock_p;
  assign sys_clock_ibufds_IB = sys_clock_n;
  assign UIntToAnalog_b = topDesign_auto_jtag_debug_source_out_TDO_data;
  assign UIntToAnalog_b_en = 1'h0;
  assign UIntToAnalog_1_b = topDesign_auto_topMod_uart_source_out_txd;
  assign UIntToAnalog_1_b_en = 1'h1;
  assign reset_ibuf_I = reset;
  assign fpga_power_on_clock = sys_clock_ibufds_O;
endmodule

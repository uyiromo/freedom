// 289555 - 289911

module VC707AXIToPCIeX1(
  output        auto_int_out_0,
  input         auto_master_out_aw_ready,
  output        auto_master_out_aw_valid,
  output [37:0] auto_master_out_aw_bits_addr,
  output [7:0]  auto_master_out_aw_bits_len,
  output [2:0]  auto_master_out_aw_bits_size,
  output [1:0]  auto_master_out_aw_bits_burst,
  input         auto_master_out_w_ready,
  output        auto_master_out_w_valid,
  output [63:0] auto_master_out_w_bits_data,
  output [7:0]  auto_master_out_w_bits_strb,
  output        auto_master_out_w_bits_last,
  output        auto_master_out_b_ready,
  input         auto_master_out_b_valid,
  input  [1:0]  auto_master_out_b_bits_resp,
  input         auto_master_out_ar_ready,
  output        auto_master_out_ar_valid,
  output [37:0] auto_master_out_ar_bits_addr,
  output [7:0]  auto_master_out_ar_bits_len,
  output [2:0]  auto_master_out_ar_bits_size,
  output [1:0]  auto_master_out_ar_bits_burst,
  output        auto_master_out_r_ready,
  input         auto_master_out_r_valid,
  input  [63:0] auto_master_out_r_bits_data,
  input  [1:0]  auto_master_out_r_bits_resp,
  input         auto_master_out_r_bits_last,
  output        auto_control_in_aw_ready,
  input         auto_control_in_aw_valid,
  input  [37:0] auto_control_in_aw_bits_addr,
  output        auto_control_in_w_ready,
  input         auto_control_in_w_valid,
  input  [31:0] auto_control_in_w_bits_data,
  input  [3:0]  auto_control_in_w_bits_strb,
  input         auto_control_in_b_ready,
  output        auto_control_in_b_valid,
  output [1:0]  auto_control_in_b_bits_resp,
  output        auto_control_in_ar_ready,
  input         auto_control_in_ar_valid,
  input  [37:0] auto_control_in_ar_bits_addr,
  input         auto_control_in_r_ready,
  output        auto_control_in_r_valid,
  output [31:0] auto_control_in_r_bits_data,
  output [1:0]  auto_control_in_r_bits_resp,
  output        auto_slave_in_aw_ready,
  input         auto_slave_in_aw_valid,
  input  [3:0]  auto_slave_in_aw_bits_id,
  input  [30:0] auto_slave_in_aw_bits_addr,
  input  [7:0]  auto_slave_in_aw_bits_len,
  input  [2:0]  auto_slave_in_aw_bits_size,
  input  [1:0]  auto_slave_in_aw_bits_burst,
  output        auto_slave_in_w_ready,
  input         auto_slave_in_w_valid,
  input  [63:0] auto_slave_in_w_bits_data,
  input  [7:0]  auto_slave_in_w_bits_strb,
  input         auto_slave_in_w_bits_last,
  input         auto_slave_in_b_ready,
  output        auto_slave_in_b_valid,
  output [3:0]  auto_slave_in_b_bits_id,
  output [1:0]  auto_slave_in_b_bits_resp,
  output        auto_slave_in_ar_ready,
  input         auto_slave_in_ar_valid,
  input  [3:0]  auto_slave_in_ar_bits_id,
  input  [30:0] auto_slave_in_ar_bits_addr,
  input  [7:0]  auto_slave_in_ar_bits_len,
  input  [2:0]  auto_slave_in_ar_bits_size,
  input  [1:0]  auto_slave_in_ar_bits_burst,
  input         auto_slave_in_r_ready,
  output        auto_slave_in_r_valid,
  output [3:0]  auto_slave_in_r_bits_id,
  output [63:0] auto_slave_in_r_bits_data,
  output [1:0]  auto_slave_in_r_bits_resp,
  output        auto_slave_in_r_bits_last,
  output        io_port_pci_exp_txp,
  output        io_port_pci_exp_txn,
  input         io_port_pci_exp_rxp,
  input         io_port_pci_exp_rxn,
  input         io_port_axi_aresetn,
  output        io_port_axi_aclk_out,
  output        io_port_mmcm_lock,
  input         io_REFCLK
);
  wire  blackbox_pci_exp_txp;
  wire  blackbox_pci_exp_txn;
  wire  blackbox_pci_exp_rxp;
  wire  blackbox_pci_exp_rxn;
  wire  blackbox_axi_aresetn;
  wire  blackbox_axi_aclk_out;
  wire  blackbox_axi_ctl_aclk_out;
  wire  blackbox_mmcm_lock;
  wire  blackbox_REFCLK;
  wire  blackbox_INTX_MSI_Request;
  wire  blackbox_INTX_MSI_Grant;
  wire  blackbox_MSI_enable;
  wire [4:0] blackbox_MSI_Vector_Num;
  wire [2:0] blackbox_MSI_Vector_Width;
  wire  blackbox_interrupt_out;
  wire [3:0] blackbox_s_axi_awid;
  wire [31:0] blackbox_s_axi_awaddr;
  wire [3:0] blackbox_s_axi_awregion;
  wire [7:0] blackbox_s_axi_awlen;
  wire [2:0] blackbox_s_axi_awsize;
  wire [1:0] blackbox_s_axi_awburst;
  wire  blackbox_s_axi_awvalid;
  wire  blackbox_s_axi_awready;
  wire [63:0] blackbox_s_axi_wdata;
  wire [7:0] blackbox_s_axi_wstrb;
  wire  blackbox_s_axi_wlast;
  wire  blackbox_s_axi_wvalid;
  wire  blackbox_s_axi_wready;
  wire  blackbox_s_axi_bready;
  wire [3:0] blackbox_s_axi_bid;
  wire [1:0] blackbox_s_axi_bresp;
  wire  blackbox_s_axi_bvalid;
  wire [3:0] blackbox_s_axi_arid;
  wire [31:0] blackbox_s_axi_araddr;
  wire [3:0] blackbox_s_axi_arregion;
  wire [7:0] blackbox_s_axi_arlen;
  wire [2:0] blackbox_s_axi_arsize;
  wire [1:0] blackbox_s_axi_arburst;
  wire  blackbox_s_axi_arvalid;
  wire  blackbox_s_axi_arready;
  wire  blackbox_s_axi_rready;
  wire [3:0] blackbox_s_axi_rid;
  wire [63:0] blackbox_s_axi_rdata;
  wire [1:0] blackbox_s_axi_rresp;
  wire  blackbox_s_axi_rlast;
  wire  blackbox_s_axi_rvalid;
  wire [31:0] blackbox_m_axi_awaddr;
  wire [7:0] blackbox_m_axi_awlen;
  wire [2:0] blackbox_m_axi_awsize;
  wire [1:0] blackbox_m_axi_awburst;
  wire  blackbox_m_axi_awlock;
  wire [3:0] blackbox_m_axi_awcache;
  wire [2:0] blackbox_m_axi_awprot;
  wire  blackbox_m_axi_awvalid;
  wire  blackbox_m_axi_awready;
  wire [63:0] blackbox_m_axi_wdata;
  wire [7:0] blackbox_m_axi_wstrb;
  wire  blackbox_m_axi_wlast;
  wire  blackbox_m_axi_wvalid;
  wire  blackbox_m_axi_wready;
  wire  blackbox_m_axi_bready;
  wire [1:0] blackbox_m_axi_bresp;
  wire  blackbox_m_axi_bvalid;
  wire [31:0] blackbox_m_axi_araddr;
  wire [7:0] blackbox_m_axi_arlen;
  wire [2:0] blackbox_m_axi_arsize;
  wire [1:0] blackbox_m_axi_arburst;
  wire  blackbox_m_axi_arlock;
  wire [3:0] blackbox_m_axi_arcache;
  wire [2:0] blackbox_m_axi_arprot;
  wire  blackbox_m_axi_arvalid;
  wire  blackbox_m_axi_arready;
  wire  blackbox_m_axi_rready;
  wire [63:0] blackbox_m_axi_rdata;
  wire [1:0] blackbox_m_axi_rresp;
  wire  blackbox_m_axi_rlast;
  wire  blackbox_m_axi_rvalid;
  wire [31:0] blackbox_s_axi_ctl_awaddr;
  wire  blackbox_s_axi_ctl_awvalid;
  wire  blackbox_s_axi_ctl_awready;
  wire [31:0] blackbox_s_axi_ctl_wdata;
  wire [3:0] blackbox_s_axi_ctl_wstrb;
  wire  blackbox_s_axi_ctl_wvalid;
  wire  blackbox_s_axi_ctl_wready;
  wire [1:0] blackbox_s_axi_ctl_bresp;
  wire  blackbox_s_axi_ctl_bvalid;
  wire  blackbox_s_axi_ctl_bready;
  wire [31:0] blackbox_s_axi_ctl_araddr;
  wire  blackbox_s_axi_ctl_arvalid;
  wire  blackbox_s_axi_ctl_arready;
  wire [31:0] blackbox_s_axi_ctl_rdata;
  wire [1:0] blackbox_s_axi_ctl_rresp;
  wire  blackbox_s_axi_ctl_rvalid;
  wire  blackbox_s_axi_ctl_rready;
  assign auto_int_out_0 = blackbox_interrupt_out;
  assign auto_master_out_aw_valid = blackbox_m_axi_awvalid;
  assign auto_master_out_aw_bits_addr = {{6'd0}, blackbox_m_axi_awaddr};
  assign auto_master_out_aw_bits_len = blackbox_m_axi_awlen;
  assign auto_master_out_aw_bits_size = blackbox_m_axi_awsize;
  assign auto_master_out_aw_bits_burst = blackbox_m_axi_awburst;
  assign auto_master_out_w_valid = blackbox_m_axi_wvalid;
  assign auto_master_out_w_bits_data = blackbox_m_axi_wdata;
  assign auto_master_out_w_bits_strb = blackbox_m_axi_wstrb;
  assign auto_master_out_w_bits_last = blackbox_m_axi_wlast;
  assign auto_master_out_b_ready = blackbox_m_axi_bready;
  assign auto_master_out_ar_valid = blackbox_m_axi_arvalid;
  assign auto_master_out_ar_bits_addr = {{6'd0}, blackbox_m_axi_araddr};
  assign auto_master_out_ar_bits_len = blackbox_m_axi_arlen;
  assign auto_master_out_ar_bits_size = blackbox_m_axi_arsize;
  assign auto_master_out_ar_bits_burst = blackbox_m_axi_arburst;
  assign auto_master_out_r_ready = blackbox_m_axi_rready;
  assign auto_control_in_aw_ready = blackbox_s_axi_ctl_awready;
  assign auto_control_in_w_ready = blackbox_s_axi_ctl_wready;
  assign auto_control_in_b_valid = blackbox_s_axi_ctl_bvalid;
  assign auto_control_in_b_bits_resp = blackbox_s_axi_ctl_bresp;
  assign auto_control_in_ar_ready = blackbox_s_axi_ctl_arready;
  assign auto_control_in_r_valid = blackbox_s_axi_ctl_rvalid;
  assign auto_control_in_r_bits_data = blackbox_s_axi_ctl_rdata;
  assign auto_control_in_r_bits_resp = blackbox_s_axi_ctl_rresp;
  assign auto_slave_in_aw_ready = blackbox_s_axi_awready;
  assign auto_slave_in_w_ready = blackbox_s_axi_wready;
  assign auto_slave_in_b_valid = blackbox_s_axi_bvalid;
  assign auto_slave_in_b_bits_id = blackbox_s_axi_bid;
  assign auto_slave_in_b_bits_resp = blackbox_s_axi_bresp;
  assign auto_slave_in_ar_ready = blackbox_s_axi_arready;
  assign auto_slave_in_r_valid = blackbox_s_axi_rvalid;
  assign auto_slave_in_r_bits_id = blackbox_s_axi_rid;
  assign auto_slave_in_r_bits_data = blackbox_s_axi_rdata;
  assign auto_slave_in_r_bits_resp = blackbox_s_axi_rresp;
  assign auto_slave_in_r_bits_last = blackbox_s_axi_rlast;
  assign io_port_pci_exp_txp = blackbox_pci_exp_txp;
  assign io_port_pci_exp_txn = blackbox_pci_exp_txn;
  assign io_port_axi_aclk_out = blackbox_axi_aclk_out;
  assign io_port_mmcm_lock = blackbox_mmcm_lock;
  assign blackbox_pci_exp_rxp = io_port_pci_exp_rxp;
  assign blackbox_pci_exp_rxn = io_port_pci_exp_rxn;
  assign blackbox_axi_aresetn = io_port_axi_aresetn;
  assign blackbox_REFCLK = io_REFCLK;
  assign blackbox_INTX_MSI_Request = 1'h0;
  assign blackbox_MSI_Vector_Num = 5'h0;
  assign blackbox_s_axi_awid = auto_slave_in_aw_bits_id;
  assign blackbox_s_axi_awaddr = {{1'd0}, auto_slave_in_aw_bits_addr};
  assign blackbox_s_axi_awregion = 4'h0;
  assign blackbox_s_axi_awlen = auto_slave_in_aw_bits_len;
  assign blackbox_s_axi_awsize = auto_slave_in_aw_bits_size;
  assign blackbox_s_axi_awburst = auto_slave_in_aw_bits_burst;
  assign blackbox_s_axi_awvalid = auto_slave_in_aw_valid;
  assign blackbox_s_axi_wdata = auto_slave_in_w_bits_data;
  assign blackbox_s_axi_wstrb = auto_slave_in_w_bits_strb;
  assign blackbox_s_axi_wlast = auto_slave_in_w_bits_last;
  assign blackbox_s_axi_wvalid = auto_slave_in_w_valid;
  assign blackbox_s_axi_bready = auto_slave_in_b_ready;
  assign blackbox_s_axi_arid = auto_slave_in_ar_bits_id;
  assign blackbox_s_axi_araddr = {{1'd0}, auto_slave_in_ar_bits_addr};
  assign blackbox_s_axi_arregion = 4'h0;
  assign blackbox_s_axi_arlen = auto_slave_in_ar_bits_len;
  assign blackbox_s_axi_arsize = auto_slave_in_ar_bits_size;
  assign blackbox_s_axi_arburst = auto_slave_in_ar_bits_burst;
  assign blackbox_s_axi_arvalid = auto_slave_in_ar_valid;
  assign blackbox_s_axi_rready = auto_slave_in_r_ready;
  assign blackbox_m_axi_awready = auto_master_out_aw_ready;
  assign blackbox_m_axi_wready = auto_master_out_w_ready;
  assign blackbox_m_axi_bresp = auto_master_out_b_bits_resp;
  assign blackbox_m_axi_bvalid = auto_master_out_b_valid;
  assign blackbox_m_axi_arready = auto_master_out_ar_ready;
  assign blackbox_m_axi_rdata = auto_master_out_r_bits_data;
  assign blackbox_m_axi_rresp = auto_master_out_r_bits_resp;
  assign blackbox_m_axi_rlast = auto_master_out_r_bits_last;
  assign blackbox_m_axi_rvalid = auto_master_out_r_valid;
  assign blackbox_s_axi_ctl_awaddr = auto_control_in_aw_bits_addr[31:0];
  assign blackbox_s_axi_ctl_awvalid = auto_control_in_aw_valid;
  assign blackbox_s_axi_ctl_wdata = auto_control_in_w_bits_data;
  assign blackbox_s_axi_ctl_wstrb = auto_control_in_w_bits_strb;
  assign blackbox_s_axi_ctl_wvalid = auto_control_in_w_valid;
  assign blackbox_s_axi_ctl_bready = auto_control_in_b_ready;
  assign blackbox_s_axi_ctl_araddr = auto_control_in_ar_bits_addr[31:0];
  assign blackbox_s_axi_ctl_arvalid = auto_control_in_ar_valid;
  assign blackbox_s_axi_ctl_rready = auto_control_in_r_ready;

  assign blackbox_mmcm_lock = 1'b1;

endmodule

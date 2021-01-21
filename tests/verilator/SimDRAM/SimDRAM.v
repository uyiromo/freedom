import "DPI-C" function chandle memory_init
(
  input longint mem_size,
  input longint word_size,
  input longint line_size,
  input longint id_bits
);

import "DPI-C" function void memory_tick
(
  input chandle  channel,

  input bit      reset,

  input int      lat_fr,
  input int      lat_fw,
  input int      nvmm_begin,
  output longint cnt_act,
  output longint cnt_pre,

  input bit      ar_valid,
  output bit     ar_ready,
  input int      ar_addr,
  input int      ar_id,
  input int      ar_size,
  input int      ar_len,

  input bit      aw_valid,
  output bit     aw_ready,
  input int      aw_addr,
  input int      aw_id,
  input int      aw_size,
  input int      aw_len,

  input bit      w_valid,
  output bit     w_ready,
  input int      w_strb,
  input longint  w_data,
  input bit      w_last,

  output bit     r_valid,
  input bit      r_ready,
  output int     r_id,
  output int     r_resp,
  output longint r_data,
  output bit     r_last,

  output bit     b_valid,
  input bit      b_ready,
  output int     b_id,
  output int     b_resp
);

module SimDRAM #(
    parameter ADDR_BITS = 32, DATA_BITS = 64, ID_BITS = 4,
              MEM_SIZE = 1024 * 1024 * 1024,
              LINE_SIZE = 64,
              WORD_SIZE = DATA_BITS/8,
              STRB_BITS = DATA_BITS/8)(
  input                  sys_clk_i,
  input                  sys_rst,

  input [7:0]            lat_fr,
  input [7:0]            lat_fw,
  input [2:0]            nvmm_begin,
  output [63:0]          cnt_act,
  //output [63:0]          cnt_pre,

  input [ID_BITS-1:0]    s_axi_awid,
  input [ADDR_BITS-1:0]  s_axi_awaddr,
  input [7:0]            s_axi_awlen,
  input [2:0]            s_axi_awsize,
  input [1:0]            s_axi_awburst,
  input                  s_axi_awlock,
  input [3:0]            s_axi_awcache,
  input [2:0]            s_axi_awprot,
  input [3:0]            s_axi_awqos,
  input                  s_axi_awvalid,
  output                 s_axi_awready,

  input [DATA_BITS-1:0]  s_axi_wdata,
  input [STRB_BITS-1:0]  s_axi_wstrb,
  input                  s_axi_wlast,
  input                  s_axi_wvalid,
  output                 s_axi_wready,

  input                  s_axi_bready,
  output [ID_BITS-1:0]   s_axi_bid,
  output [1:0]           s_axi_bresp,
  output                 s_axi_bvalid,

  input [ID_BITS-1:0]    s_axi_arid,
  input [ADDR_BITS-1:0]  s_axi_araddr,
  input [7:0]            s_axi_arlen,
  input [2:0]            s_axi_arsize,
  input [1:0]            s_axi_arburst,
  input                  s_axi_arlock,
  input [3:0]            s_axi_arcache,
  input [2:0]            s_axi_arprot,
  input [3:0]            s_axi_arqos,
  input                  s_axi_arvalid,
  output                 s_axi_arready,

  input                  s_axi_rready,
  output [ID_BITS-1:0]   s_axi_rid,
  output [DATA_BITS-1:0] s_axi_rdata,
  output [1:0]           s_axi_rresp,
  output                 s_axi_rlast,
  output                 s_axi_rvalid
);

  reg initialized = 1'b0;
  chandle channel;

  wire [31:0] __lat_fr;
  wire [31:0] __lat_fw;
  wire [31:0] __nvmm_begin;

  reg [63:0] __cnt_act_reg;
  longint    __cnt_act;
  reg [63:0] __cnt_pre_reg;
  longint    __cnt_pre;

  wire __ar_valid;
  wire [31:0] __ar_addr;
  wire [31:0] __ar_id;
  wire [31:0] __ar_size;
  wire [31:0] __ar_len;

  wire __aw_valid;
  wire [31:0] __aw_addr;
  wire [31:0] __aw_id;
  wire [31:0] __aw_size;
  wire [31:0] __aw_len;

  wire __w_valid;
  wire [31:0] __w_strb;
  wire [63:0] __w_data;
  wire        __w_last;

  wire __r_ready;
  wire __b_ready;

  bit __ar_ready;
  bit __aw_ready;
  bit __w_ready;
  bit __r_valid;
  int __r_id;
  int __r_resp;
  longint __r_data;
  bit __r_last;
  bit __b_valid;
  int __b_id;
  int __b_resp;

  reg __ar_ready_reg;
  reg __aw_ready_reg;
  reg __w_ready_reg;
  reg __r_valid_reg;
  reg [ID_BITS-1:0] __r_id_reg;
  reg [1:0] __r_resp_reg;
  reg [DATA_BITS-1:0] __r_data_reg;
  reg __r_last_reg;
  reg __b_valid_reg;
  reg [ID_BITS-1:0] __b_id_reg;
  reg [1:0] __b_resp_reg;

  always @(posedge sys_clk_i) begin
    if (sys_rst) begin
      __ar_ready = 1'b0;
      __aw_ready = 1'b0;
      __w_ready  = 1'b0;
      __r_valid  = 1'b0;
      __b_valid  = 1'b0;

      __ar_ready_reg <= 1'b0;
      __aw_ready_reg <= 1'b0;
      __w_ready_reg  <= 1'b0;
      __r_valid_reg  <= 1'b0;
      __b_valid_reg  <= 1'b0;

       __cnt_act_reg <= 64'h0;
       __cnt_pre_reg <= 64'h0;

    end else begin
      if (!initialized) begin
        channel = memory_init(MEM_SIZE, WORD_SIZE, LINE_SIZE, ID_BITS);
        initialized = 1'b1;
      end

      memory_tick(
        channel,

        sys_rst,

        __lat_fr,
        __lat_fw,
        __nvmm_begin,
        __cnt_act,
        __cnt_pre,

        __ar_valid,
        __ar_ready,
        __ar_addr,
        __ar_id,
        __ar_size,
        __ar_len,

        __aw_valid,
        __aw_ready,
        __aw_addr,
        __aw_id,
        __aw_size,
        __aw_len,

        __w_valid,
        __w_ready,
        __w_strb,
        __w_data,
        __w_last,

        __r_valid,
        __r_ready,
        __r_id,
        __r_resp,
        __r_data,
        __r_last,

        __b_valid,
        __b_ready,
        __b_id,
        __b_resp);

        __ar_ready_reg <= __ar_ready;
        __aw_ready_reg <= __aw_ready;
        __w_ready_reg  <= __w_ready;

        __r_valid_reg <= __r_valid;
        __r_id_reg    <= __r_id[ID_BITS-1:0];
        __r_resp_reg  <= __r_resp[1:0];
        __r_data_reg  <= __r_data;
        __r_last_reg  <= __r_last;

        __b_valid_reg <= __b_valid;
        __b_id_reg    <= __b_id[ID_BITS-1:0];
        __b_resp_reg  <= __b_resp[1:0];

        __cnt_act_reg <= __cnt_act;
        __cnt_pre_reg <= __cnt_pre;

    end
  end

  /* verilator lint_off WIDTH */

  assign __lat_fr = lat_fr;
  assign __lat_fw = lat_fw;
  assign __nvmm_begin = nvmm_begin;
  assign cnt_act = __cnt_act_reg;
  //assign cnt_pre = __cnt_pre_reg;

  assign __ar_valid = s_axi_arvalid;
  assign __ar_addr  = s_axi_araddr;
  assign __ar_id    = s_axi_arid;
  assign __ar_size  = s_axi_arsize;
  assign __ar_len   = s_axi_arlen;

  assign __aw_valid = s_axi_awvalid;
  assign __aw_addr  = s_axi_awaddr;
  assign __aw_id    = s_axi_awid;
  assign __aw_size  = s_axi_awsize;
  assign __aw_len   = s_axi_awlen;

  assign __w_valid = s_axi_wvalid;
  assign __w_strb  = s_axi_wstrb;
  assign __w_data  = s_axi_wdata;
  assign __w_last  = s_axi_wlast;

  assign __r_ready = s_axi_rready;
  assign __b_ready = s_axi_bready;

  assign s_axi_arready = __ar_ready_reg;
  assign s_axi_awready = __aw_ready_reg;
  assign s_axi_wready = __w_ready_reg;
  assign s_axi_rvalid = __r_valid_reg;
  assign s_axi_rid = __r_id_reg;
  assign s_axi_rresp = __r_resp_reg;
  assign s_axi_rdata = __r_data_reg;
  assign s_axi_rlast = __r_last_reg;
  assign s_axi_bvalid = __b_valid_reg;
  assign s_axi_bid = __b_id_reg;
  assign s_axi_bresp = __b_resp_reg;

endmodule

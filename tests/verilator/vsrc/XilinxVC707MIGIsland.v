// 282401 - 283778

module XilinxVC707MIGIsland(
  input  [3:0]  auto_axi4in_xing_in_aw_mem_0_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_0_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_0_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_0_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_0_burst,
  input         auto_axi4in_xing_in_aw_mem_0_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_0_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_0_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_0_qos,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_1_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_1_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_1_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_1_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_1_burst,
  input         auto_axi4in_xing_in_aw_mem_1_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_1_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_1_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_1_qos,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_2_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_2_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_2_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_2_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_2_burst,
  input         auto_axi4in_xing_in_aw_mem_2_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_2_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_2_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_2_qos,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_3_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_3_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_3_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_3_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_3_burst,
  input         auto_axi4in_xing_in_aw_mem_3_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_3_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_3_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_3_qos,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_4_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_4_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_4_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_4_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_4_burst,
  input         auto_axi4in_xing_in_aw_mem_4_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_4_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_4_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_4_qos,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_5_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_5_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_5_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_5_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_5_burst,
  input         auto_axi4in_xing_in_aw_mem_5_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_5_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_5_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_5_qos,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_6_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_6_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_6_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_6_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_6_burst,
  input         auto_axi4in_xing_in_aw_mem_6_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_6_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_6_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_6_qos,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_7_id,
  input  [32:0] auto_axi4in_xing_in_aw_mem_7_addr,
  input  [7:0]  auto_axi4in_xing_in_aw_mem_7_len,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_7_size,
  input  [1:0]  auto_axi4in_xing_in_aw_mem_7_burst,
  input         auto_axi4in_xing_in_aw_mem_7_lock,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_7_cache,
  input  [2:0]  auto_axi4in_xing_in_aw_mem_7_prot,
  input  [3:0]  auto_axi4in_xing_in_aw_mem_7_qos,
  output [3:0]  auto_axi4in_xing_in_aw_ridx,
  input  [3:0]  auto_axi4in_xing_in_aw_widx,
  output        auto_axi4in_xing_in_aw_safe_ridx_valid,
  input         auto_axi4in_xing_in_aw_safe_widx_valid,
  input         auto_axi4in_xing_in_aw_safe_source_reset_n,
  output        auto_axi4in_xing_in_aw_safe_sink_reset_n,
  input  [63:0] auto_axi4in_xing_in_w_mem_0_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_0_strb,
  input         auto_axi4in_xing_in_w_mem_0_last,
  input  [63:0] auto_axi4in_xing_in_w_mem_1_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_1_strb,
  input         auto_axi4in_xing_in_w_mem_1_last,
  input  [63:0] auto_axi4in_xing_in_w_mem_2_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_2_strb,
  input         auto_axi4in_xing_in_w_mem_2_last,
  input  [63:0] auto_axi4in_xing_in_w_mem_3_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_3_strb,
  input         auto_axi4in_xing_in_w_mem_3_last,
  input  [63:0] auto_axi4in_xing_in_w_mem_4_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_4_strb,
  input         auto_axi4in_xing_in_w_mem_4_last,
  input  [63:0] auto_axi4in_xing_in_w_mem_5_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_5_strb,
  input         auto_axi4in_xing_in_w_mem_5_last,
  input  [63:0] auto_axi4in_xing_in_w_mem_6_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_6_strb,
  input         auto_axi4in_xing_in_w_mem_6_last,
  input  [63:0] auto_axi4in_xing_in_w_mem_7_data,
  input  [7:0]  auto_axi4in_xing_in_w_mem_7_strb,
  input         auto_axi4in_xing_in_w_mem_7_last,
  output [3:0]  auto_axi4in_xing_in_w_ridx,
  input  [3:0]  auto_axi4in_xing_in_w_widx,
  output        auto_axi4in_xing_in_w_safe_ridx_valid,
  input         auto_axi4in_xing_in_w_safe_widx_valid,
  input         auto_axi4in_xing_in_w_safe_source_reset_n,
  output        auto_axi4in_xing_in_w_safe_sink_reset_n,
  output [3:0]  auto_axi4in_xing_in_b_mem_0_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_0_resp,
  output [3:0]  auto_axi4in_xing_in_b_mem_1_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_1_resp,
  output [3:0]  auto_axi4in_xing_in_b_mem_2_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_2_resp,
  output [3:0]  auto_axi4in_xing_in_b_mem_3_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_3_resp,
  output [3:0]  auto_axi4in_xing_in_b_mem_4_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_4_resp,
  output [3:0]  auto_axi4in_xing_in_b_mem_5_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_5_resp,
  output [3:0]  auto_axi4in_xing_in_b_mem_6_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_6_resp,
  output [3:0]  auto_axi4in_xing_in_b_mem_7_id,
  output [1:0]  auto_axi4in_xing_in_b_mem_7_resp,
  input  [3:0]  auto_axi4in_xing_in_b_ridx,
  output [3:0]  auto_axi4in_xing_in_b_widx,
  input         auto_axi4in_xing_in_b_safe_ridx_valid,
  output        auto_axi4in_xing_in_b_safe_widx_valid,
  output        auto_axi4in_xing_in_b_safe_source_reset_n,
  input         auto_axi4in_xing_in_b_safe_sink_reset_n,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_0_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_0_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_0_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_0_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_0_burst,
  input         auto_axi4in_xing_in_ar_mem_0_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_0_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_0_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_0_qos,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_1_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_1_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_1_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_1_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_1_burst,
  input         auto_axi4in_xing_in_ar_mem_1_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_1_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_1_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_1_qos,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_2_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_2_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_2_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_2_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_2_burst,
  input         auto_axi4in_xing_in_ar_mem_2_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_2_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_2_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_2_qos,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_3_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_3_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_3_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_3_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_3_burst,
  input         auto_axi4in_xing_in_ar_mem_3_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_3_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_3_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_3_qos,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_4_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_4_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_4_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_4_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_4_burst,
  input         auto_axi4in_xing_in_ar_mem_4_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_4_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_4_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_4_qos,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_5_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_5_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_5_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_5_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_5_burst,
  input         auto_axi4in_xing_in_ar_mem_5_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_5_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_5_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_5_qos,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_6_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_6_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_6_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_6_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_6_burst,
  input         auto_axi4in_xing_in_ar_mem_6_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_6_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_6_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_6_qos,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_7_id,
  input  [32:0] auto_axi4in_xing_in_ar_mem_7_addr,
  input  [7:0]  auto_axi4in_xing_in_ar_mem_7_len,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_7_size,
  input  [1:0]  auto_axi4in_xing_in_ar_mem_7_burst,
  input         auto_axi4in_xing_in_ar_mem_7_lock,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_7_cache,
  input  [2:0]  auto_axi4in_xing_in_ar_mem_7_prot,
  input  [3:0]  auto_axi4in_xing_in_ar_mem_7_qos,
  output [3:0]  auto_axi4in_xing_in_ar_ridx,
  input  [3:0]  auto_axi4in_xing_in_ar_widx,
  output        auto_axi4in_xing_in_ar_safe_ridx_valid,
  input         auto_axi4in_xing_in_ar_safe_widx_valid,
  input         auto_axi4in_xing_in_ar_safe_source_reset_n,
  output        auto_axi4in_xing_in_ar_safe_sink_reset_n,
  output [3:0]  auto_axi4in_xing_in_r_mem_0_id,
  output [63:0] auto_axi4in_xing_in_r_mem_0_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_0_resp,
  output        auto_axi4in_xing_in_r_mem_0_last,
  output [3:0]  auto_axi4in_xing_in_r_mem_1_id,
  output [63:0] auto_axi4in_xing_in_r_mem_1_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_1_resp,
  output        auto_axi4in_xing_in_r_mem_1_last,
  output [3:0]  auto_axi4in_xing_in_r_mem_2_id,
  output [63:0] auto_axi4in_xing_in_r_mem_2_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_2_resp,
  output        auto_axi4in_xing_in_r_mem_2_last,
  output [3:0]  auto_axi4in_xing_in_r_mem_3_id,
  output [63:0] auto_axi4in_xing_in_r_mem_3_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_3_resp,
  output        auto_axi4in_xing_in_r_mem_3_last,
  output [3:0]  auto_axi4in_xing_in_r_mem_4_id,
  output [63:0] auto_axi4in_xing_in_r_mem_4_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_4_resp,
  output        auto_axi4in_xing_in_r_mem_4_last,
  output [3:0]  auto_axi4in_xing_in_r_mem_5_id,
  output [63:0] auto_axi4in_xing_in_r_mem_5_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_5_resp,
  output        auto_axi4in_xing_in_r_mem_5_last,
  output [3:0]  auto_axi4in_xing_in_r_mem_6_id,
  output [63:0] auto_axi4in_xing_in_r_mem_6_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_6_resp,
  output        auto_axi4in_xing_in_r_mem_6_last,
  output [3:0]  auto_axi4in_xing_in_r_mem_7_id,
  output [63:0] auto_axi4in_xing_in_r_mem_7_data,
  output [1:0]  auto_axi4in_xing_in_r_mem_7_resp,
  output        auto_axi4in_xing_in_r_mem_7_last,
  input  [3:0]  auto_axi4in_xing_in_r_ridx,
  output [3:0]  auto_axi4in_xing_in_r_widx,
  input         auto_axi4in_xing_in_r_safe_ridx_valid,
  output        auto_axi4in_xing_in_r_safe_widx_valid,
  output        auto_axi4in_xing_in_r_safe_source_reset_n,
  input         auto_axi4in_xing_in_r_safe_sink_reset_n,
  output [15:0] io_port_ddr3_addr,
  output [2:0]  io_port_ddr3_ba,
  output        io_port_ddr3_ras_n,
  output        io_port_ddr3_cas_n,
  output        io_port_ddr3_we_n,
  output        io_port_ddr3_reset_n,
  output        io_port_ddr3_ck_p,
  output        io_port_ddr3_ck_n,
  output        io_port_ddr3_cke,
  output        io_port_ddr3_cs_n,
  output [7:0]  io_port_ddr3_dm,
  output        io_port_ddr3_odt,
  inout  [63:0] io_port_ddr3_dq,
  inout  [7:0]  io_port_ddr3_dqs_n,
  inout  [7:0]  io_port_ddr3_dqs_p,
  input  [2:0]  io_port_nvmm_begin,
  input  [7:0]  io_port_lat_fr,
  input  [7:0]  io_port_lat_fw,
  output [63:0] io_port_cnt_act,
  input         io_port_sys_clk_i,
  output        io_port_ui_clk,
  output        io_port_ui_clk_sync_rst,
  output        io_port_mmcm_locked,
  input         io_port_aresetn,
  output        io_port_init_calib_complete,
  input         io_port_sys_rst,
  input  [7:0]  io_port_lat_cr,
  input  [7:0]  io_port_lat_cw,
  input  [7:0]  io_port_lat_dr256,
  input  [7:0]  io_port_lat_dr4096,
  input  [7:0]  io_port_lat_dw256,
  input  [7:0]  io_port_lat_dw4096,
  output [63:0] io_port_cnt_read,
  output [63:0] io_port_cnt_write,
  output [63:0] io_port_cnt_bdr,
  output [63:0] io_port_cnt_bdw
);
  wire  axi4asink_clock;
  wire  axi4asink_reset;
  wire [3:0] axi4asink_auto_in_aw_mem_0_id;
  wire [32:0] axi4asink_auto_in_aw_mem_0_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_0_len;
  wire [2:0] axi4asink_auto_in_aw_mem_0_size;
  wire [1:0] axi4asink_auto_in_aw_mem_0_burst;
  wire  axi4asink_auto_in_aw_mem_0_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_0_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_0_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_0_qos;
  wire [3:0] axi4asink_auto_in_aw_mem_1_id;
  wire [32:0] axi4asink_auto_in_aw_mem_1_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_1_len;
  wire [2:0] axi4asink_auto_in_aw_mem_1_size;
  wire [1:0] axi4asink_auto_in_aw_mem_1_burst;
  wire  axi4asink_auto_in_aw_mem_1_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_1_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_1_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_1_qos;
  wire [3:0] axi4asink_auto_in_aw_mem_2_id;
  wire [32:0] axi4asink_auto_in_aw_mem_2_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_2_len;
  wire [2:0] axi4asink_auto_in_aw_mem_2_size;
  wire [1:0] axi4asink_auto_in_aw_mem_2_burst;
  wire  axi4asink_auto_in_aw_mem_2_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_2_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_2_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_2_qos;
  wire [3:0] axi4asink_auto_in_aw_mem_3_id;
  wire [32:0] axi4asink_auto_in_aw_mem_3_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_3_len;
  wire [2:0] axi4asink_auto_in_aw_mem_3_size;
  wire [1:0] axi4asink_auto_in_aw_mem_3_burst;
  wire  axi4asink_auto_in_aw_mem_3_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_3_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_3_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_3_qos;
  wire [3:0] axi4asink_auto_in_aw_mem_4_id;
  wire [32:0] axi4asink_auto_in_aw_mem_4_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_4_len;
  wire [2:0] axi4asink_auto_in_aw_mem_4_size;
  wire [1:0] axi4asink_auto_in_aw_mem_4_burst;
  wire  axi4asink_auto_in_aw_mem_4_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_4_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_4_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_4_qos;
  wire [3:0] axi4asink_auto_in_aw_mem_5_id;
  wire [32:0] axi4asink_auto_in_aw_mem_5_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_5_len;
  wire [2:0] axi4asink_auto_in_aw_mem_5_size;
  wire [1:0] axi4asink_auto_in_aw_mem_5_burst;
  wire  axi4asink_auto_in_aw_mem_5_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_5_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_5_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_5_qos;
  wire [3:0] axi4asink_auto_in_aw_mem_6_id;
  wire [32:0] axi4asink_auto_in_aw_mem_6_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_6_len;
  wire [2:0] axi4asink_auto_in_aw_mem_6_size;
  wire [1:0] axi4asink_auto_in_aw_mem_6_burst;
  wire  axi4asink_auto_in_aw_mem_6_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_6_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_6_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_6_qos;
  wire [3:0] axi4asink_auto_in_aw_mem_7_id;
  wire [32:0] axi4asink_auto_in_aw_mem_7_addr;
  wire [7:0] axi4asink_auto_in_aw_mem_7_len;
  wire [2:0] axi4asink_auto_in_aw_mem_7_size;
  wire [1:0] axi4asink_auto_in_aw_mem_7_burst;
  wire  axi4asink_auto_in_aw_mem_7_lock;
  wire [3:0] axi4asink_auto_in_aw_mem_7_cache;
  wire [2:0] axi4asink_auto_in_aw_mem_7_prot;
  wire [3:0] axi4asink_auto_in_aw_mem_7_qos;
  wire [3:0] axi4asink_auto_in_aw_ridx;
  wire [3:0] axi4asink_auto_in_aw_widx;
  wire  axi4asink_auto_in_aw_safe_ridx_valid;
  wire  axi4asink_auto_in_aw_safe_widx_valid;
  wire  axi4asink_auto_in_aw_safe_source_reset_n;
  wire  axi4asink_auto_in_aw_safe_sink_reset_n;
  wire [63:0] axi4asink_auto_in_w_mem_0_data;
  wire [7:0] axi4asink_auto_in_w_mem_0_strb;
  wire  axi4asink_auto_in_w_mem_0_last;
  wire [63:0] axi4asink_auto_in_w_mem_1_data;
  wire [7:0] axi4asink_auto_in_w_mem_1_strb;
  wire  axi4asink_auto_in_w_mem_1_last;
  wire [63:0] axi4asink_auto_in_w_mem_2_data;
  wire [7:0] axi4asink_auto_in_w_mem_2_strb;
  wire  axi4asink_auto_in_w_mem_2_last;
  wire [63:0] axi4asink_auto_in_w_mem_3_data;
  wire [7:0] axi4asink_auto_in_w_mem_3_strb;
  wire  axi4asink_auto_in_w_mem_3_last;
  wire [63:0] axi4asink_auto_in_w_mem_4_data;
  wire [7:0] axi4asink_auto_in_w_mem_4_strb;
  wire  axi4asink_auto_in_w_mem_4_last;
  wire [63:0] axi4asink_auto_in_w_mem_5_data;
  wire [7:0] axi4asink_auto_in_w_mem_5_strb;
  wire  axi4asink_auto_in_w_mem_5_last;
  wire [63:0] axi4asink_auto_in_w_mem_6_data;
  wire [7:0] axi4asink_auto_in_w_mem_6_strb;
  wire  axi4asink_auto_in_w_mem_6_last;
  wire [63:0] axi4asink_auto_in_w_mem_7_data;
  wire [7:0] axi4asink_auto_in_w_mem_7_strb;
  wire  axi4asink_auto_in_w_mem_7_last;
  wire [3:0] axi4asink_auto_in_w_ridx;
  wire [3:0] axi4asink_auto_in_w_widx;
  wire  axi4asink_auto_in_w_safe_ridx_valid;
  wire  axi4asink_auto_in_w_safe_widx_valid;
  wire  axi4asink_auto_in_w_safe_source_reset_n;
  wire  axi4asink_auto_in_w_safe_sink_reset_n;
  wire [3:0] axi4asink_auto_in_b_mem_0_id;
  wire [1:0] axi4asink_auto_in_b_mem_0_resp;
  wire [3:0] axi4asink_auto_in_b_mem_1_id;
  wire [1:0] axi4asink_auto_in_b_mem_1_resp;
  wire [3:0] axi4asink_auto_in_b_mem_2_id;
  wire [1:0] axi4asink_auto_in_b_mem_2_resp;
  wire [3:0] axi4asink_auto_in_b_mem_3_id;
  wire [1:0] axi4asink_auto_in_b_mem_3_resp;
  wire [3:0] axi4asink_auto_in_b_mem_4_id;
  wire [1:0] axi4asink_auto_in_b_mem_4_resp;
  wire [3:0] axi4asink_auto_in_b_mem_5_id;
  wire [1:0] axi4asink_auto_in_b_mem_5_resp;
  wire [3:0] axi4asink_auto_in_b_mem_6_id;
  wire [1:0] axi4asink_auto_in_b_mem_6_resp;
  wire [3:0] axi4asink_auto_in_b_mem_7_id;
  wire [1:0] axi4asink_auto_in_b_mem_7_resp;
  wire [3:0] axi4asink_auto_in_b_ridx;
  wire [3:0] axi4asink_auto_in_b_widx;
  wire  axi4asink_auto_in_b_safe_ridx_valid;
  wire  axi4asink_auto_in_b_safe_widx_valid;
  wire  axi4asink_auto_in_b_safe_source_reset_n;
  wire  axi4asink_auto_in_b_safe_sink_reset_n;
  wire [3:0] axi4asink_auto_in_ar_mem_0_id;
  wire [32:0] axi4asink_auto_in_ar_mem_0_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_0_len;
  wire [2:0] axi4asink_auto_in_ar_mem_0_size;
  wire [1:0] axi4asink_auto_in_ar_mem_0_burst;
  wire  axi4asink_auto_in_ar_mem_0_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_0_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_0_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_0_qos;
  wire [3:0] axi4asink_auto_in_ar_mem_1_id;
  wire [32:0] axi4asink_auto_in_ar_mem_1_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_1_len;
  wire [2:0] axi4asink_auto_in_ar_mem_1_size;
  wire [1:0] axi4asink_auto_in_ar_mem_1_burst;
  wire  axi4asink_auto_in_ar_mem_1_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_1_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_1_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_1_qos;
  wire [3:0] axi4asink_auto_in_ar_mem_2_id;
  wire [32:0] axi4asink_auto_in_ar_mem_2_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_2_len;
  wire [2:0] axi4asink_auto_in_ar_mem_2_size;
  wire [1:0] axi4asink_auto_in_ar_mem_2_burst;
  wire  axi4asink_auto_in_ar_mem_2_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_2_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_2_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_2_qos;
  wire [3:0] axi4asink_auto_in_ar_mem_3_id;
  wire [32:0] axi4asink_auto_in_ar_mem_3_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_3_len;
  wire [2:0] axi4asink_auto_in_ar_mem_3_size;
  wire [1:0] axi4asink_auto_in_ar_mem_3_burst;
  wire  axi4asink_auto_in_ar_mem_3_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_3_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_3_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_3_qos;
  wire [3:0] axi4asink_auto_in_ar_mem_4_id;
  wire [32:0] axi4asink_auto_in_ar_mem_4_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_4_len;
  wire [2:0] axi4asink_auto_in_ar_mem_4_size;
  wire [1:0] axi4asink_auto_in_ar_mem_4_burst;
  wire  axi4asink_auto_in_ar_mem_4_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_4_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_4_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_4_qos;
  wire [3:0] axi4asink_auto_in_ar_mem_5_id;
  wire [32:0] axi4asink_auto_in_ar_mem_5_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_5_len;
  wire [2:0] axi4asink_auto_in_ar_mem_5_size;
  wire [1:0] axi4asink_auto_in_ar_mem_5_burst;
  wire  axi4asink_auto_in_ar_mem_5_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_5_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_5_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_5_qos;
  wire [3:0] axi4asink_auto_in_ar_mem_6_id;
  wire [32:0] axi4asink_auto_in_ar_mem_6_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_6_len;
  wire [2:0] axi4asink_auto_in_ar_mem_6_size;
  wire [1:0] axi4asink_auto_in_ar_mem_6_burst;
  wire  axi4asink_auto_in_ar_mem_6_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_6_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_6_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_6_qos;
  wire [3:0] axi4asink_auto_in_ar_mem_7_id;
  wire [32:0] axi4asink_auto_in_ar_mem_7_addr;
  wire [7:0] axi4asink_auto_in_ar_mem_7_len;
  wire [2:0] axi4asink_auto_in_ar_mem_7_size;
  wire [1:0] axi4asink_auto_in_ar_mem_7_burst;
  wire  axi4asink_auto_in_ar_mem_7_lock;
  wire [3:0] axi4asink_auto_in_ar_mem_7_cache;
  wire [2:0] axi4asink_auto_in_ar_mem_7_prot;
  wire [3:0] axi4asink_auto_in_ar_mem_7_qos;
  wire [3:0] axi4asink_auto_in_ar_ridx;
  wire [3:0] axi4asink_auto_in_ar_widx;
  wire  axi4asink_auto_in_ar_safe_ridx_valid;
  wire  axi4asink_auto_in_ar_safe_widx_valid;
  wire  axi4asink_auto_in_ar_safe_source_reset_n;
  wire  axi4asink_auto_in_ar_safe_sink_reset_n;
  wire [3:0] axi4asink_auto_in_r_mem_0_id;
  wire [63:0] axi4asink_auto_in_r_mem_0_data;
  wire [1:0] axi4asink_auto_in_r_mem_0_resp;
  wire  axi4asink_auto_in_r_mem_0_last;
  wire [3:0] axi4asink_auto_in_r_mem_1_id;
  wire [63:0] axi4asink_auto_in_r_mem_1_data;
  wire [1:0] axi4asink_auto_in_r_mem_1_resp;
  wire  axi4asink_auto_in_r_mem_1_last;
  wire [3:0] axi4asink_auto_in_r_mem_2_id;
  wire [63:0] axi4asink_auto_in_r_mem_2_data;
  wire [1:0] axi4asink_auto_in_r_mem_2_resp;
  wire  axi4asink_auto_in_r_mem_2_last;
  wire [3:0] axi4asink_auto_in_r_mem_3_id;
  wire [63:0] axi4asink_auto_in_r_mem_3_data;
  wire [1:0] axi4asink_auto_in_r_mem_3_resp;
  wire  axi4asink_auto_in_r_mem_3_last;
  wire [3:0] axi4asink_auto_in_r_mem_4_id;
  wire [63:0] axi4asink_auto_in_r_mem_4_data;
  wire [1:0] axi4asink_auto_in_r_mem_4_resp;
  wire  axi4asink_auto_in_r_mem_4_last;
  wire [3:0] axi4asink_auto_in_r_mem_5_id;
  wire [63:0] axi4asink_auto_in_r_mem_5_data;
  wire [1:0] axi4asink_auto_in_r_mem_5_resp;
  wire  axi4asink_auto_in_r_mem_5_last;
  wire [3:0] axi4asink_auto_in_r_mem_6_id;
  wire [63:0] axi4asink_auto_in_r_mem_6_data;
  wire [1:0] axi4asink_auto_in_r_mem_6_resp;
  wire  axi4asink_auto_in_r_mem_6_last;
  wire [3:0] axi4asink_auto_in_r_mem_7_id;
  wire [63:0] axi4asink_auto_in_r_mem_7_data;
  wire [1:0] axi4asink_auto_in_r_mem_7_resp;
  wire  axi4asink_auto_in_r_mem_7_last;
  wire [3:0] axi4asink_auto_in_r_ridx;
  wire [3:0] axi4asink_auto_in_r_widx;
  wire  axi4asink_auto_in_r_safe_ridx_valid;
  wire  axi4asink_auto_in_r_safe_widx_valid;
  wire  axi4asink_auto_in_r_safe_source_reset_n;
  wire  axi4asink_auto_in_r_safe_sink_reset_n;
  wire  axi4asink_auto_out_aw_ready;
  wire  axi4asink_auto_out_aw_valid;
  wire [3:0] axi4asink_auto_out_aw_bits_id;
  wire [32:0] axi4asink_auto_out_aw_bits_addr;
  wire [7:0] axi4asink_auto_out_aw_bits_len;
  wire [2:0] axi4asink_auto_out_aw_bits_size;
  wire [1:0] axi4asink_auto_out_aw_bits_burst;
  wire  axi4asink_auto_out_aw_bits_lock;
  wire [2:0] axi4asink_auto_out_aw_bits_prot;
  wire [3:0] axi4asink_auto_out_aw_bits_qos;
  wire  axi4asink_auto_out_w_ready;
  wire  axi4asink_auto_out_w_valid;
  wire [63:0] axi4asink_auto_out_w_bits_data;
  wire [7:0] axi4asink_auto_out_w_bits_strb;
  wire  axi4asink_auto_out_w_bits_last;
  wire  axi4asink_auto_out_b_ready;
  wire  axi4asink_auto_out_b_valid;
  wire [3:0] axi4asink_auto_out_b_bits_id;
  wire [1:0] axi4asink_auto_out_b_bits_resp;
  wire  axi4asink_auto_out_ar_ready;
  wire  axi4asink_auto_out_ar_valid;
  wire [3:0] axi4asink_auto_out_ar_bits_id;
  wire [32:0] axi4asink_auto_out_ar_bits_addr;
  wire [7:0] axi4asink_auto_out_ar_bits_len;
  wire [2:0] axi4asink_auto_out_ar_bits_size;
  wire [1:0] axi4asink_auto_out_ar_bits_burst;
  wire  axi4asink_auto_out_ar_bits_lock;
  wire [2:0] axi4asink_auto_out_ar_bits_prot;
  wire [3:0] axi4asink_auto_out_ar_bits_qos;
  wire  axi4asink_auto_out_r_ready;
  wire  axi4asink_auto_out_r_valid;
  wire [3:0] axi4asink_auto_out_r_bits_id;
  wire [63:0] axi4asink_auto_out_r_bits_data;
  wire [1:0] axi4asink_auto_out_r_bits_resp;
  wire  axi4asink_auto_out_r_bits_last;
  wire [15:0] blackbox_ddr3_addr;
  wire [2:0] blackbox_ddr3_ba;
  wire  blackbox_ddr3_ras_n;
  wire  blackbox_ddr3_cas_n;
  wire  blackbox_ddr3_we_n;
  wire  blackbox_ddr3_reset_n;
  wire  blackbox_ddr3_ck_p;
  wire  blackbox_ddr3_ck_n;
  wire  blackbox_ddr3_cke;
  wire  blackbox_ddr3_cs_n;
  wire [7:0] blackbox_ddr3_dm;
  wire  blackbox_ddr3_odt;
  wire [2:0] blackbox_nvmm_begin;
  wire [7:0] blackbox_lat_fr;
  wire [7:0] blackbox_lat_fw;
  wire [63:0] blackbox_cnt_act;
  wire  blackbox_sys_clk_i;
  wire  blackbox_ui_clk;
  wire  blackbox_ui_clk_sync_rst;
  wire  blackbox_mmcm_locked;
  wire  blackbox_aresetn;
  wire  blackbox_init_calib_complete;
  wire  blackbox_sys_rst;
  wire  blackbox_app_sr_req;
  wire  blackbox_app_ref_req;
  wire  blackbox_app_zq_req;
  wire  blackbox_app_sr_active;
  wire  blackbox_app_ref_ack;
  wire  blackbox_app_zq_ack;
  wire [3:0] blackbox_s_axi_awid;
  wire [31:0] blackbox_s_axi_awaddr;
  wire [7:0] blackbox_s_axi_awlen;
  wire [2:0] blackbox_s_axi_awsize;
  wire [1:0] blackbox_s_axi_awburst;
  wire  blackbox_s_axi_awlock;
  wire [3:0] blackbox_s_axi_awcache;
  wire [2:0] blackbox_s_axi_awprot;
  wire [3:0] blackbox_s_axi_awqos;
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
  wire [7:0] blackbox_s_axi_arlen;
  wire [2:0] blackbox_s_axi_arsize;
  wire [1:0] blackbox_s_axi_arburst;
  wire  blackbox_s_axi_arlock;
  wire [3:0] blackbox_s_axi_arcache;
  wire [2:0] blackbox_s_axi_arprot;
  wire [3:0] blackbox_s_axi_arqos;
  wire  blackbox_s_axi_arvalid;
  wire  blackbox_s_axi_arready;
  wire  blackbox_s_axi_rready;
  wire [3:0] blackbox_s_axi_rid;
  wire [63:0] blackbox_s_axi_rdata;
  wire [1:0] blackbox_s_axi_rresp;
  wire  blackbox_s_axi_rlast;
  wire  blackbox_s_axi_rvalid;
  wire [11:0] blackbox_device_temp;
  wire  nvmmctr_clock;
  wire  nvmmctr_reset;
  wire  nvmmctr_io_mbus_arvalid;
  wire  nvmmctr_io_mbus_arready;
  wire [31:0] nvmmctr_io_mbus_araddr;
  wire  nvmmctr_io_mbus_awvalid;
  wire  nvmmctr_io_mbus_awready;
  wire [31:0] nvmmctr_io_mbus_awaddr;
  wire  nvmmctr_io_mig_arvalid;
  wire  nvmmctr_io_mig_arready;
  wire  nvmmctr_io_mig_awvalid;
  wire  nvmmctr_io_mig_awready;
  wire [2:0] nvmmctr_io_nvmm_begin;
  wire [7:0] nvmmctr_io_lat_cr;
  wire [7:0] nvmmctr_io_lat_cw;
  wire [7:0] nvmmctr_io_lat_dr256;
  wire [7:0] nvmmctr_io_lat_dr4096;
  wire [7:0] nvmmctr_io_lat_dw256;
  wire [7:0] nvmmctr_io_lat_dw4096;
  wire [63:0] nvmmctr_io_cnt_read;
  wire [63:0] nvmmctr_io_cnt_write;
  wire [63:0] nvmmctr_io_cnt_bdr;
  wire [63:0] nvmmctr_io_cnt_bdw;
  wire [32:0] axi_async_aw_bits_addr;
  wire [32:0] awaddr;
  wire [32:0] axi_async_ar_bits_addr;
  wire [32:0] araddr;
  AXI4AsyncCrossingSink axi4asink (
    .clock(axi4asink_clock),
    .reset(axi4asink_reset),
    .auto_in_aw_mem_0_id(axi4asink_auto_in_aw_mem_0_id),
    .auto_in_aw_mem_0_addr(axi4asink_auto_in_aw_mem_0_addr),
    .auto_in_aw_mem_0_len(axi4asink_auto_in_aw_mem_0_len),
    .auto_in_aw_mem_0_size(axi4asink_auto_in_aw_mem_0_size),
    .auto_in_aw_mem_0_burst(axi4asink_auto_in_aw_mem_0_burst),
    .auto_in_aw_mem_0_lock(axi4asink_auto_in_aw_mem_0_lock),
    .auto_in_aw_mem_0_cache(axi4asink_auto_in_aw_mem_0_cache),
    .auto_in_aw_mem_0_prot(axi4asink_auto_in_aw_mem_0_prot),
    .auto_in_aw_mem_0_qos(axi4asink_auto_in_aw_mem_0_qos),
    .auto_in_aw_mem_1_id(axi4asink_auto_in_aw_mem_1_id),
    .auto_in_aw_mem_1_addr(axi4asink_auto_in_aw_mem_1_addr),
    .auto_in_aw_mem_1_len(axi4asink_auto_in_aw_mem_1_len),
    .auto_in_aw_mem_1_size(axi4asink_auto_in_aw_mem_1_size),
    .auto_in_aw_mem_1_burst(axi4asink_auto_in_aw_mem_1_burst),
    .auto_in_aw_mem_1_lock(axi4asink_auto_in_aw_mem_1_lock),
    .auto_in_aw_mem_1_cache(axi4asink_auto_in_aw_mem_1_cache),
    .auto_in_aw_mem_1_prot(axi4asink_auto_in_aw_mem_1_prot),
    .auto_in_aw_mem_1_qos(axi4asink_auto_in_aw_mem_1_qos),
    .auto_in_aw_mem_2_id(axi4asink_auto_in_aw_mem_2_id),
    .auto_in_aw_mem_2_addr(axi4asink_auto_in_aw_mem_2_addr),
    .auto_in_aw_mem_2_len(axi4asink_auto_in_aw_mem_2_len),
    .auto_in_aw_mem_2_size(axi4asink_auto_in_aw_mem_2_size),
    .auto_in_aw_mem_2_burst(axi4asink_auto_in_aw_mem_2_burst),
    .auto_in_aw_mem_2_lock(axi4asink_auto_in_aw_mem_2_lock),
    .auto_in_aw_mem_2_cache(axi4asink_auto_in_aw_mem_2_cache),
    .auto_in_aw_mem_2_prot(axi4asink_auto_in_aw_mem_2_prot),
    .auto_in_aw_mem_2_qos(axi4asink_auto_in_aw_mem_2_qos),
    .auto_in_aw_mem_3_id(axi4asink_auto_in_aw_mem_3_id),
    .auto_in_aw_mem_3_addr(axi4asink_auto_in_aw_mem_3_addr),
    .auto_in_aw_mem_3_len(axi4asink_auto_in_aw_mem_3_len),
    .auto_in_aw_mem_3_size(axi4asink_auto_in_aw_mem_3_size),
    .auto_in_aw_mem_3_burst(axi4asink_auto_in_aw_mem_3_burst),
    .auto_in_aw_mem_3_lock(axi4asink_auto_in_aw_mem_3_lock),
    .auto_in_aw_mem_3_cache(axi4asink_auto_in_aw_mem_3_cache),
    .auto_in_aw_mem_3_prot(axi4asink_auto_in_aw_mem_3_prot),
    .auto_in_aw_mem_3_qos(axi4asink_auto_in_aw_mem_3_qos),
    .auto_in_aw_mem_4_id(axi4asink_auto_in_aw_mem_4_id),
    .auto_in_aw_mem_4_addr(axi4asink_auto_in_aw_mem_4_addr),
    .auto_in_aw_mem_4_len(axi4asink_auto_in_aw_mem_4_len),
    .auto_in_aw_mem_4_size(axi4asink_auto_in_aw_mem_4_size),
    .auto_in_aw_mem_4_burst(axi4asink_auto_in_aw_mem_4_burst),
    .auto_in_aw_mem_4_lock(axi4asink_auto_in_aw_mem_4_lock),
    .auto_in_aw_mem_4_cache(axi4asink_auto_in_aw_mem_4_cache),
    .auto_in_aw_mem_4_prot(axi4asink_auto_in_aw_mem_4_prot),
    .auto_in_aw_mem_4_qos(axi4asink_auto_in_aw_mem_4_qos),
    .auto_in_aw_mem_5_id(axi4asink_auto_in_aw_mem_5_id),
    .auto_in_aw_mem_5_addr(axi4asink_auto_in_aw_mem_5_addr),
    .auto_in_aw_mem_5_len(axi4asink_auto_in_aw_mem_5_len),
    .auto_in_aw_mem_5_size(axi4asink_auto_in_aw_mem_5_size),
    .auto_in_aw_mem_5_burst(axi4asink_auto_in_aw_mem_5_burst),
    .auto_in_aw_mem_5_lock(axi4asink_auto_in_aw_mem_5_lock),
    .auto_in_aw_mem_5_cache(axi4asink_auto_in_aw_mem_5_cache),
    .auto_in_aw_mem_5_prot(axi4asink_auto_in_aw_mem_5_prot),
    .auto_in_aw_mem_5_qos(axi4asink_auto_in_aw_mem_5_qos),
    .auto_in_aw_mem_6_id(axi4asink_auto_in_aw_mem_6_id),
    .auto_in_aw_mem_6_addr(axi4asink_auto_in_aw_mem_6_addr),
    .auto_in_aw_mem_6_len(axi4asink_auto_in_aw_mem_6_len),
    .auto_in_aw_mem_6_size(axi4asink_auto_in_aw_mem_6_size),
    .auto_in_aw_mem_6_burst(axi4asink_auto_in_aw_mem_6_burst),
    .auto_in_aw_mem_6_lock(axi4asink_auto_in_aw_mem_6_lock),
    .auto_in_aw_mem_6_cache(axi4asink_auto_in_aw_mem_6_cache),
    .auto_in_aw_mem_6_prot(axi4asink_auto_in_aw_mem_6_prot),
    .auto_in_aw_mem_6_qos(axi4asink_auto_in_aw_mem_6_qos),
    .auto_in_aw_mem_7_id(axi4asink_auto_in_aw_mem_7_id),
    .auto_in_aw_mem_7_addr(axi4asink_auto_in_aw_mem_7_addr),
    .auto_in_aw_mem_7_len(axi4asink_auto_in_aw_mem_7_len),
    .auto_in_aw_mem_7_size(axi4asink_auto_in_aw_mem_7_size),
    .auto_in_aw_mem_7_burst(axi4asink_auto_in_aw_mem_7_burst),
    .auto_in_aw_mem_7_lock(axi4asink_auto_in_aw_mem_7_lock),
    .auto_in_aw_mem_7_cache(axi4asink_auto_in_aw_mem_7_cache),
    .auto_in_aw_mem_7_prot(axi4asink_auto_in_aw_mem_7_prot),
    .auto_in_aw_mem_7_qos(axi4asink_auto_in_aw_mem_7_qos),
    .auto_in_aw_ridx(axi4asink_auto_in_aw_ridx),
    .auto_in_aw_widx(axi4asink_auto_in_aw_widx),
    .auto_in_aw_safe_ridx_valid(axi4asink_auto_in_aw_safe_ridx_valid),
    .auto_in_aw_safe_widx_valid(axi4asink_auto_in_aw_safe_widx_valid),
    .auto_in_aw_safe_source_reset_n(axi4asink_auto_in_aw_safe_source_reset_n),
    .auto_in_aw_safe_sink_reset_n(axi4asink_auto_in_aw_safe_sink_reset_n),
    .auto_in_w_mem_0_data(axi4asink_auto_in_w_mem_0_data),
    .auto_in_w_mem_0_strb(axi4asink_auto_in_w_mem_0_strb),
    .auto_in_w_mem_0_last(axi4asink_auto_in_w_mem_0_last),
    .auto_in_w_mem_1_data(axi4asink_auto_in_w_mem_1_data),
    .auto_in_w_mem_1_strb(axi4asink_auto_in_w_mem_1_strb),
    .auto_in_w_mem_1_last(axi4asink_auto_in_w_mem_1_last),
    .auto_in_w_mem_2_data(axi4asink_auto_in_w_mem_2_data),
    .auto_in_w_mem_2_strb(axi4asink_auto_in_w_mem_2_strb),
    .auto_in_w_mem_2_last(axi4asink_auto_in_w_mem_2_last),
    .auto_in_w_mem_3_data(axi4asink_auto_in_w_mem_3_data),
    .auto_in_w_mem_3_strb(axi4asink_auto_in_w_mem_3_strb),
    .auto_in_w_mem_3_last(axi4asink_auto_in_w_mem_3_last),
    .auto_in_w_mem_4_data(axi4asink_auto_in_w_mem_4_data),
    .auto_in_w_mem_4_strb(axi4asink_auto_in_w_mem_4_strb),
    .auto_in_w_mem_4_last(axi4asink_auto_in_w_mem_4_last),
    .auto_in_w_mem_5_data(axi4asink_auto_in_w_mem_5_data),
    .auto_in_w_mem_5_strb(axi4asink_auto_in_w_mem_5_strb),
    .auto_in_w_mem_5_last(axi4asink_auto_in_w_mem_5_last),
    .auto_in_w_mem_6_data(axi4asink_auto_in_w_mem_6_data),
    .auto_in_w_mem_6_strb(axi4asink_auto_in_w_mem_6_strb),
    .auto_in_w_mem_6_last(axi4asink_auto_in_w_mem_6_last),
    .auto_in_w_mem_7_data(axi4asink_auto_in_w_mem_7_data),
    .auto_in_w_mem_7_strb(axi4asink_auto_in_w_mem_7_strb),
    .auto_in_w_mem_7_last(axi4asink_auto_in_w_mem_7_last),
    .auto_in_w_ridx(axi4asink_auto_in_w_ridx),
    .auto_in_w_widx(axi4asink_auto_in_w_widx),
    .auto_in_w_safe_ridx_valid(axi4asink_auto_in_w_safe_ridx_valid),
    .auto_in_w_safe_widx_valid(axi4asink_auto_in_w_safe_widx_valid),
    .auto_in_w_safe_source_reset_n(axi4asink_auto_in_w_safe_source_reset_n),
    .auto_in_w_safe_sink_reset_n(axi4asink_auto_in_w_safe_sink_reset_n),
    .auto_in_b_mem_0_id(axi4asink_auto_in_b_mem_0_id),
    .auto_in_b_mem_0_resp(axi4asink_auto_in_b_mem_0_resp),
    .auto_in_b_mem_1_id(axi4asink_auto_in_b_mem_1_id),
    .auto_in_b_mem_1_resp(axi4asink_auto_in_b_mem_1_resp),
    .auto_in_b_mem_2_id(axi4asink_auto_in_b_mem_2_id),
    .auto_in_b_mem_2_resp(axi4asink_auto_in_b_mem_2_resp),
    .auto_in_b_mem_3_id(axi4asink_auto_in_b_mem_3_id),
    .auto_in_b_mem_3_resp(axi4asink_auto_in_b_mem_3_resp),
    .auto_in_b_mem_4_id(axi4asink_auto_in_b_mem_4_id),
    .auto_in_b_mem_4_resp(axi4asink_auto_in_b_mem_4_resp),
    .auto_in_b_mem_5_id(axi4asink_auto_in_b_mem_5_id),
    .auto_in_b_mem_5_resp(axi4asink_auto_in_b_mem_5_resp),
    .auto_in_b_mem_6_id(axi4asink_auto_in_b_mem_6_id),
    .auto_in_b_mem_6_resp(axi4asink_auto_in_b_mem_6_resp),
    .auto_in_b_mem_7_id(axi4asink_auto_in_b_mem_7_id),
    .auto_in_b_mem_7_resp(axi4asink_auto_in_b_mem_7_resp),
    .auto_in_b_ridx(axi4asink_auto_in_b_ridx),
    .auto_in_b_widx(axi4asink_auto_in_b_widx),
    .auto_in_b_safe_ridx_valid(axi4asink_auto_in_b_safe_ridx_valid),
    .auto_in_b_safe_widx_valid(axi4asink_auto_in_b_safe_widx_valid),
    .auto_in_b_safe_source_reset_n(axi4asink_auto_in_b_safe_source_reset_n),
    .auto_in_b_safe_sink_reset_n(axi4asink_auto_in_b_safe_sink_reset_n),
    .auto_in_ar_mem_0_id(axi4asink_auto_in_ar_mem_0_id),
    .auto_in_ar_mem_0_addr(axi4asink_auto_in_ar_mem_0_addr),
    .auto_in_ar_mem_0_len(axi4asink_auto_in_ar_mem_0_len),
    .auto_in_ar_mem_0_size(axi4asink_auto_in_ar_mem_0_size),
    .auto_in_ar_mem_0_burst(axi4asink_auto_in_ar_mem_0_burst),
    .auto_in_ar_mem_0_lock(axi4asink_auto_in_ar_mem_0_lock),
    .auto_in_ar_mem_0_cache(axi4asink_auto_in_ar_mem_0_cache),
    .auto_in_ar_mem_0_prot(axi4asink_auto_in_ar_mem_0_prot),
    .auto_in_ar_mem_0_qos(axi4asink_auto_in_ar_mem_0_qos),
    .auto_in_ar_mem_1_id(axi4asink_auto_in_ar_mem_1_id),
    .auto_in_ar_mem_1_addr(axi4asink_auto_in_ar_mem_1_addr),
    .auto_in_ar_mem_1_len(axi4asink_auto_in_ar_mem_1_len),
    .auto_in_ar_mem_1_size(axi4asink_auto_in_ar_mem_1_size),
    .auto_in_ar_mem_1_burst(axi4asink_auto_in_ar_mem_1_burst),
    .auto_in_ar_mem_1_lock(axi4asink_auto_in_ar_mem_1_lock),
    .auto_in_ar_mem_1_cache(axi4asink_auto_in_ar_mem_1_cache),
    .auto_in_ar_mem_1_prot(axi4asink_auto_in_ar_mem_1_prot),
    .auto_in_ar_mem_1_qos(axi4asink_auto_in_ar_mem_1_qos),
    .auto_in_ar_mem_2_id(axi4asink_auto_in_ar_mem_2_id),
    .auto_in_ar_mem_2_addr(axi4asink_auto_in_ar_mem_2_addr),
    .auto_in_ar_mem_2_len(axi4asink_auto_in_ar_mem_2_len),
    .auto_in_ar_mem_2_size(axi4asink_auto_in_ar_mem_2_size),
    .auto_in_ar_mem_2_burst(axi4asink_auto_in_ar_mem_2_burst),
    .auto_in_ar_mem_2_lock(axi4asink_auto_in_ar_mem_2_lock),
    .auto_in_ar_mem_2_cache(axi4asink_auto_in_ar_mem_2_cache),
    .auto_in_ar_mem_2_prot(axi4asink_auto_in_ar_mem_2_prot),
    .auto_in_ar_mem_2_qos(axi4asink_auto_in_ar_mem_2_qos),
    .auto_in_ar_mem_3_id(axi4asink_auto_in_ar_mem_3_id),
    .auto_in_ar_mem_3_addr(axi4asink_auto_in_ar_mem_3_addr),
    .auto_in_ar_mem_3_len(axi4asink_auto_in_ar_mem_3_len),
    .auto_in_ar_mem_3_size(axi4asink_auto_in_ar_mem_3_size),
    .auto_in_ar_mem_3_burst(axi4asink_auto_in_ar_mem_3_burst),
    .auto_in_ar_mem_3_lock(axi4asink_auto_in_ar_mem_3_lock),
    .auto_in_ar_mem_3_cache(axi4asink_auto_in_ar_mem_3_cache),
    .auto_in_ar_mem_3_prot(axi4asink_auto_in_ar_mem_3_prot),
    .auto_in_ar_mem_3_qos(axi4asink_auto_in_ar_mem_3_qos),
    .auto_in_ar_mem_4_id(axi4asink_auto_in_ar_mem_4_id),
    .auto_in_ar_mem_4_addr(axi4asink_auto_in_ar_mem_4_addr),
    .auto_in_ar_mem_4_len(axi4asink_auto_in_ar_mem_4_len),
    .auto_in_ar_mem_4_size(axi4asink_auto_in_ar_mem_4_size),
    .auto_in_ar_mem_4_burst(axi4asink_auto_in_ar_mem_4_burst),
    .auto_in_ar_mem_4_lock(axi4asink_auto_in_ar_mem_4_lock),
    .auto_in_ar_mem_4_cache(axi4asink_auto_in_ar_mem_4_cache),
    .auto_in_ar_mem_4_prot(axi4asink_auto_in_ar_mem_4_prot),
    .auto_in_ar_mem_4_qos(axi4asink_auto_in_ar_mem_4_qos),
    .auto_in_ar_mem_5_id(axi4asink_auto_in_ar_mem_5_id),
    .auto_in_ar_mem_5_addr(axi4asink_auto_in_ar_mem_5_addr),
    .auto_in_ar_mem_5_len(axi4asink_auto_in_ar_mem_5_len),
    .auto_in_ar_mem_5_size(axi4asink_auto_in_ar_mem_5_size),
    .auto_in_ar_mem_5_burst(axi4asink_auto_in_ar_mem_5_burst),
    .auto_in_ar_mem_5_lock(axi4asink_auto_in_ar_mem_5_lock),
    .auto_in_ar_mem_5_cache(axi4asink_auto_in_ar_mem_5_cache),
    .auto_in_ar_mem_5_prot(axi4asink_auto_in_ar_mem_5_prot),
    .auto_in_ar_mem_5_qos(axi4asink_auto_in_ar_mem_5_qos),
    .auto_in_ar_mem_6_id(axi4asink_auto_in_ar_mem_6_id),
    .auto_in_ar_mem_6_addr(axi4asink_auto_in_ar_mem_6_addr),
    .auto_in_ar_mem_6_len(axi4asink_auto_in_ar_mem_6_len),
    .auto_in_ar_mem_6_size(axi4asink_auto_in_ar_mem_6_size),
    .auto_in_ar_mem_6_burst(axi4asink_auto_in_ar_mem_6_burst),
    .auto_in_ar_mem_6_lock(axi4asink_auto_in_ar_mem_6_lock),
    .auto_in_ar_mem_6_cache(axi4asink_auto_in_ar_mem_6_cache),
    .auto_in_ar_mem_6_prot(axi4asink_auto_in_ar_mem_6_prot),
    .auto_in_ar_mem_6_qos(axi4asink_auto_in_ar_mem_6_qos),
    .auto_in_ar_mem_7_id(axi4asink_auto_in_ar_mem_7_id),
    .auto_in_ar_mem_7_addr(axi4asink_auto_in_ar_mem_7_addr),
    .auto_in_ar_mem_7_len(axi4asink_auto_in_ar_mem_7_len),
    .auto_in_ar_mem_7_size(axi4asink_auto_in_ar_mem_7_size),
    .auto_in_ar_mem_7_burst(axi4asink_auto_in_ar_mem_7_burst),
    .auto_in_ar_mem_7_lock(axi4asink_auto_in_ar_mem_7_lock),
    .auto_in_ar_mem_7_cache(axi4asink_auto_in_ar_mem_7_cache),
    .auto_in_ar_mem_7_prot(axi4asink_auto_in_ar_mem_7_prot),
    .auto_in_ar_mem_7_qos(axi4asink_auto_in_ar_mem_7_qos),
    .auto_in_ar_ridx(axi4asink_auto_in_ar_ridx),
    .auto_in_ar_widx(axi4asink_auto_in_ar_widx),
    .auto_in_ar_safe_ridx_valid(axi4asink_auto_in_ar_safe_ridx_valid),
    .auto_in_ar_safe_widx_valid(axi4asink_auto_in_ar_safe_widx_valid),
    .auto_in_ar_safe_source_reset_n(axi4asink_auto_in_ar_safe_source_reset_n),
    .auto_in_ar_safe_sink_reset_n(axi4asink_auto_in_ar_safe_sink_reset_n),
    .auto_in_r_mem_0_id(axi4asink_auto_in_r_mem_0_id),
    .auto_in_r_mem_0_data(axi4asink_auto_in_r_mem_0_data),
    .auto_in_r_mem_0_resp(axi4asink_auto_in_r_mem_0_resp),
    .auto_in_r_mem_0_last(axi4asink_auto_in_r_mem_0_last),
    .auto_in_r_mem_1_id(axi4asink_auto_in_r_mem_1_id),
    .auto_in_r_mem_1_data(axi4asink_auto_in_r_mem_1_data),
    .auto_in_r_mem_1_resp(axi4asink_auto_in_r_mem_1_resp),
    .auto_in_r_mem_1_last(axi4asink_auto_in_r_mem_1_last),
    .auto_in_r_mem_2_id(axi4asink_auto_in_r_mem_2_id),
    .auto_in_r_mem_2_data(axi4asink_auto_in_r_mem_2_data),
    .auto_in_r_mem_2_resp(axi4asink_auto_in_r_mem_2_resp),
    .auto_in_r_mem_2_last(axi4asink_auto_in_r_mem_2_last),
    .auto_in_r_mem_3_id(axi4asink_auto_in_r_mem_3_id),
    .auto_in_r_mem_3_data(axi4asink_auto_in_r_mem_3_data),
    .auto_in_r_mem_3_resp(axi4asink_auto_in_r_mem_3_resp),
    .auto_in_r_mem_3_last(axi4asink_auto_in_r_mem_3_last),
    .auto_in_r_mem_4_id(axi4asink_auto_in_r_mem_4_id),
    .auto_in_r_mem_4_data(axi4asink_auto_in_r_mem_4_data),
    .auto_in_r_mem_4_resp(axi4asink_auto_in_r_mem_4_resp),
    .auto_in_r_mem_4_last(axi4asink_auto_in_r_mem_4_last),
    .auto_in_r_mem_5_id(axi4asink_auto_in_r_mem_5_id),
    .auto_in_r_mem_5_data(axi4asink_auto_in_r_mem_5_data),
    .auto_in_r_mem_5_resp(axi4asink_auto_in_r_mem_5_resp),
    .auto_in_r_mem_5_last(axi4asink_auto_in_r_mem_5_last),
    .auto_in_r_mem_6_id(axi4asink_auto_in_r_mem_6_id),
    .auto_in_r_mem_6_data(axi4asink_auto_in_r_mem_6_data),
    .auto_in_r_mem_6_resp(axi4asink_auto_in_r_mem_6_resp),
    .auto_in_r_mem_6_last(axi4asink_auto_in_r_mem_6_last),
    .auto_in_r_mem_7_id(axi4asink_auto_in_r_mem_7_id),
    .auto_in_r_mem_7_data(axi4asink_auto_in_r_mem_7_data),
    .auto_in_r_mem_7_resp(axi4asink_auto_in_r_mem_7_resp),
    .auto_in_r_mem_7_last(axi4asink_auto_in_r_mem_7_last),
    .auto_in_r_ridx(axi4asink_auto_in_r_ridx),
    .auto_in_r_widx(axi4asink_auto_in_r_widx),
    .auto_in_r_safe_ridx_valid(axi4asink_auto_in_r_safe_ridx_valid),
    .auto_in_r_safe_widx_valid(axi4asink_auto_in_r_safe_widx_valid),
    .auto_in_r_safe_source_reset_n(axi4asink_auto_in_r_safe_source_reset_n),
    .auto_in_r_safe_sink_reset_n(axi4asink_auto_in_r_safe_sink_reset_n),
    .auto_out_aw_ready(axi4asink_auto_out_aw_ready),
    .auto_out_aw_valid(axi4asink_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4asink_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4asink_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4asink_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4asink_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4asink_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(axi4asink_auto_out_aw_bits_lock),
    .auto_out_aw_bits_prot(axi4asink_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(axi4asink_auto_out_aw_bits_qos),
    .auto_out_w_ready(axi4asink_auto_out_w_ready),
    .auto_out_w_valid(axi4asink_auto_out_w_valid),
    .auto_out_w_bits_data(axi4asink_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4asink_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4asink_auto_out_w_bits_last),
    .auto_out_b_ready(axi4asink_auto_out_b_ready),
    .auto_out_b_valid(axi4asink_auto_out_b_valid),
    .auto_out_b_bits_id(axi4asink_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4asink_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4asink_auto_out_ar_ready),
    .auto_out_ar_valid(axi4asink_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4asink_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4asink_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4asink_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4asink_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4asink_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(axi4asink_auto_out_ar_bits_lock),
    .auto_out_ar_bits_prot(axi4asink_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(axi4asink_auto_out_ar_bits_qos),
    .auto_out_r_ready(axi4asink_auto_out_r_ready),
    .auto_out_r_valid(axi4asink_auto_out_r_valid),
    .auto_out_r_bits_id(axi4asink_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4asink_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4asink_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4asink_auto_out_r_bits_last)
  );
  SimDRAM blackbox (
    //.ddr3_addr(blackbox_ddr3_addr),
    //.ddr3_ba(blackbox_ddr3_ba),
    //.ddr3_ras_n(blackbox_ddr3_ras_n),
    //.ddr3_cas_n(blackbox_ddr3_cas_n),
    //.ddr3_we_n(blackbox_ddr3_we_n),
    //.ddr3_reset_n(blackbox_ddr3_reset_n),
    //.ddr3_ck_p(blackbox_ddr3_ck_p),
    //.ddr3_ck_n(blackbox_ddr3_ck_n),
    //.ddr3_cke(blackbox_ddr3_cke),
    //.ddr3_cs_n(blackbox_ddr3_cs_n),
    //.ddr3_dm(blackbox_ddr3_dm),
    //.ddr3_odt(blackbox_ddr3_odt),
    //.ddr3_dq(io_port_ddr3_dq),
    //.ddr3_dqs_n(io_port_ddr3_dqs_n),
    //.ddr3_dqs_p(io_port_ddr3_dqs_p),
    .nvmm_begin(blackbox_nvmm_begin),
    .lat_fr(blackbox_lat_fr),
    .lat_fw(blackbox_lat_fw),
    .cnt_act(blackbox_cnt_act),
    .sys_clk_i(blackbox_sys_clk_i),
    //.ui_clk(blackbox_ui_clk),
    //.ui_clk_sync_rst(blackbox_ui_clk_sync_rst),
    //.mmcm_locked(blackbox_mmcm_locked),
    //.aresetn(blackbox_aresetn),
    //.init_calib_complete(blackbox_init_calib_complete),
    .sys_rst(blackbox_sys_rst),
    //.app_sr_req(blackbox_app_sr_req),
    //.app_ref_req(blackbox_app_ref_req),
    //.app_zq_req(blackbox_app_zq_req),
    //.app_sr_active(blackbox_app_sr_active),
    //.app_ref_ack(blackbox_app_ref_ack),
    //.app_zq_ack(blackbox_app_zq_ack),
    .s_axi_awid(blackbox_s_axi_awid),
    .s_axi_awaddr(blackbox_s_axi_awaddr),
    .s_axi_awlen(blackbox_s_axi_awlen),
    .s_axi_awsize(blackbox_s_axi_awsize),
    .s_axi_awburst(blackbox_s_axi_awburst),
    .s_axi_awlock(blackbox_s_axi_awlock),
    .s_axi_awcache(blackbox_s_axi_awcache),
    .s_axi_awprot(blackbox_s_axi_awprot),
    .s_axi_awqos(blackbox_s_axi_awqos),
    .s_axi_awvalid(blackbox_s_axi_awvalid),
    .s_axi_awready(blackbox_s_axi_awready),
    .s_axi_wdata(blackbox_s_axi_wdata),
    .s_axi_wstrb(blackbox_s_axi_wstrb),
    .s_axi_wlast(blackbox_s_axi_wlast),
    .s_axi_wvalid(blackbox_s_axi_wvalid),
    .s_axi_wready(blackbox_s_axi_wready),
    .s_axi_bready(blackbox_s_axi_bready),
    .s_axi_bid(blackbox_s_axi_bid),
    .s_axi_bresp(blackbox_s_axi_bresp),
    .s_axi_bvalid(blackbox_s_axi_bvalid),
    .s_axi_arid(blackbox_s_axi_arid),
    .s_axi_araddr(blackbox_s_axi_araddr),
    .s_axi_arlen(blackbox_s_axi_arlen),
    .s_axi_arsize(blackbox_s_axi_arsize),
    .s_axi_arburst(blackbox_s_axi_arburst),
    .s_axi_arlock(blackbox_s_axi_arlock),
    .s_axi_arcache(blackbox_s_axi_arcache),
    .s_axi_arprot(blackbox_s_axi_arprot),
    .s_axi_arqos(blackbox_s_axi_arqos),
    .s_axi_arvalid(blackbox_s_axi_arvalid),
    .s_axi_arready(blackbox_s_axi_arready),
    .s_axi_rready(blackbox_s_axi_rready),
    .s_axi_rid(blackbox_s_axi_rid),
    .s_axi_rdata(blackbox_s_axi_rdata),
    .s_axi_rresp(blackbox_s_axi_rresp),
    .s_axi_rlast(blackbox_s_axi_rlast),
    .s_axi_rvalid(blackbox_s_axi_rvalid)
    //.device_temp(blackbox_device_temp)
  );
   assign blackbox_init_calib_complete = 1'b0;
   assign blackbox_mmcm_locked     = 1'b1;
   assign blackbox_ui_clk          = blackbox_sys_clk_i;
   assign blackbox_ui_clk_sync_rst = 1'b0;

  NVMMCTRModule nvmmctr (
    .clock(nvmmctr_clock),
    .reset(nvmmctr_reset),
    .io_mbus_arvalid(nvmmctr_io_mbus_arvalid),
    .io_mbus_arready(nvmmctr_io_mbus_arready),
    .io_mbus_araddr(nvmmctr_io_mbus_araddr),
    .io_mbus_awvalid(nvmmctr_io_mbus_awvalid),
    .io_mbus_awready(nvmmctr_io_mbus_awready),
    .io_mbus_awaddr(nvmmctr_io_mbus_awaddr),
    .io_mig_arvalid(nvmmctr_io_mig_arvalid),
    .io_mig_arready(nvmmctr_io_mig_arready),
    .io_mig_awvalid(nvmmctr_io_mig_awvalid),
    .io_mig_awready(nvmmctr_io_mig_awready),
    .io_nvmm_begin(nvmmctr_io_nvmm_begin),
    .io_lat_cr(nvmmctr_io_lat_cr),
    .io_lat_cw(nvmmctr_io_lat_cw),
    .io_lat_dr256(nvmmctr_io_lat_dr256),
    .io_lat_dr4096(nvmmctr_io_lat_dr4096),
    .io_lat_dw256(nvmmctr_io_lat_dw256),
    .io_lat_dw4096(nvmmctr_io_lat_dw4096),
    .io_cnt_read(nvmmctr_io_cnt_read),
    .io_cnt_write(nvmmctr_io_cnt_write),
    .io_cnt_bdr(nvmmctr_io_cnt_bdr),
    .io_cnt_bdw(nvmmctr_io_cnt_bdw)
  );
  assign axi_async_aw_bits_addr = axi4asink_auto_out_aw_bits_addr;
  assign awaddr = axi_async_aw_bits_addr - 33'h80000000;
  assign axi_async_ar_bits_addr = axi4asink_auto_out_ar_bits_addr;
  assign araddr = axi_async_ar_bits_addr - 33'h80000000;
  assign auto_axi4in_xing_in_aw_ridx = axi4asink_auto_in_aw_ridx;
  assign auto_axi4in_xing_in_aw_safe_ridx_valid = axi4asink_auto_in_aw_safe_ridx_valid;
  assign auto_axi4in_xing_in_aw_safe_sink_reset_n = axi4asink_auto_in_aw_safe_sink_reset_n;
  assign auto_axi4in_xing_in_w_ridx = axi4asink_auto_in_w_ridx;
  assign auto_axi4in_xing_in_w_safe_ridx_valid = axi4asink_auto_in_w_safe_ridx_valid;
  assign auto_axi4in_xing_in_w_safe_sink_reset_n = axi4asink_auto_in_w_safe_sink_reset_n;
  assign auto_axi4in_xing_in_b_mem_0_id = axi4asink_auto_in_b_mem_0_id;
  assign auto_axi4in_xing_in_b_mem_0_resp = axi4asink_auto_in_b_mem_0_resp;
  assign auto_axi4in_xing_in_b_mem_1_id = axi4asink_auto_in_b_mem_1_id;
  assign auto_axi4in_xing_in_b_mem_1_resp = axi4asink_auto_in_b_mem_1_resp;
  assign auto_axi4in_xing_in_b_mem_2_id = axi4asink_auto_in_b_mem_2_id;
  assign auto_axi4in_xing_in_b_mem_2_resp = axi4asink_auto_in_b_mem_2_resp;
  assign auto_axi4in_xing_in_b_mem_3_id = axi4asink_auto_in_b_mem_3_id;
  assign auto_axi4in_xing_in_b_mem_3_resp = axi4asink_auto_in_b_mem_3_resp;
  assign auto_axi4in_xing_in_b_mem_4_id = axi4asink_auto_in_b_mem_4_id;
  assign auto_axi4in_xing_in_b_mem_4_resp = axi4asink_auto_in_b_mem_4_resp;
  assign auto_axi4in_xing_in_b_mem_5_id = axi4asink_auto_in_b_mem_5_id;
  assign auto_axi4in_xing_in_b_mem_5_resp = axi4asink_auto_in_b_mem_5_resp;
  assign auto_axi4in_xing_in_b_mem_6_id = axi4asink_auto_in_b_mem_6_id;
  assign auto_axi4in_xing_in_b_mem_6_resp = axi4asink_auto_in_b_mem_6_resp;
  assign auto_axi4in_xing_in_b_mem_7_id = axi4asink_auto_in_b_mem_7_id;
  assign auto_axi4in_xing_in_b_mem_7_resp = axi4asink_auto_in_b_mem_7_resp;
  assign auto_axi4in_xing_in_b_widx = axi4asink_auto_in_b_widx;
  assign auto_axi4in_xing_in_b_safe_widx_valid = axi4asink_auto_in_b_safe_widx_valid;
  assign auto_axi4in_xing_in_b_safe_source_reset_n = axi4asink_auto_in_b_safe_source_reset_n;
  assign auto_axi4in_xing_in_ar_ridx = axi4asink_auto_in_ar_ridx;
  assign auto_axi4in_xing_in_ar_safe_ridx_valid = axi4asink_auto_in_ar_safe_ridx_valid;
  assign auto_axi4in_xing_in_ar_safe_sink_reset_n = axi4asink_auto_in_ar_safe_sink_reset_n;
  assign auto_axi4in_xing_in_r_mem_0_id = axi4asink_auto_in_r_mem_0_id;
  assign auto_axi4in_xing_in_r_mem_0_data = axi4asink_auto_in_r_mem_0_data;
  assign auto_axi4in_xing_in_r_mem_0_resp = axi4asink_auto_in_r_mem_0_resp;
  assign auto_axi4in_xing_in_r_mem_0_last = axi4asink_auto_in_r_mem_0_last;
  assign auto_axi4in_xing_in_r_mem_1_id = axi4asink_auto_in_r_mem_1_id;
  assign auto_axi4in_xing_in_r_mem_1_data = axi4asink_auto_in_r_mem_1_data;
  assign auto_axi4in_xing_in_r_mem_1_resp = axi4asink_auto_in_r_mem_1_resp;
  assign auto_axi4in_xing_in_r_mem_1_last = axi4asink_auto_in_r_mem_1_last;
  assign auto_axi4in_xing_in_r_mem_2_id = axi4asink_auto_in_r_mem_2_id;
  assign auto_axi4in_xing_in_r_mem_2_data = axi4asink_auto_in_r_mem_2_data;
  assign auto_axi4in_xing_in_r_mem_2_resp = axi4asink_auto_in_r_mem_2_resp;
  assign auto_axi4in_xing_in_r_mem_2_last = axi4asink_auto_in_r_mem_2_last;
  assign auto_axi4in_xing_in_r_mem_3_id = axi4asink_auto_in_r_mem_3_id;
  assign auto_axi4in_xing_in_r_mem_3_data = axi4asink_auto_in_r_mem_3_data;
  assign auto_axi4in_xing_in_r_mem_3_resp = axi4asink_auto_in_r_mem_3_resp;
  assign auto_axi4in_xing_in_r_mem_3_last = axi4asink_auto_in_r_mem_3_last;
  assign auto_axi4in_xing_in_r_mem_4_id = axi4asink_auto_in_r_mem_4_id;
  assign auto_axi4in_xing_in_r_mem_4_data = axi4asink_auto_in_r_mem_4_data;
  assign auto_axi4in_xing_in_r_mem_4_resp = axi4asink_auto_in_r_mem_4_resp;
  assign auto_axi4in_xing_in_r_mem_4_last = axi4asink_auto_in_r_mem_4_last;
  assign auto_axi4in_xing_in_r_mem_5_id = axi4asink_auto_in_r_mem_5_id;
  assign auto_axi4in_xing_in_r_mem_5_data = axi4asink_auto_in_r_mem_5_data;
  assign auto_axi4in_xing_in_r_mem_5_resp = axi4asink_auto_in_r_mem_5_resp;
  assign auto_axi4in_xing_in_r_mem_5_last = axi4asink_auto_in_r_mem_5_last;
  assign auto_axi4in_xing_in_r_mem_6_id = axi4asink_auto_in_r_mem_6_id;
  assign auto_axi4in_xing_in_r_mem_6_data = axi4asink_auto_in_r_mem_6_data;
  assign auto_axi4in_xing_in_r_mem_6_resp = axi4asink_auto_in_r_mem_6_resp;
  assign auto_axi4in_xing_in_r_mem_6_last = axi4asink_auto_in_r_mem_6_last;
  assign auto_axi4in_xing_in_r_mem_7_id = axi4asink_auto_in_r_mem_7_id;
  assign auto_axi4in_xing_in_r_mem_7_data = axi4asink_auto_in_r_mem_7_data;
  assign auto_axi4in_xing_in_r_mem_7_resp = axi4asink_auto_in_r_mem_7_resp;
  assign auto_axi4in_xing_in_r_mem_7_last = axi4asink_auto_in_r_mem_7_last;
  assign auto_axi4in_xing_in_r_widx = axi4asink_auto_in_r_widx;
  assign auto_axi4in_xing_in_r_safe_widx_valid = axi4asink_auto_in_r_safe_widx_valid;
  assign auto_axi4in_xing_in_r_safe_source_reset_n = axi4asink_auto_in_r_safe_source_reset_n;
  assign io_port_ddr3_addr = blackbox_ddr3_addr;
  assign io_port_ddr3_ba = blackbox_ddr3_ba;
  assign io_port_ddr3_ras_n = blackbox_ddr3_ras_n;
  assign io_port_ddr3_cas_n = blackbox_ddr3_cas_n;
  assign io_port_ddr3_we_n = blackbox_ddr3_we_n;
  assign io_port_ddr3_reset_n = blackbox_ddr3_reset_n;
  assign io_port_ddr3_ck_p = blackbox_ddr3_ck_p;
  assign io_port_ddr3_ck_n = blackbox_ddr3_ck_n;
  assign io_port_ddr3_cke = blackbox_ddr3_cke;
  assign io_port_ddr3_cs_n = blackbox_ddr3_cs_n;
  assign io_port_ddr3_dm = blackbox_ddr3_dm;
  assign io_port_ddr3_odt = blackbox_ddr3_odt;
  assign io_port_cnt_act = blackbox_cnt_act;
  assign io_port_ui_clk = blackbox_ui_clk;
  assign io_port_ui_clk_sync_rst = blackbox_ui_clk_sync_rst;
  assign io_port_mmcm_locked = blackbox_mmcm_locked;
  assign io_port_init_calib_complete = blackbox_init_calib_complete;
  assign io_port_cnt_read = nvmmctr_io_cnt_read;
  assign io_port_cnt_write = nvmmctr_io_cnt_write;
  assign io_port_cnt_bdr = nvmmctr_io_cnt_bdr;
  assign io_port_cnt_bdw = nvmmctr_io_cnt_bdw;
  assign axi4asink_clock = io_port_ui_clk;
  assign axi4asink_reset = io_port_ui_clk_sync_rst;
  assign axi4asink_auto_in_aw_mem_0_id = auto_axi4in_xing_in_aw_mem_0_id;
  assign axi4asink_auto_in_aw_mem_0_addr = auto_axi4in_xing_in_aw_mem_0_addr;
  assign axi4asink_auto_in_aw_mem_0_len = auto_axi4in_xing_in_aw_mem_0_len;
  assign axi4asink_auto_in_aw_mem_0_size = auto_axi4in_xing_in_aw_mem_0_size;
  assign axi4asink_auto_in_aw_mem_0_burst = auto_axi4in_xing_in_aw_mem_0_burst;
  assign axi4asink_auto_in_aw_mem_0_lock = auto_axi4in_xing_in_aw_mem_0_lock;
  assign axi4asink_auto_in_aw_mem_0_cache = auto_axi4in_xing_in_aw_mem_0_cache;
  assign axi4asink_auto_in_aw_mem_0_prot = auto_axi4in_xing_in_aw_mem_0_prot;
  assign axi4asink_auto_in_aw_mem_0_qos = auto_axi4in_xing_in_aw_mem_0_qos;
  assign axi4asink_auto_in_aw_mem_1_id = auto_axi4in_xing_in_aw_mem_1_id;
  assign axi4asink_auto_in_aw_mem_1_addr = auto_axi4in_xing_in_aw_mem_1_addr;
  assign axi4asink_auto_in_aw_mem_1_len = auto_axi4in_xing_in_aw_mem_1_len;
  assign axi4asink_auto_in_aw_mem_1_size = auto_axi4in_xing_in_aw_mem_1_size;
  assign axi4asink_auto_in_aw_mem_1_burst = auto_axi4in_xing_in_aw_mem_1_burst;
  assign axi4asink_auto_in_aw_mem_1_lock = auto_axi4in_xing_in_aw_mem_1_lock;
  assign axi4asink_auto_in_aw_mem_1_cache = auto_axi4in_xing_in_aw_mem_1_cache;
  assign axi4asink_auto_in_aw_mem_1_prot = auto_axi4in_xing_in_aw_mem_1_prot;
  assign axi4asink_auto_in_aw_mem_1_qos = auto_axi4in_xing_in_aw_mem_1_qos;
  assign axi4asink_auto_in_aw_mem_2_id = auto_axi4in_xing_in_aw_mem_2_id;
  assign axi4asink_auto_in_aw_mem_2_addr = auto_axi4in_xing_in_aw_mem_2_addr;
  assign axi4asink_auto_in_aw_mem_2_len = auto_axi4in_xing_in_aw_mem_2_len;
  assign axi4asink_auto_in_aw_mem_2_size = auto_axi4in_xing_in_aw_mem_2_size;
  assign axi4asink_auto_in_aw_mem_2_burst = auto_axi4in_xing_in_aw_mem_2_burst;
  assign axi4asink_auto_in_aw_mem_2_lock = auto_axi4in_xing_in_aw_mem_2_lock;
  assign axi4asink_auto_in_aw_mem_2_cache = auto_axi4in_xing_in_aw_mem_2_cache;
  assign axi4asink_auto_in_aw_mem_2_prot = auto_axi4in_xing_in_aw_mem_2_prot;
  assign axi4asink_auto_in_aw_mem_2_qos = auto_axi4in_xing_in_aw_mem_2_qos;
  assign axi4asink_auto_in_aw_mem_3_id = auto_axi4in_xing_in_aw_mem_3_id;
  assign axi4asink_auto_in_aw_mem_3_addr = auto_axi4in_xing_in_aw_mem_3_addr;
  assign axi4asink_auto_in_aw_mem_3_len = auto_axi4in_xing_in_aw_mem_3_len;
  assign axi4asink_auto_in_aw_mem_3_size = auto_axi4in_xing_in_aw_mem_3_size;
  assign axi4asink_auto_in_aw_mem_3_burst = auto_axi4in_xing_in_aw_mem_3_burst;
  assign axi4asink_auto_in_aw_mem_3_lock = auto_axi4in_xing_in_aw_mem_3_lock;
  assign axi4asink_auto_in_aw_mem_3_cache = auto_axi4in_xing_in_aw_mem_3_cache;
  assign axi4asink_auto_in_aw_mem_3_prot = auto_axi4in_xing_in_aw_mem_3_prot;
  assign axi4asink_auto_in_aw_mem_3_qos = auto_axi4in_xing_in_aw_mem_3_qos;
  assign axi4asink_auto_in_aw_mem_4_id = auto_axi4in_xing_in_aw_mem_4_id;
  assign axi4asink_auto_in_aw_mem_4_addr = auto_axi4in_xing_in_aw_mem_4_addr;
  assign axi4asink_auto_in_aw_mem_4_len = auto_axi4in_xing_in_aw_mem_4_len;
  assign axi4asink_auto_in_aw_mem_4_size = auto_axi4in_xing_in_aw_mem_4_size;
  assign axi4asink_auto_in_aw_mem_4_burst = auto_axi4in_xing_in_aw_mem_4_burst;
  assign axi4asink_auto_in_aw_mem_4_lock = auto_axi4in_xing_in_aw_mem_4_lock;
  assign axi4asink_auto_in_aw_mem_4_cache = auto_axi4in_xing_in_aw_mem_4_cache;
  assign axi4asink_auto_in_aw_mem_4_prot = auto_axi4in_xing_in_aw_mem_4_prot;
  assign axi4asink_auto_in_aw_mem_4_qos = auto_axi4in_xing_in_aw_mem_4_qos;
  assign axi4asink_auto_in_aw_mem_5_id = auto_axi4in_xing_in_aw_mem_5_id;
  assign axi4asink_auto_in_aw_mem_5_addr = auto_axi4in_xing_in_aw_mem_5_addr;
  assign axi4asink_auto_in_aw_mem_5_len = auto_axi4in_xing_in_aw_mem_5_len;
  assign axi4asink_auto_in_aw_mem_5_size = auto_axi4in_xing_in_aw_mem_5_size;
  assign axi4asink_auto_in_aw_mem_5_burst = auto_axi4in_xing_in_aw_mem_5_burst;
  assign axi4asink_auto_in_aw_mem_5_lock = auto_axi4in_xing_in_aw_mem_5_lock;
  assign axi4asink_auto_in_aw_mem_5_cache = auto_axi4in_xing_in_aw_mem_5_cache;
  assign axi4asink_auto_in_aw_mem_5_prot = auto_axi4in_xing_in_aw_mem_5_prot;
  assign axi4asink_auto_in_aw_mem_5_qos = auto_axi4in_xing_in_aw_mem_5_qos;
  assign axi4asink_auto_in_aw_mem_6_id = auto_axi4in_xing_in_aw_mem_6_id;
  assign axi4asink_auto_in_aw_mem_6_addr = auto_axi4in_xing_in_aw_mem_6_addr;
  assign axi4asink_auto_in_aw_mem_6_len = auto_axi4in_xing_in_aw_mem_6_len;
  assign axi4asink_auto_in_aw_mem_6_size = auto_axi4in_xing_in_aw_mem_6_size;
  assign axi4asink_auto_in_aw_mem_6_burst = auto_axi4in_xing_in_aw_mem_6_burst;
  assign axi4asink_auto_in_aw_mem_6_lock = auto_axi4in_xing_in_aw_mem_6_lock;
  assign axi4asink_auto_in_aw_mem_6_cache = auto_axi4in_xing_in_aw_mem_6_cache;
  assign axi4asink_auto_in_aw_mem_6_prot = auto_axi4in_xing_in_aw_mem_6_prot;
  assign axi4asink_auto_in_aw_mem_6_qos = auto_axi4in_xing_in_aw_mem_6_qos;
  assign axi4asink_auto_in_aw_mem_7_id = auto_axi4in_xing_in_aw_mem_7_id;
  assign axi4asink_auto_in_aw_mem_7_addr = auto_axi4in_xing_in_aw_mem_7_addr;
  assign axi4asink_auto_in_aw_mem_7_len = auto_axi4in_xing_in_aw_mem_7_len;
  assign axi4asink_auto_in_aw_mem_7_size = auto_axi4in_xing_in_aw_mem_7_size;
  assign axi4asink_auto_in_aw_mem_7_burst = auto_axi4in_xing_in_aw_mem_7_burst;
  assign axi4asink_auto_in_aw_mem_7_lock = auto_axi4in_xing_in_aw_mem_7_lock;
  assign axi4asink_auto_in_aw_mem_7_cache = auto_axi4in_xing_in_aw_mem_7_cache;
  assign axi4asink_auto_in_aw_mem_7_prot = auto_axi4in_xing_in_aw_mem_7_prot;
  assign axi4asink_auto_in_aw_mem_7_qos = auto_axi4in_xing_in_aw_mem_7_qos;
  assign axi4asink_auto_in_aw_widx = auto_axi4in_xing_in_aw_widx;
  assign axi4asink_auto_in_aw_safe_widx_valid = auto_axi4in_xing_in_aw_safe_widx_valid;
  assign axi4asink_auto_in_aw_safe_source_reset_n = auto_axi4in_xing_in_aw_safe_source_reset_n;
  assign axi4asink_auto_in_w_mem_0_data = auto_axi4in_xing_in_w_mem_0_data;
  assign axi4asink_auto_in_w_mem_0_strb = auto_axi4in_xing_in_w_mem_0_strb;
  assign axi4asink_auto_in_w_mem_0_last = auto_axi4in_xing_in_w_mem_0_last;
  assign axi4asink_auto_in_w_mem_1_data = auto_axi4in_xing_in_w_mem_1_data;
  assign axi4asink_auto_in_w_mem_1_strb = auto_axi4in_xing_in_w_mem_1_strb;
  assign axi4asink_auto_in_w_mem_1_last = auto_axi4in_xing_in_w_mem_1_last;
  assign axi4asink_auto_in_w_mem_2_data = auto_axi4in_xing_in_w_mem_2_data;
  assign axi4asink_auto_in_w_mem_2_strb = auto_axi4in_xing_in_w_mem_2_strb;
  assign axi4asink_auto_in_w_mem_2_last = auto_axi4in_xing_in_w_mem_2_last;
  assign axi4asink_auto_in_w_mem_3_data = auto_axi4in_xing_in_w_mem_3_data;
  assign axi4asink_auto_in_w_mem_3_strb = auto_axi4in_xing_in_w_mem_3_strb;
  assign axi4asink_auto_in_w_mem_3_last = auto_axi4in_xing_in_w_mem_3_last;
  assign axi4asink_auto_in_w_mem_4_data = auto_axi4in_xing_in_w_mem_4_data;
  assign axi4asink_auto_in_w_mem_4_strb = auto_axi4in_xing_in_w_mem_4_strb;
  assign axi4asink_auto_in_w_mem_4_last = auto_axi4in_xing_in_w_mem_4_last;
  assign axi4asink_auto_in_w_mem_5_data = auto_axi4in_xing_in_w_mem_5_data;
  assign axi4asink_auto_in_w_mem_5_strb = auto_axi4in_xing_in_w_mem_5_strb;
  assign axi4asink_auto_in_w_mem_5_last = auto_axi4in_xing_in_w_mem_5_last;
  assign axi4asink_auto_in_w_mem_6_data = auto_axi4in_xing_in_w_mem_6_data;
  assign axi4asink_auto_in_w_mem_6_strb = auto_axi4in_xing_in_w_mem_6_strb;
  assign axi4asink_auto_in_w_mem_6_last = auto_axi4in_xing_in_w_mem_6_last;
  assign axi4asink_auto_in_w_mem_7_data = auto_axi4in_xing_in_w_mem_7_data;
  assign axi4asink_auto_in_w_mem_7_strb = auto_axi4in_xing_in_w_mem_7_strb;
  assign axi4asink_auto_in_w_mem_7_last = auto_axi4in_xing_in_w_mem_7_last;
  assign axi4asink_auto_in_w_widx = auto_axi4in_xing_in_w_widx;
  assign axi4asink_auto_in_w_safe_widx_valid = auto_axi4in_xing_in_w_safe_widx_valid;
  assign axi4asink_auto_in_w_safe_source_reset_n = auto_axi4in_xing_in_w_safe_source_reset_n;
  assign axi4asink_auto_in_b_ridx = auto_axi4in_xing_in_b_ridx;
  assign axi4asink_auto_in_b_safe_ridx_valid = auto_axi4in_xing_in_b_safe_ridx_valid;
  assign axi4asink_auto_in_b_safe_sink_reset_n = auto_axi4in_xing_in_b_safe_sink_reset_n;
  assign axi4asink_auto_in_ar_mem_0_id = auto_axi4in_xing_in_ar_mem_0_id;
  assign axi4asink_auto_in_ar_mem_0_addr = auto_axi4in_xing_in_ar_mem_0_addr;
  assign axi4asink_auto_in_ar_mem_0_len = auto_axi4in_xing_in_ar_mem_0_len;
  assign axi4asink_auto_in_ar_mem_0_size = auto_axi4in_xing_in_ar_mem_0_size;
  assign axi4asink_auto_in_ar_mem_0_burst = auto_axi4in_xing_in_ar_mem_0_burst;
  assign axi4asink_auto_in_ar_mem_0_lock = auto_axi4in_xing_in_ar_mem_0_lock;
  assign axi4asink_auto_in_ar_mem_0_cache = auto_axi4in_xing_in_ar_mem_0_cache;
  assign axi4asink_auto_in_ar_mem_0_prot = auto_axi4in_xing_in_ar_mem_0_prot;
  assign axi4asink_auto_in_ar_mem_0_qos = auto_axi4in_xing_in_ar_mem_0_qos;
  assign axi4asink_auto_in_ar_mem_1_id = auto_axi4in_xing_in_ar_mem_1_id;
  assign axi4asink_auto_in_ar_mem_1_addr = auto_axi4in_xing_in_ar_mem_1_addr;
  assign axi4asink_auto_in_ar_mem_1_len = auto_axi4in_xing_in_ar_mem_1_len;
  assign axi4asink_auto_in_ar_mem_1_size = auto_axi4in_xing_in_ar_mem_1_size;
  assign axi4asink_auto_in_ar_mem_1_burst = auto_axi4in_xing_in_ar_mem_1_burst;
  assign axi4asink_auto_in_ar_mem_1_lock = auto_axi4in_xing_in_ar_mem_1_lock;
  assign axi4asink_auto_in_ar_mem_1_cache = auto_axi4in_xing_in_ar_mem_1_cache;
  assign axi4asink_auto_in_ar_mem_1_prot = auto_axi4in_xing_in_ar_mem_1_prot;
  assign axi4asink_auto_in_ar_mem_1_qos = auto_axi4in_xing_in_ar_mem_1_qos;
  assign axi4asink_auto_in_ar_mem_2_id = auto_axi4in_xing_in_ar_mem_2_id;
  assign axi4asink_auto_in_ar_mem_2_addr = auto_axi4in_xing_in_ar_mem_2_addr;
  assign axi4asink_auto_in_ar_mem_2_len = auto_axi4in_xing_in_ar_mem_2_len;
  assign axi4asink_auto_in_ar_mem_2_size = auto_axi4in_xing_in_ar_mem_2_size;
  assign axi4asink_auto_in_ar_mem_2_burst = auto_axi4in_xing_in_ar_mem_2_burst;
  assign axi4asink_auto_in_ar_mem_2_lock = auto_axi4in_xing_in_ar_mem_2_lock;
  assign axi4asink_auto_in_ar_mem_2_cache = auto_axi4in_xing_in_ar_mem_2_cache;
  assign axi4asink_auto_in_ar_mem_2_prot = auto_axi4in_xing_in_ar_mem_2_prot;
  assign axi4asink_auto_in_ar_mem_2_qos = auto_axi4in_xing_in_ar_mem_2_qos;
  assign axi4asink_auto_in_ar_mem_3_id = auto_axi4in_xing_in_ar_mem_3_id;
  assign axi4asink_auto_in_ar_mem_3_addr = auto_axi4in_xing_in_ar_mem_3_addr;
  assign axi4asink_auto_in_ar_mem_3_len = auto_axi4in_xing_in_ar_mem_3_len;
  assign axi4asink_auto_in_ar_mem_3_size = auto_axi4in_xing_in_ar_mem_3_size;
  assign axi4asink_auto_in_ar_mem_3_burst = auto_axi4in_xing_in_ar_mem_3_burst;
  assign axi4asink_auto_in_ar_mem_3_lock = auto_axi4in_xing_in_ar_mem_3_lock;
  assign axi4asink_auto_in_ar_mem_3_cache = auto_axi4in_xing_in_ar_mem_3_cache;
  assign axi4asink_auto_in_ar_mem_3_prot = auto_axi4in_xing_in_ar_mem_3_prot;
  assign axi4asink_auto_in_ar_mem_3_qos = auto_axi4in_xing_in_ar_mem_3_qos;
  assign axi4asink_auto_in_ar_mem_4_id = auto_axi4in_xing_in_ar_mem_4_id;
  assign axi4asink_auto_in_ar_mem_4_addr = auto_axi4in_xing_in_ar_mem_4_addr;
  assign axi4asink_auto_in_ar_mem_4_len = auto_axi4in_xing_in_ar_mem_4_len;
  assign axi4asink_auto_in_ar_mem_4_size = auto_axi4in_xing_in_ar_mem_4_size;
  assign axi4asink_auto_in_ar_mem_4_burst = auto_axi4in_xing_in_ar_mem_4_burst;
  assign axi4asink_auto_in_ar_mem_4_lock = auto_axi4in_xing_in_ar_mem_4_lock;
  assign axi4asink_auto_in_ar_mem_4_cache = auto_axi4in_xing_in_ar_mem_4_cache;
  assign axi4asink_auto_in_ar_mem_4_prot = auto_axi4in_xing_in_ar_mem_4_prot;
  assign axi4asink_auto_in_ar_mem_4_qos = auto_axi4in_xing_in_ar_mem_4_qos;
  assign axi4asink_auto_in_ar_mem_5_id = auto_axi4in_xing_in_ar_mem_5_id;
  assign axi4asink_auto_in_ar_mem_5_addr = auto_axi4in_xing_in_ar_mem_5_addr;
  assign axi4asink_auto_in_ar_mem_5_len = auto_axi4in_xing_in_ar_mem_5_len;
  assign axi4asink_auto_in_ar_mem_5_size = auto_axi4in_xing_in_ar_mem_5_size;
  assign axi4asink_auto_in_ar_mem_5_burst = auto_axi4in_xing_in_ar_mem_5_burst;
  assign axi4asink_auto_in_ar_mem_5_lock = auto_axi4in_xing_in_ar_mem_5_lock;
  assign axi4asink_auto_in_ar_mem_5_cache = auto_axi4in_xing_in_ar_mem_5_cache;
  assign axi4asink_auto_in_ar_mem_5_prot = auto_axi4in_xing_in_ar_mem_5_prot;
  assign axi4asink_auto_in_ar_mem_5_qos = auto_axi4in_xing_in_ar_mem_5_qos;
  assign axi4asink_auto_in_ar_mem_6_id = auto_axi4in_xing_in_ar_mem_6_id;
  assign axi4asink_auto_in_ar_mem_6_addr = auto_axi4in_xing_in_ar_mem_6_addr;
  assign axi4asink_auto_in_ar_mem_6_len = auto_axi4in_xing_in_ar_mem_6_len;
  assign axi4asink_auto_in_ar_mem_6_size = auto_axi4in_xing_in_ar_mem_6_size;
  assign axi4asink_auto_in_ar_mem_6_burst = auto_axi4in_xing_in_ar_mem_6_burst;
  assign axi4asink_auto_in_ar_mem_6_lock = auto_axi4in_xing_in_ar_mem_6_lock;
  assign axi4asink_auto_in_ar_mem_6_cache = auto_axi4in_xing_in_ar_mem_6_cache;
  assign axi4asink_auto_in_ar_mem_6_prot = auto_axi4in_xing_in_ar_mem_6_prot;
  assign axi4asink_auto_in_ar_mem_6_qos = auto_axi4in_xing_in_ar_mem_6_qos;
  assign axi4asink_auto_in_ar_mem_7_id = auto_axi4in_xing_in_ar_mem_7_id;
  assign axi4asink_auto_in_ar_mem_7_addr = auto_axi4in_xing_in_ar_mem_7_addr;
  assign axi4asink_auto_in_ar_mem_7_len = auto_axi4in_xing_in_ar_mem_7_len;
  assign axi4asink_auto_in_ar_mem_7_size = auto_axi4in_xing_in_ar_mem_7_size;
  assign axi4asink_auto_in_ar_mem_7_burst = auto_axi4in_xing_in_ar_mem_7_burst;
  assign axi4asink_auto_in_ar_mem_7_lock = auto_axi4in_xing_in_ar_mem_7_lock;
  assign axi4asink_auto_in_ar_mem_7_cache = auto_axi4in_xing_in_ar_mem_7_cache;
  assign axi4asink_auto_in_ar_mem_7_prot = auto_axi4in_xing_in_ar_mem_7_prot;
  assign axi4asink_auto_in_ar_mem_7_qos = auto_axi4in_xing_in_ar_mem_7_qos;
  assign axi4asink_auto_in_ar_widx = auto_axi4in_xing_in_ar_widx;
  assign axi4asink_auto_in_ar_safe_widx_valid = auto_axi4in_xing_in_ar_safe_widx_valid;
  assign axi4asink_auto_in_ar_safe_source_reset_n = auto_axi4in_xing_in_ar_safe_source_reset_n;
  assign axi4asink_auto_in_r_ridx = auto_axi4in_xing_in_r_ridx;
  assign axi4asink_auto_in_r_safe_ridx_valid = auto_axi4in_xing_in_r_safe_ridx_valid;
  assign axi4asink_auto_in_r_safe_sink_reset_n = auto_axi4in_xing_in_r_safe_sink_reset_n;
  assign axi4asink_auto_out_aw_ready = nvmmctr_io_mbus_awready;
  assign axi4asink_auto_out_w_ready = blackbox_s_axi_wready;
  assign axi4asink_auto_out_b_valid = blackbox_s_axi_bvalid;
  assign axi4asink_auto_out_b_bits_id = blackbox_s_axi_bid;
  assign axi4asink_auto_out_b_bits_resp = blackbox_s_axi_bresp;
  assign axi4asink_auto_out_ar_ready = nvmmctr_io_mbus_arready;
  assign axi4asink_auto_out_r_valid = blackbox_s_axi_rvalid;
  assign axi4asink_auto_out_r_bits_id = blackbox_s_axi_rid;
  assign axi4asink_auto_out_r_bits_data = blackbox_s_axi_rdata;
  assign axi4asink_auto_out_r_bits_resp = blackbox_s_axi_rresp;
  assign axi4asink_auto_out_r_bits_last = blackbox_s_axi_rlast;
  assign blackbox_nvmm_begin = io_port_nvmm_begin;
  assign blackbox_lat_fr = io_port_lat_fr;
  assign blackbox_lat_fw = io_port_lat_fw;
  assign blackbox_sys_clk_i = io_port_sys_clk_i;
  assign blackbox_aresetn = io_port_aresetn;
  assign blackbox_sys_rst = io_port_sys_rst;
  assign blackbox_app_sr_req = 1'h0;
  assign blackbox_app_ref_req = 1'h0;
  assign blackbox_app_zq_req = 1'h0;
  assign blackbox_s_axi_awid = axi4asink_auto_out_aw_bits_id;
  assign blackbox_s_axi_awaddr = awaddr[31:0];
  assign blackbox_s_axi_awlen = axi4asink_auto_out_aw_bits_len;
  assign blackbox_s_axi_awsize = axi4asink_auto_out_aw_bits_size;
  assign blackbox_s_axi_awburst = axi4asink_auto_out_aw_bits_burst;
  assign blackbox_s_axi_awlock = axi4asink_auto_out_aw_bits_lock;
  assign blackbox_s_axi_awcache = 4'h3;
  assign blackbox_s_axi_awprot = axi4asink_auto_out_aw_bits_prot;
  assign blackbox_s_axi_awqos = axi4asink_auto_out_aw_bits_qos;
  assign blackbox_s_axi_awvalid = nvmmctr_io_mig_awvalid;
  assign blackbox_s_axi_wdata = axi4asink_auto_out_w_bits_data;
  assign blackbox_s_axi_wstrb = axi4asink_auto_out_w_bits_strb;
  assign blackbox_s_axi_wlast = axi4asink_auto_out_w_bits_last;
  assign blackbox_s_axi_wvalid = axi4asink_auto_out_w_valid;
  assign blackbox_s_axi_bready = axi4asink_auto_out_b_ready;
  assign blackbox_s_axi_arid = axi4asink_auto_out_ar_bits_id;
  assign blackbox_s_axi_araddr = araddr[31:0];
  assign blackbox_s_axi_arlen = axi4asink_auto_out_ar_bits_len;
  assign blackbox_s_axi_arsize = axi4asink_auto_out_ar_bits_size;
  assign blackbox_s_axi_arburst = axi4asink_auto_out_ar_bits_burst;
  assign blackbox_s_axi_arlock = axi4asink_auto_out_ar_bits_lock;
  assign blackbox_s_axi_arcache = 4'h3;
  assign blackbox_s_axi_arprot = axi4asink_auto_out_ar_bits_prot;
  assign blackbox_s_axi_arqos = axi4asink_auto_out_ar_bits_qos;
  assign blackbox_s_axi_arvalid = nvmmctr_io_mig_arvalid;
  assign blackbox_s_axi_rready = axi4asink_auto_out_r_ready;
  assign nvmmctr_clock = io_port_sys_clk_i;
  assign nvmmctr_reset = io_port_sys_rst;
  assign nvmmctr_io_mbus_arvalid = axi4asink_auto_out_ar_valid;
  assign nvmmctr_io_mbus_araddr = araddr[31:0];
  assign nvmmctr_io_mbus_awvalid = axi4asink_auto_out_aw_valid;
  assign nvmmctr_io_mbus_awaddr = awaddr[31:0];
  assign nvmmctr_io_mig_arready = blackbox_s_axi_arready;
  assign nvmmctr_io_mig_awready = blackbox_s_axi_awready;
  assign nvmmctr_io_nvmm_begin = io_port_nvmm_begin;
  assign nvmmctr_io_lat_cr = io_port_lat_cr;
  assign nvmmctr_io_lat_cw = io_port_lat_cw;
  assign nvmmctr_io_lat_dr256 = io_port_lat_dr256;
  assign nvmmctr_io_lat_dr4096 = io_port_lat_dr4096;
  assign nvmmctr_io_lat_dw256 = io_port_lat_dw256;
  assign nvmmctr_io_lat_dw4096 = io_port_lat_dw4096;
endmodule

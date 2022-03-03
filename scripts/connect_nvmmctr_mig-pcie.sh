#!/bin/sh

# Get current config & verilog file
base="$(realpath $( dirname $0 ))/../"
builds="${base}/builds"
conf=$( grep -oE "DevKitU500FPGADesign_WithDevKit([0-9]*)MHz" ${base}/Makefile.vc707-u500devkit )
v="${builds}/vc707-u500devkit/sifive.freedom.unleashed.${conf}.v"

# delete all tail comments
sed -i -E "s/ \/\/ @.*$//g" $v

# add following macros for initialization
#   `define RANDOMIZE_GARBAGE_ASSIGN
#   `define RANDOMIZE_INVALID_ASSIGN
#   `define RANDOMIZE_REG_INIT
#   `define RANDOMIZE_MEM_INIT
#   `define RANDOM 0
sed -i -e "1i \`define RANDOMIZE_GARBAGE_ASSIGN\n\`define RANDOMIZE_INVALID_ASSIGN\n\`define RANDOMIZE_REG_INIT\n\`define RANDOMIZE_MEM_INIT\n\`define RANDOM 0\n\n" $v

# replace module parameter format (int -> string) for Vivado simulator
sed -i -e 's/IBUF_DELAY_VALUE(0)/IBUF_DELAY_VALUE("0")/g' $v



#####################################
#                                   #
#            VC707PCIeShell         #
#                                   #
#####################################

# delete all I/O ports from VC707PCIeShell
#  input  [2:0]  ddr_nvmm_begin,
#  input  [9:0]  ddr_lat_fr,
#  input  [9:0]  ddr_lat_fw,
#  output [63:0] ddr_cnt_act,
sed -i -E "s/(input  \[2:0\]  ddr_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(input  \[9:0\]  ddr_tRCD2)/\/\/\1/g"  $v
sed -i -E "s/(input  \[9:0\]  ddr_tRP2)/\/\/\1/g"  $v
sed -i -E "s/(input  \[10:0\] ddr_tRAS2)/\/\/\1/g"  $v
sed -i -E "s/(output \[39:0\] ddr_cnt_)/\/\/\1/g"  $v

# delete all wires from VC707PCIeShell
#  wire [2:0] topDesign_auto_topMod_io_out_0_port_nvmm_begin;
#  wire [9:0] topDesign_auto_topMod_io_out_0_port_lat_fr;
#  wire [9:0] topDesign_auto_topMod_io_out_0_port_lat_fw;
#  wire [63:0] topDesign_auto_topMod_io_out_0_port_cnt_act;
sed -i -E "s/(wire \[2:0\] topDesign_auto_topMod_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] topDesign_auto_topMod_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] topDesign_auto_topMod_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(wire \[10:0\] topDesign_auto_topMod_io_out_0_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(wire \[63:0\] topDesign_auto_topMod_io_out_0_port_cnt_)/\/\/\1/g" $v

# delete all I/O assigns between VC707BaseShell <--> DevKitWrapper
#    .auto_topMod_io_out_0_port_nvmm_begin(topDesign_auto_topMod_io_out_0_port_nvmm_begin),
#    .auto_topMod_io_out_0_port_lat_fr(topDesign_auto_topMod_io_out_0_port_lat_fr),
#    .auto_topMod_io_out_0_port_lat_fw(topDesign_auto_topMod_io_out_0_port_lat_fw),
#    .auto_topMod_io_out_0_port_cnt_act(topDesign_auto_topMod_io_out_0_port_cnt_act),
sed -i -E "s/(\.auto_topMod_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(\.auto_topMod_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(\.auto_topMod_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(\.auto_topMod_io_out_0_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(\.auto_topMod_io_out_0_port_cnt_)/\/\/\1/g" $v

# delete all assigns
#  assign ddr_cnt_act = topDesign_auto_topMod_io_out_port_cnt_act;
#  assign ddr_cnt_pre = topDesign_auto_topMod_io_out_port_cnt_pre;
#  assign topDesign_auto_topMod_io_out_port_nvmm_begin = ddr_nvmm_begin;
#  assign topDesign_auto_topMod_io_out_port_lat_fr = ddr_lat_fr;
#  assign topDesign_auto_topMod_io_out_port_lat_fw = ddr_lat_fw;
sed -i -E "s/(assign ddr_cnt_)/\/\/\1/g" $v
sed -i -E "s/(assign topDesign_auto_topMod_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(assign topDesign_auto_topMod_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(assign topDesign_auto_topMod_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(assign topDesign_auto_topMod_io_out_0_port_tRAS2)/\/\/\1/g" $v




#####################################
#                                   #
#            DevKitWrapper          #
#                                   #
#####################################

# delete all I/O ports from DevKitWrapper
#  input  [2:0]  auto_topMod_io_out_0_port_nvmm_begin,
#  input  [9:0]  auto_topMod_io_out_0_port_lat_fr,
#  input  [9:0]  auto_topMod_io_out_0_port_lat_fw,
#  output [63:0] auto_topMod_io_out_0_port_cnt_act,
sed -i -E "s/(input  \[2:0\]  auto_topMod_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(input  \[9:0\]  auto_topMod_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(input  \[9:0\]  auto_topMod_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(input  \[10:0\] auto_topMod_io_out_0_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(output \[63:0\] auto_topMod_io_out_0_port_cnt_)/\/\/\1/g" $v

# delete all wires from DevKitWrapper
#  wire [2:0] topMod_auto_io_out_0_port_nvmm_begin;
#  wire [9:0] topMod_auto_io_out_0_port_lat_fr;
#  wire [9:0] topMod_auto_io_out_0_port_lat_fw;
#  wire [63:0] topMod_auto_io_out_0_port_cnt_act;
#  wire [63:0] topMod_nvmmctr_io_nvmm_begin;
#  wire [63:0] topMod_nvmmctr_io_lat_cr;
#  wire [63:0] topMod_nvmmctr_io_lat_cw;
#  wire [63:0] topMod_nvmmctr_io_lat_fr;
#  wire [63:0] topMod_nvmmctr_io_lat_fw;
#  wire [63:0] topMod_nvmmctr_io_lat_dr256;
#  wire [63:0] topMod_nvmmctr_io_lat_dr4096;
#  wire [63:0] topMod_nvmmctr_io_lat_dw256;
#  wire [63:0] topMod_nvmmctr_io_lat_dw4096;
#  wire [63:0] topMod_nvmmctr_io_cnt_read;
#  wire [63:0] topMod_nvmmctr_io_cnt_write;
#  wire [63:0] topMod_nvmmctr_io_cnt_act;
#  wire [63:0] topMod_nvmmctr_io_cnt_bdr;
#  wire [63:0] topMod_nvmmctr_io_cnt_bdw;
sed -i -E "s/(wire \[2:0\] topMod_auto_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] topMod_auto_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] topMod_auto_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(wire \[10:0\] topMod_auto_io_out_0_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(wire \[63:0\] topMod_auto_io_out_0_port_cnt_)/\/\/\1/g" $v
sed -i -E "s/(wire \[2:0\] topMod_nvmmctr_io_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] topMod_nvmmctr_io_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] topMod_nvmmctr_io_tRP2)/\/\/\1/g" $v
sed -i -E "s/(wire \[10:0\] topMod_nvmmctr_io_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(wire \[63:0\] topMod_nvmmctr_io_cnt_)/\/\/\1/g" $v

# delete all I/O assigns between DevKitWrapper <--> DevKitFPGADesign
#    .auto_io_out_0_port_nvmm_begin(topMod_auto_io_out_0_port_nvmm_begin),
#    .auto_io_out_0_port_lat_fr(topMod_auto_io_out_0_port_lat_fr),
#    .auto_io_out_0_port_lat_fw(topMod_auto_io_out_0_port_lat_fw),
#    .auto_io_out_0_port_cnt_act(topMod_auto_io_out_0_port_cnt_act),
#    .nvmmctr_io_nvmm_begin(topMod_nvmmctr_io_nvmm_begin),
#    .nvmmctr_io_lat_cr(topMod_nvmmctr_io_lat_cr),
#    .nvmmctr_io_lat_cw(topMod_nvmmctr_io_lat_cw),
#    .nvmmctr_io_lat_fr(topMod_nvmmctr_io_lat_fr),
#    .nvmmctr_io_lat_fw(topMod_nvmmctr_io_lat_fw),
#    .nvmmctr_io_lat_dr256(topMod_nvmmctr_io_lat_dr256),
#    .nvmmctr_io_lat_dr4096(topMod_nvmmctr_io_lat_dr4096),
#    .nvmmctr_io_lat_dw256(topMod_nvmmctr_io_lat_dw256),
#    .nvmmctr_io_lat_dw4096(topMod_nvmmctr_io_lat_dw4096),
#    .nvmmctr_io_cnt_read(topMod_nvmmctr_io_cnt_read),
#    .nvmmctr_io_cnt_write(topMod_nvmmctr_io_cnt_write),
#    .nvmmctr_io_cnt_act(topMod_nvmmctr_io_cnt_act),
#    .nvmmctr_io_cnt_bdr(topMod_nvmmctr_io_cnt_bdr),
#    .nvmmctr_io_cnt_bdw(topMod_nvmmctr_io_cnt_bdw)
sed -i -E "s/(\.auto_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(\.auto_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(\.auto_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(\.auto_io_out_0_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(\.auto_io_out_0_port_cnt_)/\/\/\1/g" $v
sed -i -E "s/(\.nvmmctr_io_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(\.nvmmctr_io_lat_)/\/\/\1/g" $v
sed -i -E "s/(\.nvmmctr_io_cnt_)/\/\/\1/g" $v
sed -i -E "s/\.debug_ndreset\(topMod_debug_ndreset\),/.debug_ndreset(topMod_debug_ndreset)/g" $v

# delete all assigns
#  assign auto_topMod_io_out_0_port_cnt_act = topMod_auto_io_out_0_port_cnt_act;
#  assign topMod_auto_io_out_0_port_nvmm_begin = auto_topMod_io_out_0_port_nvmm_begin;
#  assign topMod_auto_io_out_0_port_lat_fr = auto_topMod_io_out_0_port_lat_fr;
#  assign topMod_auto_io_out_0_port_lat_fw = auto_topMod_io_out_0_port_lat_fw;
#  assign topMod_nvmmctr_io_cnt_read = 64'h0;
#  assign topMod_nvmmctr_io_cnt_write = 64'h0;
#  assign topMod_nvmmctr_io_cnt_act = 64'h0;
#  assign topMod_nvmmctr_io_cnt_bdr = 64'h0;
#  assign topMod_nvmmctr_io_cnt_bdw = 64'h0;
sed -i -E "s/(assign auto_topMod_io_out_0_port_cnt_)/\/\/\1/g" $v
sed -i -E "s/(assign topMod_auto_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(assign topMod_auto_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(assign topMod_auto_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(assign topMod_auto_io_out_0_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(assign topMod_nvmmctr_io_cnt_)/\/\/\1/g" $v




#####################################
#                                   #
#          DevKitFPGADesign         #
#                                   #
#####################################

# delete all I/O ports
#  input  [2:0]  auto_io_out_0_port_nvmm_begin,
#  input  [9:0]  auto_io_out_0_port_lat_fr,
#  input  [9:0]  auto_io_out_0_port_lat_fw,
#  output [63:0] auto_io_out_0_port_cnt_act,
#  output [63:0] nvmmctr_io_nvmm_begin,
#  output [63:0] nvmmctr_io_lat_cr,
#  output [63:0] nvmmctr_io_lat_cw,
#  output [63:0] nvmmctr_io_lat_fr,
#  output [63:0] nvmmctr_io_lat_fw,
#  output [63:0] nvmmctr_io_lat_dr256,
#  output [63:0] nvmmctr_io_lat_dr4096,
#  output [63:0] nvmmctr_io_lat_dw256,
#  output [63:0] nvmmctr_io_lat_dw4096,
#  input  [63:0] nvmmctr_io_cnt_read,
#  input  [63:0] nvmmctr_io_cnt_write,
#  input  [63:0] nvmmctr_io_cnt_act,
#  input  [63:0] nvmmctr_io_cnt_bdr,
#  input  [63:0] nvmmctr_io_cnt_bdw
sed -i -E "s/(input  \[2:0\]  auto_io_out_0_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(input  \[9:0\]  auto_io_out_0_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(input  \[9:0\]  auto_io_out_0_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(input  \[10:0\] auto_io_out_0_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(output \[63:0\] auto_io_out_0_port_cnt_)/\/\/\1/g" $v
sed -i -E "s/(output \[2:0\]  nvmmctr_io_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(output \[9:0\]  nvmmctr_io_lat_)/\/\/\1/g" $v
sed -i -E "s/(output \[10:0\] nvmmctr_io_lat_)/\/\/\1/g" $v
sed -i -E "s/(input  \[63:0\] nvmmctr_io_cnt_)/\/\/\1/g" $v
sed -i -E "s/output        debug_ndreset,/output        debug_ndreset/g" $v


# delete all wires from DevKitFPGADesign
#  wire [2:0] mig_io_port_nvmm_begin;
#  wire [9:0] mig_io_port_lat_fr;
#  wire [9:0] mig_io_port_lat_fw;
#  wire [63:0] mig_io_port_cnt_act;
#  wire [9:0] mig_io_port_lat_cr;
#  wire [9:0] mig_io_port_lat_cw;
#  wire [63:0] mig_io_port_lat_dr256;
#  wire [63:0] mig_io_port_lat_dr4096;
#  wire [63:0] mig_io_port_lat_dw256;
#  wire [63:0] mig_io_port_lat_dw4096;
#  wire [63:0] mig_io_port_cnt_read;
#  wire [63:0] mig_io_port_cnt_write;
#  wire [63:0] mig_io_port_cnt_bdr;
#  wire [63:0] mig_io_port_cnt_bdw;
sed -i -E "s/(wire \[2:0\] mig_io_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] mig_io_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(wire \[9:0\] mig_io_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(wire \[10:0\] mig_io_port_tRAS2)/\/\/\1/g" $v
sed -i -E "s/(wire \[63:0\] mig_io_port_cnt_)/\/\/\1/g" $v


# connect MIG's in/out to TLNVMMCTR's out/in
#    .io_port_nvmm_begin(mig_io_port_nvmm_begin),
#    .io_port_lat_fr(mig_io_port_lat_fr),
#    .io_port_lat_fw(mig_io_port_lat_fw),
#    .io_port_cnt_act(mig_io_port_cnt_act),
#    .io_port_lat_cr(mig_io_port_lat_cr),
#    .io_port_lat_cw(mig_io_port_lat_cw),
#    .io_port_lat_dr256(mig_io_port_lat_dr256),
#    .io_port_lat_dr4096(mig_io_port_lat_dr4096),
#    .io_port_lat_dw256(mig_io_port_lat_dw256),
#    .io_port_lat_dw4096(mig_io_port_lat_dw4096),
#    .io_port_cnt_read(mig_io_port_cnt_read),
#    .io_port_cnt_write(mig_io_port_cnt_write),
#    .io_port_cnt_bdr(mig_io_port_cnt_bdr),
#    .io_port_cnt_bdw(mig_io_port_cnt_bdw)
sed -i -E "s/\(mig_io_port_nvmm_/(nvmmctr__io_nvmm_/g" $v
sed -i -E "s/\(mig_io_port_lat_/(nvmmctr__io_lat_/g" $v
sed -i -E "s/\(mig_io_port_tRCD2/(nvmmctr__io_lat_tRCD2/g" $v
sed -i -E "s/\(mig_io_port_tRP2/(nvmmctr__io_lat_tRP2/g" $v
sed -i -E "s/\(mig_io_port_tRAS2/(nvmmctr__io_lat_tRAS2/g" $v
sed -i -E "s/\(mig_io_port_cnt_/(nvmmctr__io_cnt_/g" $v


# delete all assigns for MIG
#  assign auto_io_out_port_cnt_act = mig_io_port_cnt_act;
#  assign mig_io_port_nvmm_begin = auto_io_out_port_nvmm_begin;
#  assign mig_io_port_lat_fr = auto_io_out_port_lat_fr;
#  assign mig_io_port_lat_fw = auto_io_out_port_lat_fw;
#  assign nvmmctr_io_nvmm_begin = nvmmctr__io_nvmm_begin;
#  assign nvmmctr_io_lat_cr = nvmmctr__io_lat_cr;
#  assign nvmmctr_io_lat_cw = nvmmctr__io_lat_cw;
#  assign nvmmctr_io_lat_fr = nvmmctr__io_lat_fr;
#  assign nvmmctr_io_lat_fw = nvmmctr__io_lat_fw;
#  assign nvmmctr_io_lat_dr256 = nvmmctr__io_lat_dr256;
#  assign nvmmctr_io_lat_dr4096 = nvmmctr__io_lat_dr4096;
#  assign nvmmctr_io_lat_dw256 = nvmmctr__io_lat_dw256;
#  assign nvmmctr_io_lat_dw4096 = nvmmctr__io_lat_dw4096;
#  assign nvmmctr__io_cnt_read = nvmmctr_io_cnt_read;
#  assign nvmmctr__io_cnt_write = nvmmctr_io_cnt_write;
#  assign nvmmctr__io_cnt_act = nvmmctr_io_cnt_act;
#  assign nvmmctr__io_cnt_bdr = nvmmctr_io_cnt_bdr;
#  assign nvmmctr__io_cnt_bdw = nvmmctr_io_cnt_bdw;
#  assign mig_io_port_nvmm_begin = auto_io_out_0_port_nvmm_begin;
#  assign mig_io_port_lat_cr = 64'h0;
#  assign mig_io_port_lat_cw = 64'h0;
#  assign mig_io_port_lat_dr256 = 64'h0;
#  assign mig_io_port_lat_dr4096 = 64'h0;
#  assign mig_io_port_lat_dw256 = 64'h0;
#  assign mig_io_port_lat_dw4096 = 64'h0;
sed -i -E "s/(assign auto_io_out_0_port_cnt_)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_nvmm_begin = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_cr = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_cw = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_fr = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_fw = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_dr256 = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_dr4096 = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_dw256 = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_dw4096 = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_tRCD2 = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_tRP2 = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr_io_lat_tRAS2 = nvmmctr__)/\/\/\1/g" $v
sed -i -E "s/(assign nvmmctr__io_cnt_)/\/\/\1/g" $v
sed -i -E "s/(assign mig_io_port_nvmm_)/\/\/\1/g" $v
sed -i -E "s/(assign mig_io_port_tRCD2)/\/\/\1/g" $v
sed -i -E "s/(assign mig_io_port_tRP2)/\/\/\1/g" $v
sed -i -E "s/(assign mig_io_port_tRAS2)/\/\/\1/g" $v



# EOF

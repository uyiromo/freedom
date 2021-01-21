// 70 - 129

module AsyncResetReg(
  input   io_d,
  output  io_q,
  input   io_clk,
  input   io_rst
);
  wire  _T;
  reg  reg_;
  reg [31:0] _RAND_0;
  assign _T = io_rst;
  assign io_q = reg_;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  if (_T) begin
    reg_ = 1'h1;
  end
end // initial
`endif // SYNTHESIS
  always @(posedge io_clk or posedge _T) begin
    if (_T) begin
      reg_ <= 1'h1;
    end else begin
      reg_ <= io_d;
    end
  end
endmodule

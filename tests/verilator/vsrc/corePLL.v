/*
 * Dummy CorePLL
 */

module corePLL
  (
   output clk_out1,  //  50MHz
   input reset,
   output locked,
   input clk_in1     // 200MHz
   );

   /*
    *            ___  ___  ___  ___  ___
    * clk_in1  __| |__| |__| |__| |__| |__
    *
    *            ______    ______    _____
    * clk_out1 __|    |____|    |____|
    */

   reg [1:0] __cnt_edge;
   reg       __clk_out1;
   //reg   __locked;

   always @(posedge clk_in1)
     begin
        if (reset)
          begin
             __clk_out1 <= 1'b0;
             __cnt_edge <= 'd0;
          end
        else
          begin
             __cnt_edge <= __cnt_edge + 1'b1;
             if (__cnt_edge[0])
               __clk_out1 <= !__clk_out1;
          end
     end

   assign clk_out1 = __clk_out1;
   assign locked   = 1'b1;

endmodule

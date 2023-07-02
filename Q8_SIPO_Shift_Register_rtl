module SIPO_shift_register #(parameter DATA_WIDTH=16)
  (input clk,
   input resetn,
   input din,
   output [DATA_WIDTH-1:0] dout);
  
  reg [DATA_WIDTH-1:0] temp;
  
  always@(posedge clk) begin
    if(!resetn)
      temp<=0;
    else
      temp<= (temp<<1) | din;
  end
  assign dout = temp;
  
endmodule

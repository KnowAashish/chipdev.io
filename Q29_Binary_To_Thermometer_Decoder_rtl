module binary_to_thermometer_decoder
  (input [7:0] din,
   output reg [255:0] dout);
  
  reg [255:0] out;
  
  always@(din) begin
    out=0;
    for (int i=0; i<=din; i++) begin
      out = (out<<1'b1) | 1'b1;
    end
    //$display("at time t=%0t, din=%0d out=%0h", $time, din, out);
  end
  
  assign dout=out;
  
endmodule

/*Alternate Solutions
1. assign dout = ((1 << din+1)-1);
2. assign dout = {256{1'b1}} >> (255-din);
3. for (int i=0; i<256; i++)
      dout[i] = (i < (din+'d1));
*/

module palindrome_detector #(parameter DATA_WIDTH=32)
  (input [DATA_WIDTH-1:0] din,
   output logic dout);
  
  logic [DATA_WIDTH-1:0] temp;
  
  always@(din) begin
    temp={<<1{din}};
    if(temp==din)
      dout=1;
    else
      dout=0;
  end
  
  //Single Line Solution
  //assign dout = (din == {<<{din}});
  
endmodule

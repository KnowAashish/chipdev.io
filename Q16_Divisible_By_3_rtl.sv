module divisible_by_3 (input clk,
                       input resetn,
                       input din,
                       output logic dout);
  
  logic out;
  longint temp; //64 bit signed integer 2-state data-type
  bit in;
  assign in=din;
  
  always@(posedge clk) begin
    if(!resetn) begin
      temp<=0;
      out<=0;
    end
    
    else begin
      temp = (temp<<1) | in;
      if(temp%3==0)
        out<=1;
      else
        out<=0;
    end
  end
  
  assign dout = out;
  
endmodule

module divisible_by_5 (input clk,
                       input resetn,
                       input din,
                       output logic dout);
  
  logic out;
  longint temp;
  bit in;
  
  assign in=din; // To make sure there is no din=X. bit in is 2-state variable
  
  always@(posedge clk) begin
    if(!resetn) begin
      temp<=0;
      out<=0;
    end
    
    else begin
      //temp = (temp<<1 | din);
      temp = (temp<<1 | in);
      if(temp%5==0)
        out<=1;
      else
        out<=0;
    end
  end
  
  assign dout = out;
  
endmodule

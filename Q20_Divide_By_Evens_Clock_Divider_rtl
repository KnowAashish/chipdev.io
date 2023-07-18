module divide_by_evens_clock_divider
  (input clk,
   input resetn,
   output logic div2,
   output logic div4,
   output logic div6);
  
  int count;
  
  always@(posedge clk) begin
    if(!resetn)
      count<=0;
    
    else
      count++;
  end
  
  assign div2=(count%2==1) ? 1:0;
  assign div4=(count%4==1) || (count%4==2) ? 1:0;
  assign div6=(count%6==1) || (count%6==2) || (count%6==3) ? 1:0;
  
endmodule

module fizzbuzz #(parameter FIZZ=2, BUZZ=3, MAX_CYCLES=20)
  (input clk,
   input resetn,
   output logic fizz,
   output logic buzz,
   output logic fizzbuzz);
  
  int count;
  
  always@(posedge clk) begin
    if(!resetn) begin
      count<=0;
    end
    
    else begin
      count<=count+1;
      if(count==MAX_CYCLES-1)
        count<=0;
    end
  end
  
  assign fizz = (count%FIZZ==0) ? 1:0;
  assign buzz = (count%BUZZ==0) ? 1:0;
  assign fizzbuzz = (fizz && buzz) ? 1:0;
  
endmodule

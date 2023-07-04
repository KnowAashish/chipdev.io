module trailing_zeroes #(parameter DATA_WIDTH=32)
  (input [DATA_WIDTH-1:0] din,
   output logic [$clog2(DATA_WIDTH):0] dout );
  //$clog2 returns how many minimum num of bits will be required to represent the variable.
  
  int mark, count;
  
  always@(din) begin
    count=0;
    mark=0;
    for(int i=0; i<DATA_WIDTH; i++) begin
      if(!mark) begin
        if(din[i]==1) begin
          mark=1;
        end
        else begin
          count=count+1;
        end
      end
    end
  end
  
  assign dout=count;
  
endmodule


/* Alternative Simpler Logic using "break"
always@(din) begin
  dout=0;
  for(int i=0; i<DATA_WIDTH; i++) begin
    if(din[i]) begin
      break;
    end
    else dout++;
  end
end
*/

module counting_ones #(parameter DATA_WIDTH=16)
  (input [DATA_WIDTH-1:0] din,
   output logic [$clog2(DATA_WIDTH):0] dout);
  
  logic [$clog2(DATA_WIDTH):0] count;
  
  always@(din) begin
    count=0;
    for(int i=0; i<DATA_WIDTH; i++) begin
      if(din[i]==1) begin
        count=count+1;
      end
      /* chipdev.io solution logic
      if(din[i]) begin
        count+ = din[i];
      end
      */
    end
  end
  assign dout=count;
endmodule

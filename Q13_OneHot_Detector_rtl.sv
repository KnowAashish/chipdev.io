module onehot_detector #(parameter DATA_WIDTH=32)
  (input [DATA_WIDTH-1:0] din,
   output logic onehot);
  
  int count;
  
  always@(din) begin
    count=0;
    for(int i=0; i<DATA_WIDTH; i++) begin
      if(din[i])
        count++;
    end
  end
  
  assign onehot = (count==1) ? 1:0;  

// Much cleaner 1-Line Solution:
//  assign onehot = (din) && !(din & (din - 1));
  
endmodule

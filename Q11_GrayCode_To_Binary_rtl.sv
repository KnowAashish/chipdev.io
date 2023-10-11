module graycode_to_binary #(parameter DATA_WIDTH=16)
  (input [DATA_WIDTH-1:0] gray,
   output logic [DATA_WIDTH-1:0] bin);
  
  //here the design is combinational i.e. no clock, thus we can use Blocking Assignaments
  always@(gray) begin
    bin[DATA_WIDTH-1]=gray[DATA_WIDTH-1];
    
    for(int i=0; i<DATA_WIDTH-1; i++) begin
      //bin[i]=gray[i]^bin[i-1];
      
      // below is chipdev.io logic. we donot even require line8 for this.
      bin[i]= ^(gray>>i);
    end
  end
endmodule

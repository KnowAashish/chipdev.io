module reversing_bits #(parameter DATA_WIDTH=32)
  (input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout);
	
  //assign din = 'b 1011; // testing
  always@(din) begin
  //always begin  		  // testing
  // LOGIC #1
/*    for (int i=0; i<DATA_WIDTH; i++) begin
      dout[DATA_WIDTH-(i+1)]=din[i];
    end
*/ // LOGIC #2
    //dout = {<<1{din}}; // find out how
    dout <= {<<1{din}};
    //    $monitor("The value of dout is %b", dout);  // testing
//    #10 $finish; // testing
  end
endmodule

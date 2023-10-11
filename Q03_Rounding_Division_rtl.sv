module rounding_division #(parameter
  DIV_LOG2=2,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);
  // real in, out, remainder; // real is not syntheszable BUT it would work fine here in edaplayground, so DOUBT.
  // I used logic [IN_WIDTH-1:0] remainder;
  logic [IN_WIDTH-1:0] remainder;
  wire [IN_WIDTH-1:0] inp;
  assign inp = din;
  int x = (2**DIV_LOG2);

  always @(din) begin
    $display ("*** inside always block ***");
    
    // "Ignoring that modulo might not synthesize, as an interviewer this question would really be looking for a candidate to demonstrate knowledge of bit shifting to do power of two multiplication/division and fixed point arithmetic. So the answer would be "wrong" using modulo and plain division"
    
    //dout = inp/x ;
    dout = inp>>DIV_LOG2;
    //remainder = inp % x;
    remainder = inp[DIV_LOG2-1:0];
    
    if(remainder >= (2**(DIV_LOG2-1))) begin // (remainder/2^DIV_LOG2)*10 >= 5
      dout = dout+1;
      if (dout == 0) // checking overflow of dout
      dout = (2**OUT_WIDTH)-1;
    end
    else
      dout = dout;    
 
    dout = (dout > ((2**OUT_WIDTH)-1)) ? (2**OUT_WIDTH)-1 : dout;
  end
  // assign dout = (dout > ((2**OUT_WIDTH)-1)) ? (2**OUT_WIDTH)-1 : dout; 
 // assign dout = (inp > (((2**OUT_WIDTH)-1)*(2**DIV_LOG2))) ? (2**OUT_WIDTH)-1 : out;
  //cant use assign here as it is continuous statement of dout, and dout has been already in use in above always procedural statement.
  //if we want to use assign here, then we have to use other out var inside procedural always block and assign it to dout conditionally outside always block.
  //assign dout = out;
endmodule

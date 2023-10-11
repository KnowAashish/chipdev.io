module full_adder (input a,
                   input b,
                   input cin,
                   output logic sum,
                   output logic cout);
  
  always@(a,b,cin) begin
    sum=a^b^cin;
    cout=a&b | b&cin | cin&a;
  end
  
endmodule

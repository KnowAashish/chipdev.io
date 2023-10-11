module basic_alu #(parameter DATA_WIDTH=4)
  (input [DATA_WIDTH-1:0] a,
   input [DATA_WIDTH-1:0] b,
   output logic [DATA_WIDTH-1:0] a_plus_b,
   output logic [DATA_WIDTH-1:0] a_minus_b,
   output logic [DATA_WIDTH-1:0] not_a,
   output logic [DATA_WIDTH-1:0] a_and_b,
   output logic [DATA_WIDTH-1:0] a_or_b,
   output logic [DATA_WIDTH-1:0] a_xor_b);

  always@(a,b) begin
    a_plus_b = a+b;
    a_minus_b = a-b;
    not_a = ~a;
    a_and_b= a&b;
    a_or_b = a|b;
    a_xor_b = a^b;
  end
  
endmodule

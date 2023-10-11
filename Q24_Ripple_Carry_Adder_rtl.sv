module full_adder (input x,
                   input y,
                   input cin,
                   output logic sum_fa,
                   output logic cout_fa);

  // Single Line Logic
  assign {cout_fa,sum_fa}= x+y+cin;
  
endmodule

module ripple_carry_adder #(parameter DATA_WIDTH=8)
  (input [DATA_WIDTH-1:0] a,
   input [DATA_WIDTH-1:0] b,
   output logic [DATA_WIDTH-0:0] sum,
   output logic [DATA_WIDTH-1:0] cout_int);
  
  full_adder fa (a[0], b[0], 0, sum[0], cout_int[0]);
  
  generate for (genvar i=1; i<DATA_WIDTH; i++) 
    begin: rippler
      full_adder fa (a[i], b[i], cout_int[i-1], sum[i], cout_int[i]);
    end
  endgenerate
  
  assign sum[DATA_WIDTH]=cout_int[DATA_WIDTH-1];
  
endmodule

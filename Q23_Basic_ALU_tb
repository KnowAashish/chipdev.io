module basic_alu_tb #(parameter DATA_WIDTH=4);
  
  //input=reg output-=wire
  reg [DATA_WIDTH-1:0] A;
  reg [DATA_WIDTH-1:0] B;
  wire [DATA_WIDTH-1:0] A_PLUS_B;
  wire [DATA_WIDTH-1:0] A_MINUS_B;
  wire [DATA_WIDTH-1:0] NOT_A;
  wire [DATA_WIDTH-1:0] A_AND_B;
  wire [DATA_WIDTH-1:0] A_OR_B;
  wire [DATA_WIDTH-1:0] A_XOR_B;
  
  //Instantiate DUT
  basic_alu DUT (.a(A), .b(B), .a_plus_b(A_PLUS_B), .a_minus_b(A_MINUS_B), .not_a(NOT_A), .a_and_b(A_AND_B), .a_or_b(A_OR_B), .a_xor_b(A_XOR_B));
  
  task stimulus(bit [DATA_WIDTH-1:0] val_a= 1001, val_b= 1000);
    {A,B}={val_a, val_b};
    #5;
  endtask
  
  initial begin
    
    $monitor("at time t=%t, A=%0b, B=%0b, A_PLUS_B=%0b, A_MINUS_B=%0b, NOT_A=%0b, A_AND_B=%0b, A_OR_B=%0b, A_XOR_B=%0b", $time, A, B, A_PLUS_B, A_MINUS_B, NOT_A, A_AND_B, A_OR_B, A_XOR_B);
    
    //Test1: Sanity Test to check different input combinations
    stimulus(15,1);
    stimulus(14,2);
    stimulus(13,3);
    stimulus(12,4);
    stimulus(11,5); // Approx 5inpus*5 =25 timeunits
    
    //Test2: Combination of default values
    stimulus();
    stimulus(,4);
    stimulus(12,);
    stimulus(); // Approx 4inputs*5 =20 timeunits
    
    //Test3: Overflow value for A+B. (Max O/P=16 with 4-bit DATA_WIDTH)
    stimulus(12,12);
    stimulus(10,6);
    stimulus(11,9); // Appriox 3inputs*5 =15 timeunits
    
    //Test4: Underflow valuw for A-B, where A<B
    stimulus(5,10);
    stimulus(2,4);
    stimulus(6,15); // Approx 3inputs*5 =15 timeunits
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #(25+20+15+15 +5);
    $finish;
  end
  
endmodule

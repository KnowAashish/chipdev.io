module ripple_carry_adder_tb #(parameter DATA_WIDTH=8);
  
  //input=reg output=wire
  reg [DATA_WIDTH-1:0] A;
  reg [DATA_WIDTH-1:0] B;
  wire [DATA_WIDTH-0:0] SUM;
  wire [DATA_WIDTH-1:0] COUT_INT;
  
  //Instantiate DUT
  ripple_carry_adder DUT (.a(A), .b(B), .sum(SUM), .cout_int(COUT_INT));
 
  task stimulus(bit [DATA_WIDTH-1:0] val_a= $random/*'b 11101010*/, val_b= $random/*'b 10100111*/); //val_a=234 val_b=167
    {A,B}={val_a,val_b};
    #5;
  endtask
  
  initial begin
    
    $monitor("at time t=%t, A=0x%0h (%0d) B=0x%0h (%0d) SUM=0x%0h (%0d) COUT_INT=0x%0h", $time, A,A, B,B, SUM,SUM, COUT_INT);
    
    //Test1: Sanity Test with different input combinations
    stimulus(10,20);
    stimulus(1,255);
    stimulus(150,200);
    stimulus(69,96);
    stimulus(99,199);
    stimulus(255,255); // Approx 6inputs*5 =30 timeunits
    
    //Test2: Combination of Default Values
    stimulus();
    stimulus(45,);
    stimulus(,121);
    stimulus();
    stimulus(); // Approx 5inputs*5 =25 timeunits
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #(30+25 +5);
    $finish;
  end
  
endmodule

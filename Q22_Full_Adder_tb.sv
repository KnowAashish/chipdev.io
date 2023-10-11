module full_adder_tb ();
  
  //input=reg output=wire
  reg A;
  reg B;
  reg CIN;
  wire SUM;
  wire COUT;
  
  //Instantitate DUT
  full_adder DUT (.a(A), .b(B), .cin(CIN), .sum(SUM), .cout(COUT));
  
  task stimulus(bit val_a=1, val_b=0, val_c=1);
    {A, B, CIN}={val_a, val_b, val_c};
    #5;
  endtask
  
  initial begin
    $monitor("at time t=%t A=%0b B=%0b CIN=%0b SUM=%0b COUT=%0b", $time, A, B, CIN, SUM, COUT);
    
    //Test1: Sanity Test with multiple A,B,CIN input combinations
    stimulus(0,0,0);
    stimulus(0,0,1);
    stimulus(0,1,0);
    stimulus(0,1,1);
    stimulus(1,0,0);
    stimulus(1,0,1);
    stimulus(1,1,0);
    stimulus(1,1,1); // Approx 8inputs*5 =40 timeunits
    
    //Test2: Default Stimulus
    stimulus(); // Approx 1input*5 =5 timeunits
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #(40+5 +5);
    $finish;
  end
  
endmodule

module dot_product_tb();
  
  //input=reg output=wire
  bit CLK;
  reg [7:0] DIN;
  reg RESETN;
  wire [17:0] DOUT;
  wire RUN;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  dot_product DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .dout(DOUT), .run(RUN));
  
  task reset();
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  task stimulus(bit[7:0] in=$random);
    DIN<=in;
    @(posedge CLK);
  endtask
  
  initial begin
    
    $monitor("at time t=%0t, RESETN=%0b DIN=0x%0h DOUT=0x%0h RUN=%0b", $time, RESETN, DIN, DOUT, RUN);
    
    //Test1: Sanity Test with random input combinations
    reset();
    stimulus(1);
    stimulus(2);
    stimulus(3);
    stimulus(4);
    stimulus(5);
    stimulus(6);
    stimulus(7);
    stimulus(8);
    stimulus(9);
    stimulus(10);
    stimulus(11);
    stimulus(12); // Approx 1+12 = 13cycles
    
    //Test2: Reset is given with the 6th input, dout(expected)=0
    reset();
    stimulus(2);
    stimulus(4);
    stimulus(6);
    stimulus(8);
    stimulus(10);
    fork
      stimulus(12);
      reset();
    join // Approx 1+5+1 = 6cycles
    
    //Test3: Random Stimulus
    reset();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus(); // Approx 1+12 = 13cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((13+6+13 +5)*10);
    $finish;
  end
  
endmodule

module divide_by_evens_clock_divider_tb();
  
  //input=reg output=wire
  bit CLK;
  reg RESETN;
  wire DIV2, DIV4, DIV6;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  divide_by_evens_clock_divider DUT (.clk(CLK), .resetn(RESETN), .div2(DIV2), .div4(DIV4), .div6(DIV6));
  
  task reset();
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  task delay(int num_of_cycles=7); // default 7 value gives all 3 complete clocks
    repeat(num_of_cycles)
      @(posedge CLK);
  endtask
  
  initial begin
    $monitor("at time %t, RESETN=%0b CLK=%0b DIV2=%0b DIV4=%0b DIV6=%0b", $time, RESETN, CLK, DIV2, DIV4, DIV6);
    
    //Test1: Basic reset to check all clock pulses
    reset();
    delay(); // Approx 1+7= 8cycles
    
    //Test2: Insert reset in-between to check all clock's reset
    reset();
    delay(4);
    reset(); // Approx 1+4+1= 6cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((8+6 +10)*10);
    $finish;
  end
  
endmodule

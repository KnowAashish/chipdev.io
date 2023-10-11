module edge_detector_tb();
 
  //input = reg, output = wire  
  
  reg RESETN, DIN;
  wire DOUT;
  bit CLK;
  
  edge_detector DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .dout(DOUT));
  
  always
    #5 CLK=!CLK;
  
  task reset();
    RESETN=0;
    @(posedge CLK);
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
    
  endtask
  
  // DIN is high for multiple clks, DOUT should be high for once.
  task input1(); 
    DIN=0;
    repeat(2)
      @(posedge CLK);
    DIN=1;	// at 2nd posedge CLK, DIN is high
    repeat(4)
      @(posedge CLK);
    DIN=0;  // DIN stays high till 5th posedge CLK, goes low on 6th posedge CLK
  endtask
  
  // DIN is high multiple times non-consecutively, DOUT should be high multiple times non-consecutively
  task input2(); 
    DIN=0;
    repeat(2)
      @(posedge CLK);
    DIN=1;
    @(posedge CLK);
    DIN=0;
    repeat(2)
      @(posedge CLK);
    DIN=1;
    @(posedge CLK);
    DIN=0;
  endtask
  
  // DIN is high forever after 3 clks low, to check when reset goes high, priority is given to reset over DIN i.e DOUT=0 and once reset goes low, DIN changes the DOUT to 1 for 1 clk cycle
  task input3(); 
    DIN=0;
    repeat(3)
      @(posedge CLK);
    DIN=1;
      endtask
  
  initial begin
    fork
      reset();
      begin
        input1();
        input2();
        input3();
      end
    join
    reset();
  end
  
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars;
    #200;  // 3reset=3clk + (4+5+6)clks i.e total 18 clk is given, thus 18*10ns = 180, so roughly 200ns
  	$finish;
  end
  
endmodule

module sequence_detector_tb();
  
  //input=reg output=wire
  bit CLK;
  reg RESETN;
  reg DIN;
  wire DOUT;
  
  logic [2:0] TEMP;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  sequence_detector DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .dout(DOUT));
  
  task reset();
    RESETN=1;
    @(posedge CLK);
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  task stimulus(input int num_of_inputs=1, value=1);
    repeat(num_of_inputs) begin
      DIN=value;
      @(posedge CLK);
    end
  endtask
  
  initial begin
    
    $monitor("at %t Sequence: %0b Dout: %0b", $time, {TEMP,DIN}, DOUT);
    
    //Test1: Basic reset followed by 1010 sequence
    reset();
    stimulus(,1);
    stimulus(,0);
    stimulus(,1);
    stimulus(,0); //Approx 2+4=6 cycles
    
    //Test2: Reset followed by overlapping 1010 sequence
    reset();
    stimulus(,1);
    stimulus(,0);
    stimulus(,1);
    stimulus(,0);
    stimulus(,1);
    stimulus(,0);
    stimulus(,1);
    stimulus(,0); //Approx 2+8=10 cycles
    
    //Test3: Random sequence. E.g.,1100
    stimulus(2,1);
    stimulus(2,0); //Approx 2+2=4 cycles
    
    //Test4: Reset has has priority over first stimulus(,1), Thus no sequence.
    fork
      reset();
      stimulus(,1);
      stimulus(,0);
      stimulus(,1);
      stimulus(,0); //Approx 2+4=6 cycles
    join
    
    //Test5: Reset is high at the last 0 in "1010" pattern
    stimulus(,1);
    stimulus(,0);
    fork
      reset();
      stimulus(,1);
    join_any // with join alone, 1 was extending for 2 cycles.
    stimulus(,0);  //Approx 2+4=6 cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((6+10+4+6+6 +5)*10); // 5additional cycles. 1cycle=10units
    $finish;
  end
  
endmodule

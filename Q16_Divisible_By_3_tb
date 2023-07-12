module divisible_by_3_tb();

  //input=reg output=wire
  bit CLK;
  reg DIN, RESETN;
  wire DOUT;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  divisible_by_3 DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .dout(DOUT));
  
  task reset(int num_of_cycles=1);
    repeat(num_of_cycles) begin
      RESETN=0;
      @(posedge CLK);
    end
    RESETN=1;
  endtask
  
  task stimulus(bit value=$random);
    DIN=value;
    @(posedge CLK);
  endtask
  
  initial begin
    $monitor("at time t=%t RESETN=%0b DIN=%0b DOUT=%0b", $time, RESETN, DIN, DOUT);
    
    //Test1: Basic 1001 (decimal 9) to check the functionality
    reset();
    stimulus(1);
    stimulus(0);
    stimulus(0);
    stimulus(1); // Approx 1+4=5 cyles
    
    //Test2: Random Sequence Of 10 Inputs
    reset();
    repeat(10) begin
      stimulus();
    end // Approx 1+10=11 cycles
    
    //Test3: Reset is asserted when 11 sequence is given
    reset();
    stimulus(1);
    stimulus(1); // For this 11, DOUT will be high, but not for below 11 sequence
    
    reset();
    stimulus(1);
    stimulus(1);
    stimulus(0);
    fork
      reset();
      stimulus(0);
    join // Approx 1+2+1+3+1= 8cycles
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((5+11+8 +5)*10) $finish;
  end
  
endmodule

module divisible_by_5_tb();
  
  //input=reg output=wire
  bit CLK;
  reg RESETN;
  reg DIN;
  wire DOUT;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  divisible_by_5 DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .dout(DOUT));
  
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
    
    //Test1: Basic 1111 (decimal 15) to check the functionality
    reset();
    repeat(4)
      stimulus(1); // Approx 1+4= 5cycles
    
    //Test2: Random Sequence of 10 Inputs
    reset();
    repeat(10)
      stimulus(); // Approx 1+10= 11cycles
    
    //Test3: Reset is asserted when 101 sequence is given by input
    reset();
    stimulus(1);
    stimulus(0);
    stimulus(1); // for this 101 will make DOUT high, but not for below sequence
    
    reset();
    stimulus(1);
    stimulus(0);
    fork 
      reset();
      stimulus(1);
    join // Approx 1+3+1+2+1= 8cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((5+11+8 +5)*10); $finish;
  end
endmodule

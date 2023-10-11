module programmable_sequence_detector_tb ();
  
  //input=reg output=wire
  bit CLK;
  reg RESETN;
  reg [4:0] INIT;
  reg DIN;
  wire SEEN;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  programmable_sequence_detector DUT (.clk(CLK), .resetn(RESETN), .init(INIT), .din(DIN), .seen(SEEN));
  
  task reset(int num_of_cycles=1);
    repeat(num_of_cycles) begin
      RESETN=0;
      @(posedge CLK);
    end
    RESETN=1;
  endtask
  
  task init(bit [4:0] value);
    INIT= value;
    @(posedge CLK);
    INIT = $random;
  endtask
  
  task stimulus(bit value);
    DIN=value;
    @(posedge CLK);
  endtask
  
  initial begin
    
    $monitor("at time %t RESETN=%0b INIT=%0b DIN=%0b SEEN=%0b", $time, RESETN, INIT, DIN, SEEN);
    
    //Test1: Detect 11011 sequence twice (using Overlapping)
    DIN=0;
    reset();
    fork
      init('b11011);
      stimulus(1);
    join
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1); // Approx 1+1+7= 9cycles
    
    //Test2: Detect if seen is check only after 5-bit input stream\
    reset();
    init('b00011); // DIN is 1 for this clock cycle from prev Test1 stimulus
    stimulus(1); // Expecting SEEN to be low as input is only 2-bit after RESETN
    stimulus(0);
    stimulus(0);
    stimulus(0);
    stimulus(1);
    stimulus(1); // Approx 1+1+6= 8cycles
    
    //Test3: Change INIT along with each DIN to see only 1st init after RESETN is taken as target value
    reset();
    init('b10101); // DIN is 1 for this clock cycle from prev Test2 stimulus
    fork
      init('b11110);
      stimulus(0);
    join
    fork
      init('b10110);
      stimulus(1);
    join
    fork
      init('b11011);
      stimulus(0);
    join
    fork
      init('b10001);
      stimulus(1);
    join // Approx 1+1+4= 6cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((9+8+6 +5)*10);
    $finish;
  end
  
endmodule

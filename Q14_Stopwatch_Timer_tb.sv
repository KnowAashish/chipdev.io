module stopwatch_timer_tb #(parameter DATA_WIDTH=16, MAX=99);
  
  //input=reg output=wire
  bit CLK;
  reg RESET, START, STOP;
  wire [DATA_WIDTH-1:0] COUNT;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  stopwatch_timer DUT (.clk(CLK), .reset(RESET), .start(START), .stop(STOP), .count(COUNT));
  
  task default_value();
    RESET=0;
    START=0;
    STOP=0;
  endtask
  
  task reset();
    RESET=0;
    @(posedge CLK);
    RESET=1;
    @(posedge CLK);
    RESET=0;
  endtask
  
  task start();
    START=0;
    @(posedge CLK);
    START=1;
    @(posedge CLK);
    START=0;
  endtask

  task stop();
    STOP=0;
    @(posedge CLK);
    STOP=1;
    @(posedge CLK);
    STOP=0;
  endtask
  
  task delay(input int num_of_cycles=2);
    repeat(num_of_cycles) begin
      @(posedge CLK);
    end
  endtask
  
  initial begin
    
    $monitor("%t Reset=%0b Start=%0b Stop=%0b \t Count=%0d", $time, RESET, START, STOP, COUNT);
    
    default_value();
    
    //Test1: to check basic reset, start-stop sequence
    reset();
    start();
    delay(5);
    stop(); //approx 5 cyles
    
    //Test2: to check reset's priority over start & stop
    fork
      reset();
      start();
      stop(); // approx 1 cycle
    join
    
    //Test3: To check reset's priority over start only
    start();
    delay(10);
    stop();
    
    fork
      reset();
      start(); // approx 11 cycles
    join
    
    //Test4: To check reset's priority over stop only
    fork
      reset();
      stop(); // approx 1 cycle
    join
    
    //Test5: To check the MAX value reset to 0
    reset();
    start();
    delay(110);
    stop(); // approx 110 cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((5+1+11+1+110+10)*10); //10 extra miscellaneous cycles (1cycle=10units)
    $finish;
  end
endmodule

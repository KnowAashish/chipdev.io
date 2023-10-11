module fizzbuzz_tb #(parameter MAX_CYCLES=20);
  
  //input=reg output=wire
  bit CLK;
  reg RESETN;
  wire Fizz;
  wire Buzz;
  wire FizzBuzz;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instanttiate DUT
  fizzbuzz DUT (.clk(CLK), .resetn(RESETN), .fizz(Fizz), .buzz(Buzz), .fizzbuzz(FizzBuzz));
  
  task reset();
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  task delay (int num_of_cycles=MAX_CYCLES);
    repeat(num_of_cycles)
      @(posedge CLK);
  endtask
  
  initial begin
    
    //Test1: Sanity Test to generate sequence till MAX_CYCLES
    reset();
    delay(); // Approx 1+20= 21cycles
    
    //Test2: Insert reset in-between the sequence
    reset();
    delay(10);
    reset(); // Approx 1+10+1 =12cycles
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((21+12 +5)*10);
    $finish;
  end
endmodule

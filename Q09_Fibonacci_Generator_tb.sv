module fibonacci_generator_tb #(parameter DATA_WIDTH=32);
  //input=reg output=wire
  bit CLK; // reg CLK wiont work when generating pulses, i.e. why bit CLK is used.
  reg RESETN;
  wire [DATA_WIDTH-1:0] DOUT;
  
  //generate clk
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  fibonacci_generator DUT (.clk(CLK), .resetn(RESETN), .dout(DOUT));
  
  task reset(input int num_of_cycles=1);
    RESETN=0;
    repeat(num_of_cycles)
      @(posedge CLK);
    RESETN=1;
  endtask
  
  task delay(input int num_of_cycles=1);
    repeat(num_of_cycles)
      @(posedge CLK);
  endtask
  
  initial begin
    reset();
    
    delay(6);
    reset();
    
    delay(10);
    reset();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #250 $finish;
  end
  
endmodule

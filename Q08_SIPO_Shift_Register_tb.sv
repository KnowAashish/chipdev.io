module SIPO_shift_register_tb #(parameter DATA_WIDTH=16);
  //input=reg output=wire
  bit CLK; //clk cant be reg because it wont generate pulses in waveform. ONLY USE BIT
  reg RESETN;
  reg DIN; 
  wire [DATA_WIDTH-1:0] DOUT;
  
  //generate clk
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  SIPO_shift_register DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .dout(DOUT));
  
  task reset();
    RESETN=1;
    @(posedge CLK);
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  //given default value of 6, dont know why it is throwing error if no default value is given
  task stimulus(input int num_of_inputs=6); 
    repeat(num_of_inputs) begin
      DIN={$random};
      @(posedge CLK);
    end
  endtask
  
  task delay (input int num_of_cycles);
    repeat(num_of_cycles)
      @(posedge CLK);
  endtask
  
  initial begin
    fork
      reset();
      #30 reset(); //another reset is given after 3clk cycles. 1cycle=10units
      stimulus(); // default it will generate 6 input DINs
    join
    
    fork
      reset();
      stimulus(3); // 3 input DIN values will be generated
    join
    
    fork
      reset();
      stimulus(DATA_WIDTH); //16 (which is DATA_WIDTH) random values of DIN will be generated
    join
    
    delay(2);
    reset();
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #300;
    $finish;
  end
  
endmodule

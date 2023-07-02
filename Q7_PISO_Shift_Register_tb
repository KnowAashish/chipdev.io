module PISO_shift_register_tb #(parameter DATA_WIDTH=16);
  
 // input=reg output=wire
  
  bit CLK; // give CLK as bit. Giving reg made it X throughout and dint generate clk pulses
  reg RESETN;
  reg [DATA_WIDTH-1:0] DIN;
  reg DIN_EN;
  wire DOUT;
    
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate Design
  PISO_shift_register DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .din_en(DIN_EN), .dout(DOUT));
  
  task reset(input int num_of_cycles);
    RESETN=0;
    repeat(num_of_cycles)
      @(posedge CLK);
    RESETN=1;
  endtask
  
  task input_en(input int num_of_cycles);
    DIN_EN=0;
    @(posedge CLK);
    DIN_EN=1;
    repeat(num_of_cycles)
      @(posedge CLK);
    DIN_EN=0;
  endtask
  
  task stimulus1();
    DIN='hFB;
    repeat(2)
      @(posedge CLK);
    DIN='h0;
    repeat(7) begin
      @(posedge CLK);
      DIN= 'h5;
    end
    @(posedge CLK);
    DIN= 'h0;
    @(posedge CLK);
  endtask
  
  task stimulus2();
    repeat(10) begin
      DIN=$random;
      @(posedge CLK);
    end
  endtask
  
  //Read the Prompt and Various Test Scenarios will be understood
  initial begin
    fork
      reset(1);
      input_en(1);
      stimulus1();
    join
    
    fork
      reset(1);
      input_en(5);
      stimulus2();
    join
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #300;
    $finish;
  end
  
endmodule

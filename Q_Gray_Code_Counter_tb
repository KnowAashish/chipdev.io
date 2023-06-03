module gray_code_generator_tb #(parameter DATA_WIDTH = 4);
  reg RESETN;
  wire [DATA_WIDTH-1:0] OUT;
  
  bit CLK; // reg CLK dint work, it was X.
  
  gray_code_generator DUT (.clk(CLK), .resetn(RESETN), .out(OUT));
  
  always
    #5 CLK = ~CLK;
  
  task reset(); // to insert reset for 1 clock pulse
    RESETN = 0;
    @(posedge CLK);
    RESETN = 1;
  endtask
  
  initial begin
    $monitor("at %t, The value of OUT is %d", $time, OUT);
    reset();
    repeat(4)
      @(posedge CLK);
    reset();
    repeat(5)
      @(posedge CLK);
    reset();
    repeat(6)
      @(posedge CLK);
    reset();

    //   $monitor("at %t, The value of OUT is %d", $time, OUT); // this dint work to print all OUT values, thus added $monitor in the begining
  end
 
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars;
    #200;  // 3reset=3clk + (4+5+6)clks i.e total 18 clk is given, thus 18*10ns = 180, so roughly 200ns
  	$finish;
  end 
endmodule

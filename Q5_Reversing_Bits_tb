module reversing_bits_tb #(parameter DATA_WIDTH=32);
  
  reg [DATA_WIDTH-1:0] DIN;
  wire [DATA_WIDTH-1:0] DOUT;
  
  bit clk;
  
  reversing_bits DUT (.din(DIN), .dout(DOUT));
  
  always
    #5 clk = ~clk;
  
  task input_data();
    @(posedge clk);
    DIN='hb;
    
    repeat(10) begin
      @(posedge clk);
      DIN = $random;
    end
  endtask
  
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars;
    #150;  // 1+10+ 4 misc_clks i.e total 15 clk is given, thus 15*10ns = 150ns 
  	$finish;
  end
  
  initial begin
    $monitor("at time %t, The value of input stream is %b \n\tThe value of output stream is %b", $time, DIN, DOUT);
    input_data();
  end
  
endmodule

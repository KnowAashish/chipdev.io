module rounding_division_tb();
  parameter DIV_LOG2=2,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2;
  
  reg [IN_WIDTH-1:0] DIN;
  wire [OUT_WIDTH-1:0] DOUT;
  wire REMAINDER;
  
  bit clk;
  
  rounding_division DUT (.din(DIN), .dout(DOUT));
  
  always begin
    forever
      #5 clk=!clk;
  end
  
  task din_input();
//    @(posedge clk);
    DIN= 'hb;
    @(posedge clk);
    DIN= 'hf;
    @(posedge clk);
    DIN= 'h8;
    // checking corner values
    @(posedge clk);
    DIN= 'h7_FFFF_FFFF; // max possible value of input of 35 bits, here [31:0]DOUT is 1_0000_0000, thus it shows 0 in output waveform.
    @(posedge clk);
    DIN= 'h7_FFFF_FFF9; // in-between-er
    @(posedge clk);
    DIN= 'h8_FFFF_FFF8; 
    // this input is of 36bits, whereas din is of 35 bit thus, 1 is truncated and din becomes 0FFFF_FFF8
    @(posedge clk);
    DIN= 'h0; 
    @(posedge clk);
    DIN= 'hCAFE; 
    @(posedge clk);
    DIN= 'hDECADE; 
    @(posedge clk);
    DIN= 'hFADE; 
    @(posedge clk);
    DIN= 'hFACADE;
    @(posedge clk);
    DIN= 'hFEED;
    @(posedge clk);
    DIN= 'hBEAD;
    @(posedge clk);
    DIN= 'hBABE;
    @(posedge clk);
    DIN= 'hACE;
    @(posedge clk);
    DIN= 'hADD;
    @(posedge clk);
    DIN= 'hADDED;
    @(posedge clk);
    DIN= 'hBED;
    
  endtask
  
  initial fork
    din_input();
    $monitor("\t the value of input is %h \n\t the value of out is %h \n\t the value of remainder is %h", DIN, DOUT, /*(DIN%(2**DIV_LOG2))*/ DIN[DIV_LOG2-1:0]);
  join
 
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars;
    #200;  // approx 18 din is given, thus 18*10ns = 180, so roughly 200ns
  	$finish;
  end  
endmodule

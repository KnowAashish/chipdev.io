module multi_bit_fifo_tb #(parameter DATA_WIDTH=8);
  
  //input=reg output=wire
  bit CLK;
  reg RESETN;
  reg [DATA_WIDTH-1:0] DIN;
  reg WR;
  wire [DATA_WIDTH-1:0] DOUT;
  wire EMPTY;
  wire FULL;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  multi_bit_fifo DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .wr(WR), .dout(DOUT), .empty(EMPTY), .full(FULL));
  
  task reset();
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  task stimulus(bit [DATA_WIDTH-1:0]val_din=$random, [0:0]val_wr=$random);
    $display("at time t=%0t, DIN=0x%0h WR=%0b", $time,  val_din, val_wr);
    DIN=val_din;
    WR=val_wr;
    @(posedge CLK);
  endtask
  
  initial begin
    WR<=0;
    
    $monitor("at time t=%0t, RESETN=%0b DIN=0x%0h WR=%0b DOUT=0x%0h EMPTY=%0b FULL=%0b", $time, RESETN, DIN, WR, DOUT, EMPTY, FULL);
    
    //Test1: Sanity Test with different input combinations
    reset();
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus(); 
    stimulus(); // Approx 1+6 =7 cycles
    
    //Test2: Reset in-between the input stream
    reset();
    stimulus(,1);
    stimulus(,1);
    stimulus(,1);
    stimulus(,1);
    fork
      reset();
      stimulus(,1);
    join
    stimulus(,1);
    stimulus(,1);
    stimulus(,1);
    stimulus(,1);
    stimulus(,1);
    stimulus(,1); // Approx 1+4+1+6 =12 cycles
    
    //Test3: Input combination to test Empty and Full Condition
    reset();
    stimulus(,0);
    stimulus(,0);
    stimulus(,0);
    stimulus(,1);
    stimulus(,1);
    stimulus(,1);
    stimulus(,0);
    stimulus(,0);
    stimulus(,1);
    stimulus(,1);
    stimulus(,1); // Approx 1+11 =12 cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((7+12+12 +5)*10);
    $finish;
  end
  
endmodule

module flip_flop_array_tb();
  
  //input=reg output=wire
  bit CLK;
  reg [7:0] DIN;
  reg [2:0] ADDR;
  reg WR;
  reg RD;
  reg RESETN;
  wire [7:0] DOUT;
  wire ERROR;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  flip_flop_array DUT (.din(DIN), .addr(ADDR), .wr(WR), .rd(RD), .clk(CLK), .resetn(RESETN), .dout(DOUT), .error(ERROR));
  
  task reset();
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  task stimulus(bit [7:0]val_din=$random, [2:0]val_addr=$random, val_wr=$random, val_rd=$random);
    //{DIN, ADDR, WR, RD}={val_din, val_addr, val_wr, val_rd};
    DIN=val_din;
    ADDR=val_addr;
    WR=val_wr;
    RD=val_rd;
    $display("The stimulus is %0b", {DIN, ADDR, WR, RD});
    @(posedge CLK);
  endtask
  
  initial begin
    DIN<=0;
    ADDR<=0;
    RD<=0;
    WR<=0;
    
    $monitor("at time t=%0t, RESETN=%0b DIN=%0b ADDR=%0b WR=%0b RD=%0b DOUT=%0b ERROR=%0b", $time, RESETN, DIN, ADDR, WR, RD, DOUT, ERROR);
    
    //Test1: Sanity Test with 2 Write-then-Read and 1 Read from unwritten write location
    reset();
    stimulus('hFF,1,1,0);
    stimulus('hEE,2,1,0);
    stimulus(,1,0,1);
    stimulus(,2,0,1);
    stimulus(,3,0,1); // Approx 1+5 = 6cycles
    
    //Test2: Check only 1 operation per cycle (either read or write)
    reset();
    stimulus(,6,1,0);
    stimulus(,4,1,1);
    stimulus(,6,0,1); // Approx 1+3 = 4cycles
    
    //Test3: NOP
    reset();
    stimulus(,7,1,0);
    stimulus(,,0,0);
    stimulus(,7,0,1); // Approx 1+3 = 4cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((6+4+4 +5)*10);
    $finish;
  end
  
endmodule

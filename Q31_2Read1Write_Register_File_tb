module tworead1write_register_file_tb #(parameter DATA_WIDTH=16);
  
  //input=reg output=wire
  bit CLK;
  reg RESETN;
  reg [DATA_WIDTH-1:0] DIN;
  reg [$clog2(DATA_WIDTH):0] WAD1;
  reg [$clog2(DATA_WIDTH):0] RAD1, RAD2;
  reg WEN1, REN1, REN2;
  wire [DATA_WIDTH-1:0] DOUT1, DOUT2;
  wire COLLISION;
  
  //Generate Clock
  always
    #5 CLK=!CLK;
  
  //Instantiate DUT
  tworead1write_register_file DUT (.clk(CLK), .resetn(RESETN), .din(DIN), .wad1(WAD1), .rad1(RAD1), .rad2(RAD2), .wen1(WEN1), .ren1(REN1), .ren2(REN2), .dout1(DOUT1), .dout2(DOUT2), .collision(COLLISION));
  
  task reset();
    RESETN=0;
    @(posedge CLK);
    RESETN=1;
  endtask
  
  task stimulus(bit [DATA_WIDTH-1:0] val_din=$random, [$clog2(DATA_WIDTH):0] val_wad1=0, [$clog2(DATA_WIDTH):0] val_rad1=0, [$clog2(DATA_WIDTH):0] val_rad2=0, [0:0] val_wen1=0, [0:0] val_ren1=0, [0:0] val_ren2=0);
    
    {DIN, WAD1, RAD1, RAD2, WEN1, REN1, REN2}={val_din, val_wad1, val_rad1, val_rad2, val_wen1, val_ren1, val_ren2};
    
    $display("at time t=%0t, RESETN=%0b DIN=0x%0h WAD1=0x%0h RAD1=0x%0h RAD2=0x%0h WEN1=%0b REN1=%0b REN2=%0b DOUT1=0x%0h DOUT2=0x%0h COLLISION=%0b", $time, RESETN, DIN, WAD1, RAD1, RAD2, WEN1, REN1, REN2, DOUT1, DOUT2, COLLISION);
    @(posedge CLK);
    
  endtask
  
  initial begin
    
    $monitor("at time t=%0t, RESETN=%0b DIN=0x%0h WAD1=0x%0h RAD1=0x%0h RAD2=0x%0h WEN1=%0b REN1=%0b REN2=%0b DOUT1=0x%0h DOUT2=0x%0h COLLISION=%0b", $time, RESETN, DIN, WAD1, RAD1, RAD2, WEN1, REN1, REN2, DOUT1, DOUT2, COLLISION);
    
    //Test1: Sanity Test - Write on WAD1=1,2,3,4 and Read from both ports
    reset();
    stimulus(2,1,,,1,0,0);	// Write 2 on address 1
    stimulus(4,2,,,1,0,0);
    stimulus(,,1,,0,1,0);	// Read data on Dout1 from address 1
    stimulus(,,,2,0,0,1);
    stimulus(6,2,,,1,0,0);
    stimulus(8,3,,,1,0,0);
    stimulus(,,2,,0,1,0);
    stimulus(,,,3,0,0,1);			// Approx 1+8 = 9 cycles
    
    //Test2: NOP
    repeat(3)
      @(posedge CLK);				// Approx 3 cycles
    
    //Test3: Write Only
    stimulus(1,4,,,1,0,0);
    stimulus(3,5,,,1,0,0);
    stimulus(5,6,,,1,0,0);
    stimulus(7,7,,,1,0,0);
    stimulus(9,8,,,1,0,0);
    stimulus(11,9,,,1,0,0);			// Approx 6 cycles
    
    //Test4: Individual Read1 & Read2
    stimulus(,,4,,0,1,0);
    stimulus(,,5,,0,1,0);
    stimulus(,,6,,0,1,0);
    stimulus(,,,7,0,0,1);
    stimulus(,,,8,0,0,1);
    stimulus(,,,9,0,0,1);			// Approx 6 cycles
    
    //Test5: Write on WAD1=10,11,12,13,14,15 and simultaneous Read1 & Read2
    stimulus(10,10,,,1,0,0);
    stimulus(12,11,,,1,0,0);
    stimulus(14,12,,,1,0,0);
    stimulus(16,13,,,1,0,0);
    stimulus(18,14,,,1,0,0);
    stimulus(20,15,,,1,0,0);
    stimulus(,,10,11,0,1,1);
    stimulus(,,12,13,0,1,1);
    stimulus(,,14,15,0,1,1);		// Approx 9 cycles
    
    //Test6: 3 Operations - Write on WAD1=16,17,18,19,20 and Read1/2 from RAD1/2=6,7,8,9,10,11
    stimulus(13,16,6,7,1,1,1);
    stimulus(15,17,8,9,1,1,1);
    stimulus(17,18,10,11,1,1,1);
    stimulus(19,19,12,13,1,1,1);
    stimulus(21,20,14,15,1,1,1);	// Approx 5 cycles
    
    //Test7: Collision when WAD1=RAD1 in 1Write-1Read case
    stimulus(,21,21,,1,1,0);
    stimulus(22,22,16,,1,1,0);		// Approx 2 cycles
    
    //Test8: Collision when WAD1=RAD2 in 1Write-1Read case
    stimulus(,23,23,,1,0,1);
    stimulus(24,24,17,,1,0,1);		// Approx 2 cycles
    
    //Test9: Collision when RAD1=RAD2 in 2Read case
    stimulus(,,18,18,0,1,1);
    stimulus(26,25,,,1,0,0);		// Approx 2 cycles
    
    //Test10: Collision when WAD1=RAD1=RAD2
    stimulus(28,24,24,24,1,1,1);
    stimulus(28,25,24,22,1,1,1);	// Approx 2 cycles
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((9+3+6+6+9+5+2+2+2+2 +1)*10);
    $finish;
  end
  
endmodule

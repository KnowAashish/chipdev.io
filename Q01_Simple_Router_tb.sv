module simple_router_tb;
  parameter DATA_WIDTH=32;
  
  reg [DATA_WIDTH-1:0] DIN;
  reg D_EN;
  reg [1:0] ADDR;
  
  wire [DATA_WIDTH-1:0] DOUT0;
  wire [DATA_WIDTH-1:0] DOUT1;
  wire [DATA_WIDTH-1:0] DOUT2;
  wire [DATA_WIDTH-1:0] DOUT3;
  
  bit clk;
  
  simple_router DUT (.din(DIN), .d_en(D_EN), .addr(ADDR),
             .dout0(DOUT0), .dout1(DOUT1), .dout2(DOUT2), .dout3(DOUT3));
  
  always begin
    #5;
    clk= ~clk;
  end

  task verify_D_EN(); 
    //begin   // begin-end are not used in the .sv, it would be required if the testbench was of .v extension
      
      D_EN=0;		// we can directly equate to the value or use "assign"
      ADDR= 2'b00;
      //assign DIN= (DATA_WIDTH)`b bead;
      assign DIN= 'h bead; 
      // either write 'h bead or 32'h bead, cant write DATA_WIDTH'h bead. Parameter wont work here.
      #10;

      D_EN= 1;
      ADDR= 2'b00;
      DIN= 'h bead;
    
   // end
  endtask
  
  task verify_dout0();
    D_EN=0;
    ADDR= 'b 00;
    DIN= 'h bead;
    
    #10
    
    D_EN=1;
    ADDR= 'b 00;
    DIN= 'h bead;
    #10;
  endtask
  
  task verify_dout1();
    D_EN=1;
    ADDR= 'b 01;
    DIN= 'h bead;
    #10;				// if the delay is the last line of the task, then it should be given with semicolon (;), otherwise if there are codes after delay then no error would come if semicolon is not given
  endtask
  
  task verify_dout2();
    D_EN=1;
    ADDR= 'b 10;
    DIN= 'h bead;
    #10;
  endtask
  
  task verify_dout3();
    D_EN= 1;
    ADDR= 'b 11;
    DIN= 'h bead;
    #10;
  endtask
  
  initial begin
    
    verify_D_EN();
    verify_dout0();
    verify_dout1();
    verify_dout2();
    verify_dout3();
    
  end
  
  initial begin
  	$dumpfile("dump.vcd");
  	$dumpvars;
  	#100;
  	$finish;
  end

endmodule

module binary_to_thermometer_tb();
  
  //input=reg output=wire
  reg [7:0] DIN;
  wire [255:0] DOUT;
  
  //Instanitate DUT
  binary_to_thermometer_decoder DUT (.din(DIN), .dout(DOUT));
  
  task stimulus(bit [7:0] val_din=$random);
    DIN=val_din;
    #5;
  endtask
  
  initial begin
    
    $monitor("at time t=%0t, DIN=%0d DOUT=%0h", $time, DIN, DOUT);
    
    //Test1: Sanity Test with sequential input stimulus
    for (int i=0; i<10; i++)
      stimulus(i);
    
    //Test2: Random input stimulus
    for(int i=0; i<10; i++)
      stimulus();
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((10+10+ 1)*5);
    $finish;
  end
  
endmodule

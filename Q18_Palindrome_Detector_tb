module palindrome_detector_tb #(parameter DATA_WIDTH=32);
  
  //input=reg output=wire
  reg [DATA_WIDTH-1:0] DIN;
  wire DOUT;
  
  //Instantiate DUT
  palindrome_detector DUT (.din(DIN), .dout(DOUT));
  
  task random_stimulus(int num_of_input=1);
    repeat(num_of_input) begin
      DIN=$random;
      #5;
    end
  endtask
  
  initial begin
    $monitor("at time=%t DIN=%0b DOUT=%0b", $time, DIN, DOUT);
    
    //Test1: Basic Palindrome Number
    DIN='h ABCD_B3D5;
    #5;
    DIN='h CDEF_F7B3;
    #5;
    DIN='h 0000_0000;
    #5;

    
    //Test2: Random Sequence of 10 Inputs
    random_stimulus(10);
    
    //Test3: Combination of Palindrome and Random Stimulus
    DIN='h 2468_1624;
    #5;
    random_stimulus();
    
    DIN='h FACE_735F;
    #5;
    random_stimulus();
    
    DIN='h 1234_2C48;
    #5;
    random_stimulus();
    
    DIN='h 5678_1E6A;
    #5;
    random_stimulus();
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #120 $finish;
  end
  
endmodule

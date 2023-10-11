module onehot_detector_tb #(parameter DATA_WIDTH=32);
  
  //input=reg output=wire
  reg [DATA_WIDTH-1:0] DIN;
  wire ONEHOT;
  
  //Instantiate DUT
  onehot_detector DUT (.din(DIN), .onehot(ONEHOT));
  
  task stimulus(input int num_of_data, n);
    repeat(num_of_data) begin
     // DIN=2**(n);
     // DIN='b1000100;
      DIN={$random}%n;
      #5;
    end
  endtask
  
  initial begin
    $monitor("%t The value of DIN is %0b and Onehot is %0b", $time, DIN, ONEHOT);
    stimulus(5,8); 
    stimulus(5,16); 
    stimulus(5,32); 
    stimulus(5,64); 
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  
endmodule

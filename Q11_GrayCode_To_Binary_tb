module graycode_to_binary_tb #(parameter DATA_WIDTH=16);
  
  //input=reg output=wire
  reg [DATA_WIDTH-1:0] GRAY;
  wire [DATA_WIDTH-1:0] BIN;
  
  // Instantiate DUT
  graycode_to_binary DUT (.gray(GRAY), .bin(BIN));
  
  //Generates stimulus with "num_of_data" number of inputs which can have positive random value between 0-input_range 
  task stimulus(input int num_of_data, input_range=DATA_WIDTH);
    repeat(num_of_data) begin
      GRAY={$random}%input_range;
      #5; // to retain the GRAY value for 5 time units.
    end
  endtask
  
  initial begin
    $monitor("%t The value of random generated Gray Code is %0b", $time, GRAY);
    $monitor("%t The value of converted Binary Index is     %0b", $time, BIN);
    stimulus(5,4); //5 inputs having value between 0-3
    stimulus(5,8); //5 inputs having value between 0-7
    stimulus(5,16);//5 inputs having value betwwen 0-15
    stimulus(5,32);//5 inputs having value between 0-31
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end

endmodule

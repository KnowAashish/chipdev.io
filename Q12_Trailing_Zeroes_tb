module trailing_zeroes_tb #(parameter DATA_WIDTH=32);

  //input=reg output=wire
  reg [DATA_WIDTH-1:0] DIN;
  wire [$clog2(DATA_WIDTH):0] DOUT;
  
  //Instantiate DUT
  trailing_zeroes DUT (.din(DIN), .dout(DOUT));
  
  task stimulus(input int num_of_data, input_range);
    repeat(num_of_data) begin
      DIN={$random}%input_range;
      #5;
    end
  endtask
  
  initial begin
    stimulus(5,16);
    stimulus(5,32);
    stimulus(5,64);
    stimulus(5,128);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish;
  end
  
endmodule

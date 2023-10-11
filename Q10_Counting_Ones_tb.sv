module counting_ones_tb #(parameter DATA_WIDTH=16);
  //input=reg output=wire
  
  logic [DATA_WIDTH-1:0] DIN;
  wire [$clog2(DATA_WIDTH):0] DOUT;
  
  //Instantiate DUT
  counting_ones DUT (.din(DIN), .dout(DOUT));
  
  task stimulus();
    DIN={$random};
  endtask
  
  initial begin
    repeat(10) begin
      stimulus();
      #10;
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish;
  end

endmodule

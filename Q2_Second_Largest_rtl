module second_largest #(parameter DATA_WIDTH = 32) 
  					   (input [DATA_WIDTH-1:0] din,
                        input clk, resetn,
                        output [DATA_WIDTH-1:0] dout);
  
/*  reg [DATA_WIDTH-1:0] second_largest;
  reg [DATA_WIDTH-1:0] largest; */
  reg [DATA_WIDTH-1:0] second_largest, largest;
  
 // reg [31:0]second_largest, largest; 
  // could have been given as logic second_largest, largest. or as [DATA_WIDTH-1:0] second_largest, largest; both work same.
  
  always@(posedge clk) begin
    if (!resetn) begin
	  second_largest <= 0;
      largest <= 0;
    end
    else if (din > largest) begin
      second_largest <= largest;
      largest <= din;
    end
    else if (/*din < largest && */ din > second_largest)
      second_largest <= din;
  end
  
  assign dout = second_largest;
  
endmodule

// Instead of blocking assignment (<<=), with non-blocking assignment (<<<=) also this functionality is working in chipdev.io solution and in edaplayground.

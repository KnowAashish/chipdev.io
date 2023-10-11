module multi_bit_fifo #(parameter DATA_WIDTH=8)
  (input clk,
   input resetn,
   input [DATA_WIDTH-1:0] din,
   input wr,
   output logic [DATA_WIDTH-1:0] dout,
   output logic empty,
   output logic full);
 
  localparam FIFO_DEPTH=3;
  
  logic [DATA_WIDTH-1:0]FIFO[FIFO_DEPTH-1:0];
  logic [DATA_WIDTH-1:0] out;
  int count;
  
  always@(posedge clk) begin
    if(!resetn) begin
      out<=0;
      count<=0;
      
      for (int i=0; i<FIFO_DEPTH; i++)
        FIFO[i]<=0;
    end
    
    else if(wr) begin
      if(count<FIFO_DEPTH)
        count=count+1;
      
      if(full) begin // full when count==FIFO_DEPTH;
        for(int i=0; i<FIFO_DEPTH-1;i++) begin
          FIFO[i]<=FIFO[i+1];
        end
      end
      
      FIFO[count-1]<=din;
      
    end
  end
  
  assign dout =FIFO[0];
  assign empty=(count==0) ? 1:0;
  assign full =(count==FIFO_DEPTH) ? 1:0;  
endmodule

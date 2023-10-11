module gray_code_generator #(parameter DATA_WIDTH = 4)
  (input clk,
   input resetn,
   output logic [DATA_WIDTH-1:0] out);

logic [DATA_WIDTH-1:0] in;
//assign in = 0;

always @(posedge clk) begin
  if (!resetn) begin
    in <= 1;
    out <= 0;
  end
  else if (in <= 2**(DATA_WIDTH)-1) begin
    out[DATA_WIDTH-1] = in[DATA_WIDTH-1];
    for (int i=DATA_WIDTH-2; i>=0; i--) begin
      out[i] <= in[i+1] ^ in[i];
    end
  in <= in+1;
    if (in == 2**(DATA_WIDTH)-1) begin
      in <= in;
    end
    // "Using blocking assignment will often give you the correct behavior, but when bugs do arise can be much more difficult to track down. The use of blocking vs non-blocking would be more of a linter check than simulation"
  end
end
endmodule

module sequence_detector
  (input clk,
   input resetn,
   input din,
   output logic dout);
  
  logic [2:0] temp;
  
  always@(posedge clk) begin
    if(!resetn) begin
      dout<=0;
      temp<=0;
    end
    
    else if({temp,din}== 'b1010) begin
      dout<=1;
      temp<= (temp<<1) | din;
    end
    
    else begin
      temp<= (temp<<1) | din;
      dout<=0;
    end
    
  end
  
endmodule

/* Alternate Simpler Logic
reg [3:0] seq_det;

always @ (posedge clk)
begin
  if(!resetn)
    seq_det <= 'd0;
  else
    seq_det <= {seq_det[2:0], din};
end

assign dout = (seq_det == 4'b1010);
*/

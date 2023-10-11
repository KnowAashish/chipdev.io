module edge_detector (input clk,
                      input resetn,
                      input din,
                      output dout);
  
  parameter S00=0, S01=1, S10=2;
  reg [1:0]state;
  
  always@(posedge clk) begin
    if (!resetn)
      state<=S00;
    else begin
      case (state)
        //the "state" would get updated in the next posedge of clock
        S00: state <= (din ? S01:S00); 
        S01: state <= (din ? S10:S00);
        S10: state <= (din ? S10:S00);
      endcase
    end  
  end
  // this will make dout 1 as soon as "state" variable is changed to S01
  assign dout = (state==S01); 

endmodule

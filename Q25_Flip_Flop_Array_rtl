module flip_flop_array (input [7:0] din,
                        input [2:0] addr,
                        input wr,
                        input rd,
                        input clk,
                        input resetn,
                        output logic [7:0] dout,
                        output logic error);
  
  logic [7:0]RF[7:0];
  bit [7:0]wr_cnt;
  
  always@(posedge clk) begin
    
    //Reset Mode
    if(!resetn) begin
      RF<={0,0,0,0,0,0,0,0};
      wr_cnt<=0;
      error<=0;
      dout<=0;
    end
    
    //Error
    else if(wr && rd) begin
      error<=1;
      dout<=0;
    end
    
    //Write
    else if(wr && !rd) begin
      RF[addr]<=din;
      wr_cnt[addr]<=1;
      dout<=0;
      error<=0;
    end
    
    //Read
    else if(rd && !wr) begin
      if(wr_cnt[addr]) begin
          dout<=RF[addr];
          error<=0;
      end
      else begin
        dout<=0;
        error<=0;
      end
    end

    //NOP
    else begin
        dout<=0;
        error<=0;
    end
    
  end
  
endmodule

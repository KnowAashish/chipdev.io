module tworead1write_register_file #(parameter DATA_WIDTH=16)
  (input clk,
   input resetn,
   input [DATA_WIDTH-1:0] din,
   input [$clog2(DATA_WIDTH):0] wad1,
   input [$clog2(DATA_WIDTH):0] rad1, rad2,
   input wen1, ren1, ren2,
   output logic [DATA_WIDTH-1:0] dout1,dout2,
   output logic collision);
  
  localparam RF_SIZE=32;
  logic [DATA_WIDTH-1:0] RF [RF_SIZE-1:0];
  logic [RF_SIZE-1:0] wr_cnt;
  logic [DATA_WIDTH-1:0] out1, out2;
  
  always@(posedge clk) begin
    if(!resetn) begin
      out1<=0;
      out2<=0;
      collision<=0;
      
      wr_cnt<=0;
      RF<='{default: '0};
      //for(int i=0; i<RF_SIZE; i++)
      //  RF[i]<=0;
    end
    
    else begin
      //To avoid carry-forward of output values from prev posedge operation
      out1<=0;
      out2<=0;
      collision<=0;
      
      case({wen1,ren1,ren2})
        
        //NOP
        3'b000: begin
          out1<=0;
          out2<=0;
          collision<=0;
        end
        
        //Read2
        3'b001: begin
          if(wr_cnt[rad2]==1) begin
            out2<=RF[rad2];
          end
        end
        
        //Read1
        3'b010: begin
          if(wr_cnt[rad1]==1)
            out1<=RF[rad1];
        end
        
        //Read1 & Read2
        3'b011: begin
          if(rad1!=rad2) begin
            if(wr_cnt[rad1]==1)
              out1<=RF[rad1];
            if(wr_cnt[rad2]==1)
              out2<=RF[rad2];
          end
          else
            collision<=1;
        end
        
        //Write1
        3'b100: begin
          RF[wad1]<=din;
          wr_cnt[wad1]<=1;
        end
        
        //Write1 & Read2
        3'b101: begin
          if(wad1!=rad2) begin
            RF[wad1]<=din;
            wr_cnt[wad1]<=1;
            if(wr_cnt[rad2]==1)
              out2<=RF[rad2];
          end
          else
            collision<=1;
        end
          
          //Write1 & Read1
          3'b110: begin
            if(wad1!=rad1) begin
              RF[wad1]<=din;
              wr_cnt[wad1]<=1;
              if(wr_cnt[rad1]==1)
                out1<=RF[rad1];
            end
            else
              collision<=1;
          end
              
        //Write1, Read1 & Read2
        3'b111: begin
          if(wad1!=rad1 && rad1!=rad2 && wad1!=rad2) begin
            RF[wad1]<=din;
            wr_cnt[wad1]<=1;
            
            if(wr_cnt[rad1]==1)
              out1<=RF[rad1];
            if(wr_cnt[rad2]==1)
              out2<=RF[rad2];
          end
          //collision occurs when atleast 2 out of 3 input addresses are equal
          else
            collision<=1;
        end
        
        default: begin
          out1<=0;
          out2<=0;
          collision<=0;
        end
      
      endcase
      
    end
  end
  
  assign dout1=out1;
  assign dout2=out2;
endmodule

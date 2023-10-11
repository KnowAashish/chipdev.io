module PISO_shift_register #(parameter DATA_WIDTH=16)
  (input clk,
   input resetn,
   input [DATA_WIDTH-1:0] din,
   input din_en,
   output logic dout);
  
  int count=0;
  
  logic [DATA_WIDTH-1:0] din_temp=0;
  
  always@(posedge clk) begin
    if(!resetn) begin
      dout <= 0;
      count <=0;
    end
    
    else if(din_en) begin
      count<=count+1;
      dout <= din[0];
      din_temp <= din>>1;
    end
    
    else if (!din_en) begin
      if(count==0) begin
        dout <=0;
      end
      else begin
        dout <= din_temp[0];
        din_temp <= din_temp>>1;
      end

    end
  end
endmodule

/* there is even simpler logic in chipdev.io solutions, its posted below:
module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);

    logic [DATA_WIDTH-1:0] temp;

    always @(posedge clk) begin
        if (!resetn) begin
            temp <= 0;
        end else if (din_en) begin
            temp <= din;
        end else begin
            temp <= temp >> 1;
        end
     end

    assign dout = temp[0];

endmodule
*/

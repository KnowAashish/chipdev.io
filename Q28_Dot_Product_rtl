module dot_product (input [7:0] din,
                    input clk,
                    input resetn,
                    output reg [17:0] dout,
                    output reg run);
  
    // Let's keep track of the required number of bits after each mult and add operation
    // Assuming vector A = [a1, a2, a3], and vector B = [b1, b2, b3]
    // a1 * b1 = 16-b
    // a2 * b2 = 16-b
    // a3 * b3 = 16-b
    // a1b1 + a2b2 + a3b3 = 18-b
  
  localparam DATA_WIDTH=8, VEC_LENGTH=3;
  logic [DATA_WIDTH-1:0]A[VEC_LENGTH-1:0];
  logic [DATA_WIDTH-1:0]B[VEC_LENGTH-1:0];
  logic [17:0] out;
  logic run_pro;
  
  int count;
  
  always@(posedge clk) begin
    if(!resetn) begin
      out<=0;
      run_pro<=1;
      count<=0;
      
      for(int i=0; i<VEC_LENGTH; i++) begin
        A[i]<=0;
        B[i]<=0;
      end
    end
    
    else begin
      count=count+1;
      //$display("at time t=%0t, the value of count is %0d", $time, count);
      if(count<=VEC_LENGTH) begin
        run_pro<=0;
        A[count-1]=din;
       // $display("at time t=%0t, The value of A[2:0] is {%0h,%0h,%0h}", $time, A[0], A[1], A[2]);
        //$display("at time t=%0t, The value of B[2:0] is {%0h,%0h,%0h}", $time, B[0], B[1], B[2]);
      end
      
      else if(count>VEC_LENGTH && count<=2*VEC_LENGTH) begin
        run_pro<=0;
        B[count-VEC_LENGTH-1]=din;
      //  $display("at time t=%0t, The value of B[2:0] is {%0h,%0h,%0h}", $time, B[0], B[1], B[2]);
      //  $display("at time t=%0t, The value of A[2:0] is {%0h,%0h,%0h}", $time, A[0], A[1], A[2]);
        
        if(count==(2*VEC_LENGTH)) begin
          run_pro<=1;
          out=0;
          for (int i=0; i<VEC_LENGTH; i++) begin
            out+= A[i]*B[i];
          end
       //  $display("at time t=%0t, out is %0d", $time, out);
          count<=0;
        end
      end
      
    end
  end
  
  assign dout=out;
  assign run=run_pro;
endmodule

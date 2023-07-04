module fibonacci_generator #(parameter DATA_WIDTH=32)
  (input clk,
   input resetn,
   output logic [DATA_WIDTH-1:0] dout);

/* BELOW IS MY LOGIC : Learn NB & B statements execution from this full code

  logic [DATA_WIDTH-1:0] out;
  int arr[DATA_WIDTH-1:0];
  int i;
  
  always@(posedge clk) begin
    if(!resetn) begin
      out<=1;
      i=0;
      arr[0]=1;
      for(int j=1; j<DATA_WIDTH-1; j++) begin
        arr[j]=0;
      end
      $display("%t \t The value of arr[%0d] is %0d", $time, i, arr[i]);
      i<=i+1;
    end
    
    else if(i==1) begin
      arr[i]='h1;
      $display("%t \t The value of arr[%0d] is %0d", $time, i, arr[i]);
      i<=i+1;
      out<=1;      
    end
    
    else if(i>=2) begin
      $display("%t \t Inside else loop for %0d iteration", $time, i);
      arr[i]=arr[i-1]+arr[i-2];
      $display("%t \t The value of arr[%0d] is %0d", $time, i, arr[i]);
      out<=arr[i];
      i=i+1;
    end
  end
  
  assign dout = out;
  */
  
  logic [DATA_WIDTH-1:0] current, prev;
  
  always@(posedge clk) begin
    if(!resetn) begin
      current<=1;
      prev<=0;
    end
    
    else begin
      current <= current+prev;
      prev <= current;
    end
  end
  
  assign dout = current;
endmodule

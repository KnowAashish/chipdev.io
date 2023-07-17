module programmable_sequence_detector
  (input clk,
   input resetn,
   input [4:0] init,
   input din,
   output logic seen);
  
  logic [4:0]seq, target;
  int count;
  
  always@(posedge clk) begin
    if(!resetn) begin
      seq<=0;
      count<=0;
    end
    
    else begin
      count=count+1;
      
      //Target value is the 1st init value right when resetn is 1
      if(count==1)
        target<=init; 
      
      seq<= (seq<<1) | din;    
    end
  end
  
  //Input has to be atleast 5-bits long then only we shall check
  assign seen=((seq==target)&&(count>=5)) ? 1:0;
 
endmodule

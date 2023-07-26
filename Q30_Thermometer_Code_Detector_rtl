module thermometer_code_detector #(parameter DATA_WIDTH=8)
  (input [DATA_WIDTH-1:0] codeIn,
   output reg isThermometer);
  
  reg [DATA_WIDTH-1:0] arr; //[DATA_WIDTH-1:0];
  reg isThermo;
  reg [DATA_WIDTH-1:0] out;
  
  always@(codeIn) begin
    for(int i=0; i<DATA_WIDTH; i++) begin
      arr[i]=0;
    end
    isThermo=0;  
    
    //codeIn =! 0 or 1
    if ((&codeIn) == 1 || (|codeIn)==0)
      isThermo=0;
    
    else begin
      for(int i=0; i<DATA_WIDTH; i++) begin
        arr= arr<<1'b1 | 1'b1;
        
        if((codeIn == arr) || (codeIn == (~arr)))
          isThermo=1;
      end
    end
  end
  
  assign isThermometer=isThermo;
  
endmodule

/* Alternate Logic
    reg [$clog2(DATA_WIDTH)-1:0] n_toggle;

    always_comb begin

        n_toggle = 0;

        // Loop through all bits in codeIn and count the number of transitions
        for (int i = 1; i < DATA_WIDTH; i++) begin
            n_toggle = n_toggle + (codeIn[i - 1] ^ codeIn[i]); 
        end

    end 

    // We expect a single transition in a thermometer code
    assign isThermometer = (n_toggle == 1) ? 1'b1 : 1'b0;
*/

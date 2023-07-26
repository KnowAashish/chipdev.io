module thermometer_code_detector_tb #(parameter DATA_WIDTH=8);
  
  //input=reg output=wire
  reg [DATA_WIDTH-1:0] CODEIN;
  wire isThermometer;
  
  //Instantiate DUT
  thermometer_code_detector DUT (.codeIn(CODEIN), .isThermometer(isThermometer));
  
  task stimulus(bit [DATA_WIDTH-1:0] val_codein=$random, [0:0]invert=0);
    CODEIN=val_codein;
    if(invert) begin
      CODEIN=~(CODEIN);
    end
    #5;
  endtask
  
  initial begin
    
    $monitor("at time t=%0t, codeIn=%0b isThermometer=%0b", $time, CODEIN, isThermometer);
    
    //Test1: Sanity Test with different input combinations
    stimulus(1);
    stimulus(2);
    stimulus(3);
    stimulus(4);
    stimulus(7);
    stimulus(5);
    stimulus(15);
    stimulus(6);
    stimulus(31);
    stimulus();		// Approx 10*5 timeunits
    
    //Test2: To check 0 or 1
    stimulus(7);
    stimulus(0);
    stimulus(3);
    stimulus(1);
    stimulus();		// Approx 5*5 timeunits
    
    //Test3: Input Both Thermometer Codes Type i.e., 0s followed by 1s and vice-versa
    stimulus(1,1);
    stimulus();
    stimulus(3,1);
    stimulus();
    stimulus(7,1);
    stimulus();
    stimulus(15,1);
    stimulus();
    stimulus(31,1);
    stimulus();		// Approx 10*5 timeunits
    
    //Test4: Random Stimulus
    stimulus();
    stimulus();
    stimulus();
    stimulus();
    stimulus();		// Approx 5*5 timeunits
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #((10+5+10+5 +1)*5);
    $finish;
  end
endmodule

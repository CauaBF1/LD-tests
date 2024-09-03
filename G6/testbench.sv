module tb_grupoA5();

    reg clk;
    reg reset;
    reg w;
    wire z_comportamental;
    wire z_estrututal;

  
    grupo06 a1 (
        .clk(clk),
        .rst(reset),
        .w(w),
        .z(z_comportamental)
    );

    
  	grupo06Estrutual a2 (
        .clk(clk),
        .rst(reset),
        .w(w),
        .z(z_estrututal)
    );

    // clock
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        reset = 1;
        w = 0;

        
      	#10 reset = 0;
        #10 reset = 1;

        
      	#10 w = 1;
        #10 w = 0;
        #10 w = 1;

        
      	#10 w = 1;
        #10 w = 0;
        #10 w = 1;

        
      	#10 $finish;
    end
  
    initial begin
        
      $monitor("At time %t: w = %b, clk = %b, rst = %b, z_comportamental = %b, z_estrutural = %b", 
                 $time, w, clk, reset, z_comportamental, z_estrututal);
    end

endmodule




/*
# At time                   35: w = 1, clk = 1, rst = 1, z_comportamental = 0, z_estrututal = 0
w=1
# At time                   40: w = 0, clk = 0, rst = 1, z_comportamental = 0, z_estrututal = 0
w=-
# At time                   45: w = 0, clk = 1, rst = 1, z_comportamental = 0, z_estrututal = 0
w=0
# At time                   50: w = 1, clk = 0, rst = 1, z_comportamental = 0, z_estrututal = 0
w=-
# At time                   55: w = 1, clk = 1, rst = 1, z_comportamental = 0, z_estrututal = 1
w=1  z_estrutural = 1
# At time                   60: w = 1, clk = 0, rst = 1, z_comportamental = 0, z_estrututal = 1
z_estrutural = 1 z_comportamental ainda não é 1 pq clk nao subiu

# At time                   65: w = 1, clk = 1, rst = 1, z_comportamental = 1, z_estrututal = 0
z_estrutural = 1 z_comportamental = 1(subiu clk)
*/

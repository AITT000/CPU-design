`timescale 1ns / 1ps
module tb_reg4;
    //Inputs
    reg [3:0] data_in;
    reg inen, oen, clk, clr;
    
    
    //Outputs
    wire [3:0] data_out;
    
    //Instantiate the Unit Under Test(UUT)
    reg4 uut(
            .data_out(data_out),
            .data_in(data_in),
            .inen(inen),
            .oen(oen),
            .clk(clk),
            .clr(clr)
            );
      
     always #50 clk = ~clk;
     initial begin
            //initializee Inputs
            clr = 1;
            inen = 0;
            oen = 1;
            clk = 0;
            data_in = 4'b0101;
            #100; clr = 0;
            #100; inen = 1; oen = 1;
            #200; data_in=4'b1101;
            #200; inen = 1; oen = 1;
            #200; clr = 1;
            #100;
      end
endmodule
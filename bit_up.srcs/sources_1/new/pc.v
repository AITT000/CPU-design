module pc(clk, clr, pc_inc, load_pc, pc_oen, pc_input, pc_out);
    input clk, clr, pc_inc, load_pc, pc_oen;
    input [7:0] pc_input;
    output [7:0] pc_out;
    wire [7:0] a;
    wire [7:0] b;
    wire [7:0] c;
//ha8(data_in, data_out, pc_inc)
    ha8 u0(.data_in(a), .data_out(b), .pc_inc(pc_inc));
    assign c = (load_pc)?pc_input:b;
//reg8(data_out, data_in, inen, oen, clk, clr);
    reg8 u1(a,c,1'b1,1'b1,clk,clr);
    assign pc_out = (pc_oen)?a:8'bz;
endmodule
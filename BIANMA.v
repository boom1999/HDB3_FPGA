module BIANMA(clk,data_in,data_out);
input clk,data;
output [7:0]data_out;

add_v u1(data_in,outv,clk);
add_b u2(outv,outb,clk);
polar u3(outb,outP,outN,clk);
change u4(outP,outN,data_out,clk);
endmodule

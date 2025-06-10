`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 16:00:36
// Design Name: 
// Module Name: moore_machine_structural
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module moore_machine_structural(
input clk,
input reset,
input x,
output y
    );
reg Q_a, Q_b, Q_c; //present_state_variable
reg D_a, D_b, D_c; //next_state_variable
//present_state
always@(posedge clk or negedge reset)
    if(~reset)
        begin
            Q_a <= 1'b0;
            Q_b <= 1'b0;
            Q_c <= 1'b0;
                        end
    else
        begin
            Q_a <= D_a;
            Q_b <= D_b;
            Q_c <= D_c;
                       end
//next_state
always@(*)
     begin
        D_a = (x)&(Q_b)&(Q_c);
        D_b = (~x)&(Q_c) |  (~x)&(Q_a)  | (x)&(Q_b)&(~Q_c);
        D_c = (x)&(Q_a) | (x)&(~Q_b) |  (x)&(Q_b)&(~Q_c);
        end
//output_logic
assign y = (Q_a)&(~Q_b)&(~Q_c);
endmodule

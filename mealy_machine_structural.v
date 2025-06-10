`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 15:53:33
// Design Name: 
// Module Name: mealy_machine_structural
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


module mealy_machine_structural(
input clk,
input reset,
input x,
output y
    );
reg Q_a, Q_b; //present_state_variables
reg D_a, D_b; //next_state_variables
//present_state_logic
always@(posedge clk or negedge reset)
    if(~reset)
        begin
            Q_a <= 1'b0;
            Q_b <= 1'b0;
            end
     else
        begin
            Q_a <= D_a;
            Q_b <= D_b;
            end
//next_state_logic
 always@(*)
 begin
   D_a = ( (~x) & (Q_b) ) | ( (x) & (Q_a) & (~Q_b) ); 
   D_b = x;
    end
 //output_logic
 assign y = (x) & (Q_a)& (Q_b);
endmodule

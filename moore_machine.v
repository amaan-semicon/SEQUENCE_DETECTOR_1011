`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 14:11:37
// Design Name: 
// Module Name: moore_machine
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


module moore_machine(
input clk,
input reset,
input x,
output y
    );
reg [2:0] state_present, state_next;
localparam S0 = 0;
localparam S1 = 1;
localparam S2 = 2;
localparam S3 = 3;
localparam S4 = 4;
//present_state_logic
always@(posedge clk or negedge reset)
    if(~reset)
        state_present <= S0;
     else
        state_present <= state_next;
//next_state_logic
always@(*)
    begin
        case(state_present)
            S0 : if(x)
                    state_next = S1;
                 else
                    state_next = S0;
            S1 : if(x)
                    state_next = S1;
                 else
                    state_next = S2;
            S2 : if(x)
                    state_next = S3;
                 else
                    state_next = S0;
            S3 : if(x)
                    state_next = S4;
                 else
                    state_next = S2;
            S4 : if(x)
                    state_next = S1;
                 else
                    state_next = S2;
            default : state_next = S0; //make sures that the FSM dosen't stuck in the undefined states
            endcase
        end
 //output_logic
    assign y = (state_present == S4);
endmodule

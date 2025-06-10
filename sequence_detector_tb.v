`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 14:18:55
// Design Name: 
// Module Name: sequence_detector_tb
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



module sequence_detector_tb;
    reg clk, reset, x;
    wire y_moore, y_mealy, y_moore_structural, y_mealy_structural;

    // Instantiate Moore Machine
    moore_machine uut1(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y_moore)
    );
        moore_machine_structural uut2(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y_moore_structural)
    );

    // Instantiate Mealy Machine
    mealy_machine uut3(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y_mealy)
    );
     mealy_machine_structural uut4(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y_mealy_structural)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        x = 0;
        
       
        
      
        
        // Apply reset
        #15;
        reset = 0;
        #10;
        reset = 1;
        #10;
        
       
        
        x = 1; #10;  // 1
        x = 0; #10;  // 10  
        x = 1; #10;  // 101
        x = 1; #10;  // 1011 ← First detection expected
        x = 0; #10;  // 10110
        x = 1; #10;  // 101101
        x = 1; #10;  // 1011011 ← Second detection expected  
        x = 0; #10;  // 10110110
        x = 1; #10;  // 101101101
        x = 0; #10;  // 1011011010
        x = 1; #10;  // 10110110101
        x = 1; #10;  // 101101101011 ← Third detection expected
        x = 0; #10;  // 1011011010110
        x = 1; #10;  // 10110110101101
        x = 1; #10;  // 101101101011011 ← Fourth detection expected
        x = 1; #10;  // 1011011010110111
        x = 0; #10;  // 10110110101101110
        x = 1; #10;  // 101101101011011101
        x = 1; #10;  // 1011011010110111011 ← Fifth detection expected
        
        #20;
        
       
        $finish;
    end
endmodule
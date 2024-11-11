`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 14:25:54
// Design Name: 
// Module Name: SCAN CELL
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


module scan_cell (
    input wire clk,
    input wire rst_n,
    input wire scan_in,
    input wire scan_en,
    input wire test_access_en,    // Test access enable for modular die testing
    input wire tsv_test_en,       // TSV test enable
    input wire tsv_in,            // Input from TSV for inter-die communication
    output wire scan_out,
    output wire tsv_out,          // TSV output
    output wire tsv_pass          // TSV test result
);

    reg [3:0] scan_ff;           // Flip-flops for scan chain
    reg tsv_test_result;         // Register to hold TSV test result

    // Scan chain logic with modular test access (test_access_en enables this die's scan chain)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            scan_ff <= 4'b0000;  // Reset all flip-flops
        else if (scan_en && test_access_en)
            scan_ff <= {scan_ff[2:0], scan_in}; // Shift register operation
    end

    // TSV test logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            tsv_test_result <= 1'b0;  // Reset TSV test result
        else if (tsv_test_en)
            tsv_test_result <= (scan_ff[3] == tsv_in);  // Compare TSV input with scan chain
    end

    assign scan_out = scan_ff[3]; // Scan chain output
    assign tsv_out = scan_ff[0];  // TSV output (connects to the next die)
    assign tsv_pass = tsv_test_result;  // TSV test pass/fail

endmodule

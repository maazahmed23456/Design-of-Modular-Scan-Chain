`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 14:27:50
// Design Name: 
// Module Name: scan cell tb
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


module tb_scan_cell;

    // Inputs
    reg clk;
    reg rst_n;
    reg scan_in;
    reg scan_en;
    reg test_access_en;
    reg tsv_test_en;
    reg tsv_in;

    // Outputs
    wire scan_out;
    wire tsv_out;
    wire tsv_pass;

    // Instantiate the Test Wrapper module (IEEE 1838 compliant)
    scan_cell uut (
        .clk(clk),
        .rst_n(rst_n),
        .scan_in(scan_in),
        .scan_en(scan_en),
        .test_access_en(test_access_en),
        .tsv_test_en(tsv_test_en),
        .tsv_in(tsv_in),
        .scan_out(scan_out),
        .tsv_out(tsv_out),
        .tsv_pass(tsv_pass)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize inputs
        clk = 0;
        rst_n = 0;
        scan_in = 0;
        scan_en = 0;
        test_access_en = 0;
        tsv_test_en = 0;
        tsv_in = 0;

        // Reset the system
        #10 rst_n = 1;

        // Pre-bond Test (Die 1)
        test_access_en = 1; // Enable Test Access for Die 1
        scan_en = 1;
        scan_in = 1'b1; #10;
        scan_in = 1'b0; #10;
        scan_in = 1'b1; #10;
        scan_in = 1'b0; #10;
        test_access_en = 0; // Disable Test Access for Die 1

        // Post-bond Test (Die 2)
        test_access_en = 1; // Enable Test Access for Die 2
        tsv_in = scan_out;  // Connect TSV to Die 1 scan output
        tsv_test_en = 1;    // Enable TSV test
        scan_in = 1'b1; #10;
        scan_in = 1'b0; #10;

        // Check results
        $display("TSV Test Pass? %b", tsv_pass);

        // End of simulation
        #100;
        $finish;
    end

endmodule

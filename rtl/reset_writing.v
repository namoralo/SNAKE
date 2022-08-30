`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2022 14:49:09
// Design Name: 
// Module Name: reset_writing
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


module reset_writing(
            input  wire        clk,
            input  wire [7:0]  char_yx, 
            output reg  [7:0]  char_code 
    );
    
        // signal declaration
        reg [7:0] data;
    
        // body
        always @(posedge clk)
            char_code <= data;
    
        always @* begin
            case (char_yx)
                8'h00: data = 8'h54; //
                8'h01: data = 8'h4f; //
                8'h02: data = 8'h00; //
                8'h03: data = 8'h53; //
                8'h04: data = 8'h54; //
                8'h05: data = 8'h41; //
                8'h06: data = 8'h52; //
                8'h07: data = 8'h54; //
                8'h08: data = 8'h00; //
                8'h09: data = 8'h50; //
                8'h0a: data = 8'h52; //
                8'h0b: data = 8'h45; //
                8'h0c: data = 8'h53; //
                8'h0d: data = 8'h53; //
                
                8'h10: data = 8'h00; //
                8'h11: data = 8'h00; //
                8'h12: data = 8'h00; //
                8'h13: data = 8'h00; //
                8'h14: data = 8'h00; //
                8'h15: data = 8'h52; //
                8'h16: data = 8'h45; //
                8'h17: data = 8'h53; //
                8'h18: data = 8'h45; //
                8'h19: data = 8'h54; //
                8'h1a: data = 8'h00; //
                8'h1b: data = 8'h00; //
                8'h1c: data = 8'h00; //
                8'h1d: data = 8'h00; //
                
                default: data = 8'h00;
            endcase
    end
endmodule

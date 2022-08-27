`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2022 12:17:42
// Design Name: 
// Module Name: char_rom_16x16
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


module you_win_writing(

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
                8'h00: data = 8'h59; //Y
                8'h01: data = 8'h4f; //O
                8'h02: data = 8'h55; //U
                8'h03: data = 8'h00; //
                8'h04: data = 8'h57; //W
                8'h05: data = 8'h49; //I
                8'h06: data = 8'h4e; //N
                
                default: data = 8'h00;
            endcase
    end
endmodule

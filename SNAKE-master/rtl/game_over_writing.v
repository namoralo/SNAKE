`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 05.05.2022 12:17:42
// Design Name: 
// Module Name: game_over_writing
// Project Name: Entliczek pentliczek
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


module game_over_writing(
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
        8'h00: data = 8'h47; //G
        8'h01: data = 8'h41; //A
        8'h02: data = 8'h4d; //M
        8'h03: data = 8'h45; //E
        8'h04: data = 8'h00; //
        8'h05: data = 8'h4f; //O
        8'h06: data = 8'h56; //V
        8'h07: data = 8'h45; //E
        8'h08: data = 8'h52; //R
        
        default: data = 8'h00;
    endcase
end

endmodule

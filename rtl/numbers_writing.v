`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 28.08.2022 17:49:05
// Design Name: 
// Module Name: numbers_writing
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


module numbers_writing(
    input  wire        clk,
    input  wire [3:0]  score,
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
        8'h00: data = (48 + (score / 10)); //48 -> zero dziesiêtnie w ascii
        8'h01: data = (48 + (score % 10)); 

        default: data = 8'h00;
    endcase
end

endmodule

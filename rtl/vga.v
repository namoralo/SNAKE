`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 01:34:44
// Design Name: 
// Module Name: draw_background
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


module vga(
    input wire hsync_in,
    input wire vsync_in,
    input wire rst,
    input wire pclk,
    output reg hsync_out,
    output reg vsync_out
  
    );    
    always @(posedge pclk or posedge rst) begin
        if(rst) begin
            hsync_out <= 0;
            vsync_out <= 0;
        end
        else begin
            hsync_out <= hsync_in;
            vsync_out <= vsync_in;
        end
end    
endmodule

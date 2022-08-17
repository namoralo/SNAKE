`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2022 23:20:15
// Design Name: 
// Module Name: random_coordinates
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


module random_coordinates(
    input wire clk,
    input wire reset,
    input wire [6:0] frame_x_inside_grid,
    input wire [5:0] frame_y_inside_grid,
    input wire [6:0] number_x_grid,
    input wire [5:0] number_y_grid,
    output reg [6:0] x_start_grid,
    output reg [5:0] y_start_grid
);

reg [6:0] x_start_grid_nxt;
reg [5:0] y_start_grid_nxt;

always@(posedge clk or posedge reset) begin
    if(reset) begin
        x_start_grid <= frame_x_inside_grid;
    y_start_grid <= number_y_grid - frame_y_inside_grid - 1;
    end
    else begin
        x_start_grid <= x_start_grid_nxt;
        y_start_grid <= y_start_grid_nxt;
    end
end

always@* begin
    if(x_start_grid < (number_x_grid - frame_x_inside_grid - 1))
        x_start_grid_nxt = x_start_grid + 1;
    else
        x_start_grid_nxt = frame_x_inside_grid;
end

always@* begin
    if(y_start_grid > frame_y_inside_grid)
        y_start_grid_nxt = y_start_grid - 1;
    else
        y_start_grid_nxt = number_y_grid - frame_y_inside_grid -1;
end

endmodule


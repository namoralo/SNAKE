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
    output reg [6:0] x_start_grid,
    output reg [5:0] y_start_grid
);

reg [6:0] x_start_grid_nxt = 1;
reg [5:0] y_start_grid_nxt = 47;

always @ (posedge clk) begin
    x_start_grid <= x_start_grid_nxt;
    y_start_grid <= x_start_grid_nxt;
end

always@* begin
    if(x_start_grid_nxt < 96)
        x_start_grid_nxt = x_start_grid_nxt + 1;
    else
        x_start_grid_nxt = 0;
end

always@* begin
    if(y_start_grid_nxt > 0)
        y_start_grid_nxt = y_start_grid_nxt - 1;
    else
        y_start_grid_nxt = 47;
end

endmodule


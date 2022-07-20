`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2022 22:38:19
// Design Name: 
// Module Name: apple
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


module apple(
    input wire clk,
    input wire reset,
    input wire [6:0] x_start_grid,
    input wire [5:0] y_start_grid,
    input wire [9:0] grid_size,
    input wire [10:0] head_x,
    input wire [10:0] head_y,
    output reg [6:0] apple_x,
    output reg [5:0] apple_y,
    output reg [3:0]score // max 10
);

    reg [6:0] apple_x_nxt;
    reg [5:0] apple_y_nxt;
    reg [3:0]score_nxt;
    
always @(posedge clk or posedge reset) begin
    if(reset)begin
        score <= 0;
        apple_x <= 512;
        apple_y <= 384;
    end
    else begin
        score <= score_nxt;
        apple_x <= apple_x_nxt;
        apple_y <= apple_y_nxt;
    end
end

always @* begin
    if((head_x == apple_x*grid_size) && (head_y == apple_y*grid_size)) begin
        score_nxt = score_nxt + 1;
        apple_x_nxt = x_start_grid;
        apple_y_nxt = y_start_grid;
    end
end

endmodule

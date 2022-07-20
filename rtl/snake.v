`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2022 16:05:31
// Design Name: 
// Module Name: snake
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


module snake(
   input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output reg [10:0] head_x,
    output reg [10:0] head_y,
    output reg head
    

    );
    
      reg [11:0] rgb_nxt;
      reg [10:0] head_x_nxt;
      reg [10:0] head_y_nxt;
    
        localparam 
          HOR_PIX = 1024,
          VER_PIX = 768,
          GRID_SIZE = 16,
          //BORDER_WIDTH = 1, 
          FRAME_WIDTH = 1, // in grids
          FRAME_X_SIZE = 40, // in grids
          FRAME_Y_SIZE = 20, // in grids
          FRAME_X_OUTSIDE = ((HOR_PIX - (FRAME_X_SIZE*GRID_SIZE))/2),
          FRAME_Y_OUTSIDE = ((VER_PIX - (FRAME_Y_SIZE*GRID_SIZE))/2);
    
always @(posedge pclk or posedge rst) begin
               if(rst) begin
                   hcount_out <= 0;
                   hsync_out <= 0;
                   hblnk_out <= 0;
                   vcount_out <= 0;
                   vsync_out <= 0;
                   vblnk_out <= 0;
                   rgb_out <= 0;
                   head_x <= (HOR_PIX/2);
                   head_y <= (VER_PIX/2);
               end
               else begin
                   hcount_out <= hcount_in;
                   hsync_out <= hsync_in;
                   hblnk_out <= hblnk_in;
                   vcount_out <= vcount_in;
                   vsync_out <= vsync_in;
                   vblnk_out <= vblnk_in;
                   rgb_out <= rgb_nxt;
                   head_x <= head_x_nxt;
                   head_y <= head_y_nxt;
               end        
           end    
    
    always@* begin
        head = ((hcount_in >= head_x) && (hcount_in >= head_x + GRID_SIZE) && (vcount_in >= head_y) && (vcount_in >= head_y + GRID_SIZE));
    end 
    
endmodule

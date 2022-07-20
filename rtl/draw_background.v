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


module draw_background(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output reg border
    );
    
    wire [6:0] x_start_grid;
    wire [5:0] y_start_grid;
    
    random_coordinates my_random_coordinates(
        .clk(pclk),
        .x_start_grid(x_start_grid),
        .y_start_grid(y_start_grid)
    );
    
    localparam 
        HOR_PIX = 1024,
        VER_PIX = 768,
        GRID_SIZE = 16,
        //BORDER_WIDTH = 1, 
        FRAME_WIDTH = 1, // in grids
        FRAME_X_SIZE = 40, // in grids
        FRAME_Y_SIZE = 20, // in grids
        FRAME_X_OFFSET = ((HOR_PIX - (FRAME_X_SIZE*GRID_SIZE))/2),
        FRAME_Y_OFFSET = ((VER_PIX - (FRAME_Y_SIZE*GRID_SIZE))/2);
    
    reg [11:0] rgb_nxt;
    
    always @(posedge pclk or posedge rst) begin
        if(rst) begin
            hcount_out <= 0;
            hsync_out <= 0;
            hblnk_out <= 0;
            vcount_out <= 0;
            vsync_out <= 0;
            vblnk_out <= 0;
            rgb_out <= 0;
        end
        else begin
            hcount_out <= hcount_in;
            hsync_out <= hsync_in;
            hblnk_out <= hblnk_in;
            vcount_out <= vcount_in;
            vsync_out <= vsync_in;
            vblnk_out <= vblnk_in;
            rgb_out <= rgb_nxt;
        end        
    end
    
    always @*
      begin
        // During blanking, make it it black.
        if (vblnk_in || hblnk_in) rgb_nxt = 12'h0_0_0; 
        else begin
            if((hcount_in >= FRAME_X_OFFSET) && (hcount_in < (FRAME_X_OFFSET + FRAME_WIDTH*GRID_SIZE)) && (vcount_in >= FRAME_Y_OFFSET) && (vcount_in < (FRAME_Y_OFFSET + FRAME_Y_SIZE*GRID_SIZE)))
                rgb_nxt = 12'hf_0_0;
            else  if((hcount_in < (HOR_PIX - FRAME_X_OFFSET)) && (hcount_in >= (HOR_PIX - FRAME_X_OFFSET - FRAME_WIDTH*GRID_SIZE)) && (vcount_in >= FRAME_Y_OFFSET) && (vcount_in < (FRAME_Y_OFFSET + FRAME_Y_SIZE*GRID_SIZE)))
                rgb_nxt = 12'hf_0_0;
            else if((hcount_in >= FRAME_X_OFFSET) && (hcount_in < (FRAME_X_OFFSET + FRAME_X_SIZE*GRID_SIZE)) && (vcount_in < (VER_PIX - FRAME_Y_OFFSET)) && (vcount_in >= (VER_PIX - FRAME_Y_OFFSET - FRAME_WIDTH*GRID_SIZE)))
                rgb_nxt = 12'hf_0_0;
            else if((hcount_in >= FRAME_X_OFFSET) && (hcount_in < (FRAME_X_OFFSET + FRAME_X_SIZE*GRID_SIZE)) && (vcount_in >= FRAME_Y_OFFSET) && (vcount_in < (FRAME_Y_OFFSET + FRAME_WIDTH*GRID_SIZE)))
                rgb_nxt = 12'hf_0_0;
            else if(hcount_in == 0 || hcount_in == 16 || hcount_in == 32 || hcount_in == 48 || hcount_in == 64)
                rgb_nxt = 12'h0_0_f;
            else if((hcount_in >= x_start_grid*GRID_SIZE) && (hcount_in < (x_start_grid*GRID_SIZE + GRID_SIZE)) && (vcount_in >= y_start_grid*GRID_SIZE) && (vcount_in < (y_start_grid*GRID_SIZE + GRID_SIZE)))
                rgb_nxt = 12'hf_f_0;
            else
                rgb_nxt = 12'hf_f_f;     
        end
     end
    
endmodule

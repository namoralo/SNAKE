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
    output wire [9:0] hor_pix,
    output wire [9:0] ver_pix,
    output wire [6:0] frame_x_size_grid,
    output wire [5:0] frame_y_size_grid,
    output wire [9:0] frame_x_inside_px,
    output wire [9:0] frame_y_inside_px,
    output wire [9:0] frame_x_outside_px,
    output wire [9:0] frame_y_outside_px,
    output wire [6:0] frame_x_inside_grid,
    output wire [5:0] frame_y_inside_grid,
    output wire [6:0] frame_x_outside_grid,
    output wire [5:0] frame_y_outside_grid,
    output wire [6:0] number_x_grid,
    output wire [5:0] number_y_grid,
    output wire [9:0] grid_size
    );
    
     reg [11:0] rgb_nxt;
    
    localparam 
        HOR_PIX       = 1024,
        VER_PIX       = 768,
        GRID_SIZE     = 16,
        NUMBER_X_GRID = (HOR_PIX/GRID_SIZE),
        NUMBER_Y_GRID = (VER_PIX/GRID_SIZE),
        FRAME_WIDTH   = 1, // in grids
        FRAME_X_SIZE  = 40, // in grids
        FRAME_Y_SIZE  = 20, // in grids
        FRAME_X_OUTSIDE = ((HOR_PIX - (FRAME_X_SIZE*GRID_SIZE))/2),
        FRAME_Y_OUTSIDE = ((VER_PIX - (FRAME_Y_SIZE*GRID_SIZE))/2),
        FRAME_X_INSIDE  = (FRAME_X_OUTSIDE + FRAME_WIDTH*GRID_SIZE),
        FRAME_Y_INSIDE  = (FRAME_Y_OUTSIDE + FRAME_WIDTH*GRID_SIZE),
        
        BORDER_COLOR = 12'h7_4_0,
        BACKGROUND_COLOR = 12'hd_a_5;
    
    assign hor_pix = HOR_PIX;
    assign ver_pix = VER_PIX;
    assign frame_x_size_grid = FRAME_X_SIZE;
    assign frame_y_size_grid = FRAME_Y_SIZE;
    assign frame_x_inside_px = FRAME_X_INSIDE;
    assign frame_y_inside_px = FRAME_Y_INSIDE;
    assign frame_x_outside_px = FRAME_X_OUTSIDE;
    assign frame_y_outside_px = FRAME_Y_OUTSIDE;
    assign frame_x_inside_grid = (FRAME_X_INSIDE/GRID_SIZE);
    assign frame_y_inside_grid = (FRAME_Y_INSIDE/GRID_SIZE);
    assign frame_x_outside_grid = (FRAME_X_OUTSIDE/GRID_SIZE);
    assign frame_y_outside_grid = (FRAME_Y_OUTSIDE/GRID_SIZE);
    assign number_x_grid = NUMBER_X_GRID;
    assign number_y_grid = NUMBER_Y_GRID;
    assign grid_size = GRID_SIZE;
    
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
    
    always @* begin
        if (vblnk_in || hblnk_in) rgb_nxt = 12'h0_0_0; 
        else begin
            if((hcount_in >= FRAME_X_OUTSIDE) && (hcount_in < FRAME_X_INSIDE) && (vcount_in >= FRAME_Y_OUTSIDE) && (vcount_in < (FRAME_Y_OUTSIDE + FRAME_Y_SIZE*GRID_SIZE)))
                rgb_nxt = BORDER_COLOR;
            else  if((hcount_in < (HOR_PIX - FRAME_X_OUTSIDE)) && (hcount_in >= (HOR_PIX - FRAME_X_INSIDE)) && (vcount_in >= FRAME_Y_OUTSIDE) && (vcount_in < (FRAME_Y_OUTSIDE + FRAME_Y_SIZE*GRID_SIZE)))
                rgb_nxt = BORDER_COLOR;
            else if((hcount_in >= FRAME_X_OUTSIDE) && (hcount_in < (FRAME_X_OUTSIDE + FRAME_X_SIZE*GRID_SIZE)) && (vcount_in < (VER_PIX - FRAME_Y_OUTSIDE)) && (vcount_in >= (VER_PIX - FRAME_Y_INSIDE)))
                rgb_nxt = BORDER_COLOR;
            else if((hcount_in >= FRAME_X_OUTSIDE) && (hcount_in < (FRAME_X_OUTSIDE + FRAME_X_SIZE*GRID_SIZE)) && (vcount_in >= FRAME_Y_OUTSIDE) && (vcount_in < FRAME_Y_INSIDE))
                rgb_nxt = BORDER_COLOR;
            else
            rgb_nxt = BACKGROUND_COLOR;   
        end            
    end

endmodule

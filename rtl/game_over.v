`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2022 00:25:21
// Design Name: 
// Module Name: game_over
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


module game_over(
    input wire clk,
    input wire rst,
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output reg border,
    output reg game_over
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

reg game_over_nxt; 
 
always @ (posedge clk or posedge rst) begin
    if(rst)
        game_over <= 0;
    else
        game_over <= game_over_nxt;
end

always @(posedge clk or posedge rst) begin
    if(rst)
        border <= 0;
    else
        border <= ((hcount_in < (FRAME_X_OFFSET + FRAME_WIDTH*GRID_SIZE)) || (hcount_in >= (HOR_PIX - FRAME_X_OFFSET - FRAME_WIDTH*GRID_SIZE)) || (vcount_in >= (VER_PIX - FRAME_Y_OFFSET - FRAME_WIDTH*GRID_SIZE)) ||  (vcount_in < (FRAME_Y_OFFSET + FRAME_WIDTH*GRID_SIZE)));
end

wire [3:0] char_line;
  wire [7:0] char_line_pixels_fr;
wire [7:0] char_yx;
wire [3:0] char_line_buf;
wire [6:0] char_code;

always @* begin
    if(border) begin
        game_over_nxt = 1;
        
/*draw_rect_char my_draw_rect_char(
            .hcount_in(hcount_in),
            .hsync_in(hsync_in),
            .hblnk_in(hblnk_in),
            .vcount_in(vcount_in),
            .vsync_in(vsync_in),
            .vblnk_in(vblnk_in),
            .rgb_in(rgb_in),
            .char_pixels(char_line_pixels_fr),
            .rst(rst),
            .pclk(clk),
            .hcount_out(hcount_out),
            .hsync_out(hsync_out),
            .hblnk_out(hblnk_out),
            .vcount_out(vcount_out),
            .vsync_out(vsync_out),
            .vblnk_out(vblnk_out),
            .rgb_out(rgb_out),
            //.addr(addr_fr)
            .char_yx(char_yx),
            .char_line(char_line)//(char_line_buf)
            );
            
         vga_char_line my_vga_char_line(
            
                .char_line_in(char_line_buf),
                .rst(rst),
                .pclk(clk),
                .char_line_out(char_line)
              
                ); 
       
         font_rom my_font_rom(
            .clk(clk),
            .addr({char_code,char_line}),
            .char_line_pixels(char_line_pixels_fr)
        );
        
        game_over_writing my_game_over_writing(
            .clk(clk),
            .char_yx(char_yx),
            .char_code(char_code) 
            );
  */  end
    else
        game_over_nxt = 0;
end

endmodule

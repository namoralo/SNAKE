`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2022 15:43:49
// Design Name: 
// Module Name: draw_game_over
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


module draw_game_over(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [79:0] char_pixels_game_over,
    input wire game_over, victory,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output wire [7:0] char_yx_game_over,
    output wire [7:0] char_line_game_over
    );
    
    reg [11:0] rgb_nxt, rgb_out_d, rgb_out_d1;
    
    reg [10:0] hcount_delay, vcount_delay, hcount_delay1, vcount_delay1;
    reg hsync_delay, hblnk_delay, vsync_delay, vblnk_delay, hsync_delay1, hblnk_delay1, vsync_delay1, vblnk_delay1;
    
    wire [10:0] y_game_over, x_game_over, x1_game_over,y1_game_over;
    wire game_over_con_1, game_over_con_2;
    
    localparam 
        GAME_OVER_X_POS_RECT = 152,
        GAME_OVER_Y_POS_RECT = 208,
        GAME_OVER_WIDTH_RECT = 720,
        GAME_OVER_LENGTH_RECT = 80,
        GAME_OVER_COLOR_RECT = 12'hf_c_b,
        GAME_OVER_COLOR_LETTER = 12'hf_8_7;


    always @(posedge pclk or posedge rst) begin
        if(rst) begin
            hcount_delay <= 0;
            hsync_delay <= 0;
            hblnk_delay <= 0; 
            vcount_delay <= 0;
            vsync_delay <= 0;
            vblnk_delay <= 0;
            rgb_out_d <= 0;
        end
        else begin
            hcount_delay <= hcount_in;
            hsync_delay <= hsync_in;
            hblnk_delay <= hblnk_in; 
            vcount_delay <= vcount_in;
            vsync_delay <= vsync_in;
            vblnk_delay <= vblnk_in;
            rgb_out_d <= rgb_in;
        end
    end
    
    always @(posedge pclk or posedge rst) begin
        if(rst) begin
            hcount_delay1 <= 0;
            hsync_delay1 <= 0;
            hblnk_delay1 <= 0; 
            vcount_delay1 <= 0;
            vsync_delay1 <= 0;
            vblnk_delay1 <= 0;
            rgb_out_d1 <= 0;
        end
        else begin
            hcount_delay1 <= hcount_delay;
            hsync_delay1 <= hsync_delay;
            hblnk_delay1 <= hblnk_delay; 
            vcount_delay1 <= vcount_delay;
            vsync_delay1 <= vsync_delay;
            vblnk_delay1 <= vblnk_delay;
            rgb_out_d1 <= rgb_out_d;
        end
    end
    
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
                hcount_out <= hcount_delay1;
                hsync_out <= hsync_delay1;
                hblnk_out <= hblnk_delay1; 
                vcount_out <= vcount_delay1;
                vsync_out <= vsync_delay1;
                vblnk_out <= vblnk_delay1;
                rgb_out <= rgb_nxt;
            end
        end
    
    
    assign y_game_over = ((vcount_in - GAME_OVER_Y_POS_RECT)/80);
    assign x_game_over = ((hcount_in - GAME_OVER_X_POS_RECT)/80);
    assign x1_game_over = ((hcount_delay1 - GAME_OVER_X_POS_RECT)%80);
    assign y1_game_over = ((vcount_delay1 - GAME_OVER_Y_POS_RECT)%80);
    assign char_yx_game_over = {(y_game_over[3:0]), x_game_over[3:0]};
    assign char_line_game_over = y1_game_over[7:0];

        assign game_over_con_1 = ((hcount_delay1 >= GAME_OVER_X_POS_RECT) && (vcount_delay1 >= GAME_OVER_Y_POS_RECT) && (hcount_delay1 < GAME_OVER_X_POS_RECT + GAME_OVER_WIDTH_RECT) && (vcount_delay1 < GAME_OVER_Y_POS_RECT + GAME_OVER_LENGTH_RECT));
        assign game_over_con_2 = (char_pixels_game_over[7'b1001111 - x1_game_over[6:0]]);

 always@ * begin
    if (vblnk_in || hblnk_in) rgb_nxt = 12'h0_0_0; 
            else begin
        if(game_over) begin
            if(game_over_con_1) begin
                if(game_over_con_2)
                    rgb_nxt = GAME_OVER_COLOR_LETTER;         
                else
                    rgb_nxt = GAME_OVER_COLOR_RECT;
            end  
          else
                rgb_nxt = GAME_OVER_COLOR_RECT;
        end
                else  rgb_nxt = rgb_out_d1;  
    end    
end
endmodule

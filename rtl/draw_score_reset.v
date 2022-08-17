`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.08.2022 18:55:27
// Design Name: 
// Module Name: draw_score_reset
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


module draw_score_reset(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [39:0] char_pixels_score_reset,
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
    output wire [7:0] char_yx_score_reset,
    output wire [7:0] char_line_score_reset
    );
    
    reg [11:0] rgb_nxt, rgb_out_d, rgb_out_d1;
    
    reg [10:0] hcount_delay, vcount_delay, hcount_delay1, vcount_delay1;
    reg hsync_delay, hblnk_delay, vsync_delay, vblnk_delay, hsync_delay1, hblnk_delay1, vsync_delay1, vblnk_delay1;
    
    wire [10:0] y_score_reset, x_score_reset, x1_score_reset, y1_score_reset;
    
    localparam 
        GAME_OVER_COLOR_RECT = 12'hf_c_b,
        GAME_OVER_COLOR_SCORE_RESET = 12'hf_a_a,
        YOU_WIN_COLOR_RECT = 12'hb_d_f,
        YOU_WIN_COLOR_SCORE_RESET = 12'hb_9_f,
        
        SCORE_RESET_X_POS_RECT = 112,
        SCORE_RESET_Y_POS_RECT = 380,
        SCORE_RESET_WIDTH_RECT = 800,
        SCORE_RESET_LENGTH_RECT = 240;


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

    assign y_score_reset = ((vcount_in - SCORE_RESET_Y_POS_RECT)/40);
    assign x_score_reset = ((hcount_in - SCORE_RESET_X_POS_RECT)/40);
    assign x1_score_reset = ((hcount_delay1 - SCORE_RESET_X_POS_RECT)%40);
    assign y1_score_reset = ((vcount_delay1 - SCORE_RESET_Y_POS_RECT)%40);
    assign char_yx_score_reset = {y_score_reset[3:0], x_score_reset[3:0]};
    assign char_line_score_reset = y1_score_reset[7:0];
    
    always@ * begin
        if(game_over) begin
           if((hcount_delay1 >= SCORE_RESET_X_POS_RECT) && (vcount_delay1 >= SCORE_RESET_Y_POS_RECT) && (hcount_delay1 < SCORE_RESET_X_POS_RECT + SCORE_RESET_WIDTH_RECT) && (vcount_delay1 < SCORE_RESET_Y_POS_RECT + SCORE_RESET_LENGTH_RECT)) begin
                if(char_pixels_score_reset[6'b100111 - x1_score_reset[5:0]])
                    rgb_nxt = GAME_OVER_COLOR_SCORE_RESET;         
                else
                    rgb_nxt = GAME_OVER_COLOR_RECT;
            end 
            else
                rgb_nxt = rgb_out_d1;
        end
        
        else if(victory) begin
          if((hcount_delay1 >= SCORE_RESET_X_POS_RECT) && (vcount_delay1 >= SCORE_RESET_Y_POS_RECT) && (hcount_delay1 < SCORE_RESET_X_POS_RECT + SCORE_RESET_WIDTH_RECT) && (vcount_delay1 < SCORE_RESET_Y_POS_RECT + SCORE_RESET_LENGTH_RECT)) begin
                if(char_pixels_score_reset[6'b101000 - x1_score_reset[5:0]])
                    rgb_nxt = YOU_WIN_COLOR_SCORE_RESET;         
                else
                    rgb_nxt = YOU_WIN_COLOR_RECT;
            end
            else 
                rgb_nxt = rgb_out_d1;
        end
        else  rgb_nxt = rgb_out_d1;  
    end    

endmodule

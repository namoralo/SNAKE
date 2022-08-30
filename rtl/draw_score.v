`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.08.2022 18:55:27
// Design Name: 
// Module Name: draw_score
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


module draw_score(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [39:0] char_pixels_score,
    input wire game_over_in, victory_in,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output reg game_over_out, victory_out,
    output wire [7:0] char_yx_score,
    output wire [7:0] char_line_score
    );
    
    reg [11:0] rgb_nxt, rgb_out_d, rgb_out_d1;
    
    reg [10:0] hcount_delay, vcount_delay, hcount_delay1, vcount_delay1;
    reg hsync_delay, hblnk_delay, vsync_delay, vblnk_delay, hsync_delay1, hblnk_delay1, vsync_delay1, vblnk_delay1;
    
    wire [10:0] y_score, x_score, x1_score, y1_score;
    
    localparam 
        GAME_OVER_COLOR_SCORE_RESET = 12'hf_a_a,
        YOU_WIN_COLOR_SCORE_RESET = 12'hb_9_f,
        
        SCORE_X_POS_RECT = 232,
        SCORE_Y_POS_RECT = 380,
        SCORE_WIDTH_RECT = 560,
        SCORE_LENGTH_RECT = 40;


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

    assign y_score = ((vcount_in - SCORE_Y_POS_RECT)/40);
    assign x_score = ((hcount_in - SCORE_X_POS_RECT)/40);
    assign x1_score = ((hcount_delay1 - SCORE_X_POS_RECT)%40);
    assign y1_score = ((vcount_delay1 - SCORE_Y_POS_RECT)%40);
    assign char_yx_score = {y_score[3:0], x_score[3:0]};
    assign char_line_score = y1_score[7:0];
    
always@ * begin
    if((hcount_delay1 >= SCORE_X_POS_RECT) && (vcount_delay1 >= SCORE_Y_POS_RECT) && (hcount_delay1 < SCORE_X_POS_RECT + SCORE_WIDTH_RECT) && (vcount_delay1 < SCORE_Y_POS_RECT + SCORE_LENGTH_RECT)) begin
        if(char_pixels_score[6'b100111 - x1_score[5:0]]) begin
            if(game_over_in)
                rgb_nxt = GAME_OVER_COLOR_SCORE_RESET;
            else if(victory_in)
                rgb_nxt = YOU_WIN_COLOR_SCORE_RESET;         
            else
                rgb_nxt = rgb_out_d1;
        end 
        else
        rgb_nxt = rgb_out_d1;
        end 
    else
    rgb_nxt = rgb_out_d1;

end    

endmodule

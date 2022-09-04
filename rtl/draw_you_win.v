`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 27.08.2022 14:03:39
// Design Name: 
// Module Name: draw_you_win
// Project Name: Entliczek pentliczek
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


module draw_you_win(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [79:0] char_pixels_you_win,
    input wire victory,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output wire [7:0] char_yx_you_win,
    output wire [7:0] char_line_you_win
);

    reg [11:0] rgb_nxt, rgb_out_d, rgb_out_d1;
    
    reg [10:0] hcount_delay, vcount_delay, hcount_delay1, vcount_delay1;
    reg hsync_delay, hblnk_delay, vsync_delay, vblnk_delay, hsync_delay1, hblnk_delay1, vsync_delay1, vblnk_delay1;
    
    wire [10:0] y_you_win, x_you_win, x1_you_win, y1_you_win;
    wire victory_con_1, victory_con_2;
    
    localparam  
        YOU_WIN_X_POS_RECT = 232,
        YOU_WIN_Y_POS_RECT = 208,
        YOU_WIN_WIDTH_RECT = 560,
        YOU_WIN_LENGTH_RECT = 80,
        YOU_WIN_COLOR_RECT = 12'hb_d_f,
        YOU_WIN_COLOR_LETTER = 12'hb_1_f;

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

    assign y_you_win = ((vcount_in - YOU_WIN_Y_POS_RECT)/80);
    assign x_you_win = ((hcount_in - YOU_WIN_X_POS_RECT)/80);
    assign x1_you_win = ((hcount_delay1 - YOU_WIN_X_POS_RECT)%80);
    assign y1_you_win = ((vcount_delay1 - YOU_WIN_Y_POS_RECT)%80);
    assign char_yx_you_win = {y_you_win[3:0], x_you_win[3:0]};
    assign char_line_you_win = y1_you_win[7:0];
    
    assign victory_con_1 = ((hcount_delay1 >= YOU_WIN_X_POS_RECT) && (vcount_delay1 >= YOU_WIN_Y_POS_RECT) && (hcount_delay1 < YOU_WIN_X_POS_RECT + YOU_WIN_WIDTH_RECT) && (vcount_delay1 < YOU_WIN_Y_POS_RECT + YOU_WIN_LENGTH_RECT));
    assign victory_con_2 = (char_pixels_you_win[7'b1010000 - x1_you_win[6:0]]);

always@ * begin
    if (vblnk_in || hblnk_in) rgb_nxt = 12'h0_0_0; 
    else begin
        if(victory) begin
            if(victory_con_1) begin
                if(victory_con_2)
                    rgb_nxt = YOU_WIN_COLOR_LETTER;         
                else
                    rgb_nxt = YOU_WIN_COLOR_RECT;
            end
            else 
                rgb_nxt = YOU_WIN_COLOR_RECT;
        end
        else  rgb_nxt = rgb_out_d1;  
    end    
end

endmodule

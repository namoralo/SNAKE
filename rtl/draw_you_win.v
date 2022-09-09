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
    input wire [63:0] char_pixels_you_win,
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
    output reg [7:0] char_yx_you_win,
    output reg [7:0] char_line_you_win
);

    localparam  
        YOU_WIN_X_POS_RECT = 288,
        YOU_WIN_Y_POS_RECT = 208,
        YOU_WIN_WIDTH_RECT = 448,
        YOU_WIN_LENGTH_RECT = 64,
        YOU_WIN_COLOR_RECT = 12'hb_d_f,
        YOU_WIN_COLOR_LETTER = 12'hb_1_f;
        
    reg [11:0] rgb_nxt;
	wire [11:0] rgb_out_d;
    
    wire [10:0] hcount_delay, vcount_delay;
    wire hsync_delay, hblnk_delay, vsync_delay, vblnk_delay;
    
    wire [10:0] y_you_win, x_you_win, x1_you_win, y1_you_win;
    wire victory_con_1, victory_con_2;
    
	wire [7:0] char_yx_you_win_nxt, char_line_you_win_nxt, char_line_you_win_nxt_d;
	
always @(posedge pclk) begin
    if(rst) begin
        hcount_out <= 0;
        hsync_out <= 0;
        hblnk_out <= 0; 
        vcount_out <= 0;
        vsync_out <= 0;
        vblnk_out <= 0;
        rgb_out <= 0;
		char_line_you_win <= 0;
		char_yx_you_win <=0;
    end
    else begin
        hcount_out <= hcount_delay;
        hsync_out <= hsync_delay;
        hblnk_out <= hblnk_delay; 
        vcount_out <= vcount_delay;
        vsync_out <= vsync_delay;
        vblnk_out <= vblnk_delay;
        rgb_out <= rgb_nxt;
		char_line_you_win <= char_line_you_win_nxt_d;
		char_yx_you_win <= char_yx_you_win_nxt;
    end
end


	delay #(
        .WIDTH (38),
        .CLK_DEL(3)
    ) my3clk_delay (
        .clk (pclk),
        .rst (rst),
        .din ({hcount_in, hsync_in,hblnk_in, vcount_in, vsync_in,vblnk_in,rgb_in}),
        .dout ({hcount_delay, hsync_delay,hblnk_delay, vcount_delay, vsync_delay,vblnk_delay,rgb_out_d})
    );
	
	delay #(
        .WIDTH (8),
        .CLK_DEL(1)
    ) my1clk_delay (
        .clk (pclk),
        .rst (rst),
        .din (char_line_you_win_nxt),
        .dout (char_line_you_win_nxt_d)
    );
	
	
    assign y_you_win = ((vcount_in - YOU_WIN_Y_POS_RECT)>>6);
    assign x_you_win = ((hcount_in - YOU_WIN_X_POS_RECT)>>6);
    assign x1_you_win = ((hcount_delay - YOU_WIN_X_POS_RECT)%64);
    assign y1_you_win = ((vcount_delay - YOU_WIN_Y_POS_RECT)%64);
    assign char_yx_you_win_nxt = {y_you_win[3:0], x_you_win[3:0]};
    assign char_line_you_win_nxt = y1_you_win[7:0];
    
    assign victory_con_1 = ((hcount_delay >= YOU_WIN_X_POS_RECT) && (vcount_delay >= YOU_WIN_Y_POS_RECT) && (hcount_delay < YOU_WIN_X_POS_RECT + YOU_WIN_WIDTH_RECT) && (vcount_delay < YOU_WIN_Y_POS_RECT + YOU_WIN_LENGTH_RECT));
    assign victory_con_2 = (char_pixels_you_win[7'd64 - x1_you_win[6:0]]);

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
        else  rgb_nxt = rgb_out_d;  
    end    
end

endmodule

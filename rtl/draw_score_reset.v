`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 07.08.2022 18:55:27
// Design Name: 
// Module Name: draw_score_reset
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


module draw_score_reset
#(  parameter    
        SCORE_RESET_X_POS_RECT = 232,
        SCORE_RESET_Y_POS_RECT = 380,
        SCORE_RESET_WIDTH_RECT = 560,
        SCORE_RESET_LENGTH_RECT = 240
)
(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [31:0] char_pixels_score_reset,
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
    output reg [7:0] char_yx_score_reset,
    output reg [7:0] char_line_score_reset
);

    localparam 
        GAME_OVER_COLOR_SCORE_RESET = 12'hf_a_a,
        YOU_WIN_COLOR_SCORE_RESET = 12'hb_9_f;

    reg [11:0] rgb_nxt;
	wire [11:0] rgb_out_d;
    
    wire [10:0] hcount_delay, vcount_delay;
    wire hsync_delay, hblnk_delay, vsync_delay, vblnk_delay;
    
    wire [10:0] y_score_reset, x_score_reset, x1_score_reset, y1_score_reset;
    
	wire [7:0] char_yx_score_reset_nxt, char_line_score_reset_nxt, char_line_score_reset_nxt_d;

always @(posedge pclk) begin
    if(rst) begin
        hcount_out <= 0;
        hsync_out <= 0;
        hblnk_out <= 0; 
        vcount_out <= 0;
        vsync_out <= 0;
        vblnk_out <= 0;
        rgb_out <= 0;
		char_line_score_reset <= 0;
		char_yx_score_reset <=0;
    end
    else begin
        hcount_out <= hcount_delay;
        hsync_out <= hsync_delay;
        hblnk_out <= hblnk_delay; 
        vcount_out <= vcount_delay;
        vsync_out <= vsync_delay;
        vblnk_out <= vblnk_delay;
        rgb_out <= rgb_nxt;
		char_line_score_reset <= char_line_score_reset_nxt_d;
		char_yx_score_reset <= char_yx_score_reset_nxt;
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
        .din (char_line_score_reset_nxt),
        .dout (char_line_score_reset_nxt_d)
    );
	
	
    assign y_score_reset = ((vcount_in - SCORE_RESET_Y_POS_RECT)>>5);
    assign x_score_reset = ((hcount_in - SCORE_RESET_X_POS_RECT)>>5);
    assign x1_score_reset = ((hcount_delay - SCORE_RESET_X_POS_RECT)%32);
    assign y1_score_reset = ((vcount_delay - SCORE_RESET_Y_POS_RECT)%32);
    assign char_yx_score_reset_nxt = {y_score_reset[3:0], x_score_reset[3:0]};
    assign char_line_score_reset_nxt = y1_score_reset[7:0];

always@ * begin
    if((hcount_delay >= SCORE_RESET_X_POS_RECT) && (vcount_delay >= SCORE_RESET_Y_POS_RECT) && (hcount_delay < SCORE_RESET_X_POS_RECT + SCORE_RESET_WIDTH_RECT) && (vcount_delay < SCORE_RESET_Y_POS_RECT + SCORE_RESET_LENGTH_RECT)) begin
        if(char_pixels_score_reset[6'd32 - x1_score_reset[5:0]]) begin
            if(game_over)
                rgb_nxt = GAME_OVER_COLOR_SCORE_RESET;
            else if(victory)
                rgb_nxt = YOU_WIN_COLOR_SCORE_RESET;         
            else
                rgb_nxt = rgb_out_d;
        end 
        else
        rgb_nxt = rgb_out_d;
    end 
    else
    rgb_nxt = rgb_out_d;
end    

endmodule
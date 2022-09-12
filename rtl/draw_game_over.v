`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 02.08.2022 15:43:49
// Design Name: 
// Module Name: draw_game_over
// Project Name: Entliczek pentliczek
// Target Devices: 
// Tool Versions: 
// Description: Rysowanie napisu GAME OVER
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
    input wire [63:0] char_pixels_game_over,
    input wire game_over,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output reg [7:0] char_yx_game_over,
    output reg [7:0] char_line_game_over
);

    localparam 
        GAME_OVER_X_POS_RECT = 224,
        GAME_OVER_Y_POS_RECT = 208,
        GAME_OVER_WIDTH_RECT = 576,
        GAME_OVER_LENGTH_RECT = 64,
        GAME_OVER_COLOR_RECT = 12'hf_c_b,
        GAME_OVER_COLOR_LETTER = 12'hf_8_7;
        
    reg [11:0] rgb_nxt;
    wire [11:0] rgb_out_d;
    
    wire [10:0] hcount_delay, vcount_delay;
    wire hsync_delay, hblnk_delay, vsync_delay, vblnk_delay;
    
    wire [10:0] y_game_over, x_game_over, x1_game_over,y1_game_over;
    wire game_over_con_1, game_over_con_2;
    
    wire [7:0] char_yx_game_over_nxt, char_line_game_over_nxt, char_line_game_over_nxt_d;
            
always @(posedge pclk) begin
    if(rst) begin
        hcount_out <= 0;
        hsync_out <= 0;
        hblnk_out <= 0; 
        vcount_out <= 0;
        vsync_out <= 0;
        vblnk_out <= 0;
        rgb_out <= 0;
		char_line_game_over <= 0;
		char_yx_game_over <=0;
    end
    else begin
        hcount_out <= hcount_delay;
        hsync_out <= hsync_delay;
        hblnk_out <= hblnk_delay; 
        vcount_out <= vcount_delay;
        vsync_out <= vsync_delay;
        vblnk_out <= vblnk_delay;
        rgb_out <= rgb_nxt;
		char_line_game_over <= char_line_game_over_nxt_d;
		char_yx_game_over <= char_yx_game_over_nxt;
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
        .din (char_line_game_over_nxt),
        .dout (char_line_game_over_nxt_d)
    );
	

    assign y_game_over = ((vcount_in - GAME_OVER_Y_POS_RECT)>>6);
    assign x_game_over = ((hcount_in - GAME_OVER_X_POS_RECT)>>6);
    assign x1_game_over = ((hcount_delay - GAME_OVER_X_POS_RECT)%64);
    assign y1_game_over = ((vcount_delay - GAME_OVER_Y_POS_RECT)%64);
    assign char_yx_game_over_nxt = {(y_game_over[3:0]), x_game_over[3:0]};
    assign char_line_game_over_nxt = y1_game_over[7:0];
    
    assign game_over_con_1 = ((hcount_delay >= GAME_OVER_X_POS_RECT) && (vcount_delay >= GAME_OVER_Y_POS_RECT) && (hcount_delay < GAME_OVER_X_POS_RECT + GAME_OVER_WIDTH_RECT) && (vcount_delay < GAME_OVER_Y_POS_RECT + GAME_OVER_LENGTH_RECT));
    assign game_over_con_2 = (char_pixels_game_over[7'd64 - x1_game_over[6:0]]);
    
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
        else  rgb_nxt = rgb_out_d;  
    end    
end

endmodule
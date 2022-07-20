`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 09:15:06
// Design Name: 
// Module Name: draw_rect
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


module draw_rect_char(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [7:0] char_pixels,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    //output wire [10:0] addr
    output wire [7:0] char_yx,
    output wire [3:0] char_line
    );
    
    reg [11:0] rgb_nxt, rgb_out_d, rgb_out_d1;
    reg [10:0] hcount_delay, vcount_delay, hcount_delay1, vcount_delay1;
    reg hsync_delay, hblnk_delay, vsync_delay, vblnk_delay, hsync_delay1, hblnk_delay1, vsync_delay1, vblnk_delay1;
    //wire [5:0] addry, addrx;
    wire [10:0] y, x, x1;
    
    localparam X_POS_RECT = 100;
    localparam Y_POS_RECT = 100;
    localparam WIDTH_RECT = 'd128;
    localparam LENGTH_RECT = 'd48;
    localparam COLOR_RECT = 12'hf_f_f;
    localparam COLOR_LETTER = 12'hf_0_0;


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

    always@ * begin
      if((hcount_delay1 >= X_POS_RECT) && (vcount_delay1 >= Y_POS_RECT) && (hcount_delay1 < X_POS_RECT + WIDTH_RECT) && (vcount_delay1 < Y_POS_RECT + LENGTH_RECT)) begin
        if(char_pixels[4'b1000 - x1[2:0]])
                
                rgb_nxt = COLOR_LETTER;         
            else
                rgb_nxt = COLOR_RECT;
       end
            else
                    rgb_nxt = rgb_out_d1;
    end
   
   // assign addr = {hcount_in[9:3], vcount_in[3:0]};
    assign y = (vcount_in - Y_POS_RECT);
    assign x = (hcount_in - X_POS_RECT);
    assign x1 = (hcount_delay - X_POS_RECT);
    assign char_yx = {y[7:4], x[6:3]};
    assign char_line = y[3:0];
    
    
endmodule

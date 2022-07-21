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


module draw_rect(
    input wire [11:0] xpos,
    input wire [11:0] ypos,
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [11:0] rgb_pixel,
    input wire rst,
    input wire pclk,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out,
    output wire [11:0] pixel_addr
    );
    
    reg [11:0] rgb_nxt, rgb_out_d, rgb_out_d1;
    reg [10:0] hcount_delay, vcount_delay, hcount_delay1, vcount_delay1;
    reg hsync_delay, hblnk_delay, vsync_delay, vblnk_delay, hsync_delay1, hblnk_delay1, vsync_delay1, vblnk_delay1;
    wire [5:0] addry, addrx;
    
    //localparam X_POS_RECT = 0;
    //localparam Y_POS_RECT = 0;
    localparam WIDTH_RECT = 'd48;
    localparam LENGTH_RECT = 'd64;
    //localparam COLOR_RECT = 12'h4_4_4;
    
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
        if((hcount_delay1 >= xpos) && (vcount_delay1 >= ypos) && (hcount_delay1 < xpos + WIDTH_RECT) && (vcount_delay1 < ypos + LENGTH_RECT)) 
            rgb_nxt = rgb_pixel;
        else
            rgb_nxt = rgb_out_d1;
    end
    
    assign addry = (vcount_delay - ypos);
    assign addrx = (hcount_delay - xpos);
    assign pixel_addr = {addry[5:0], addrx[5:0]};
    
endmodule

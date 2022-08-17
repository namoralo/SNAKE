`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2022 16:52:11
// Design Name: 
// Module Name: draw_snake
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


module draw_snake(
    input wire [10:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [10:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] rgb_in,
    input wire [6:0] head_x,
    input wire [5:0] head_y,
    input wire [104:0] tail_x,
    input wire [89:0]  tail_y, 
    input wire [9:0] grid_size,
    input wire [3:0] score,
    input wire clk,
    input wire reset,
    output reg [10:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [10:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] rgb_out   
    );
    
   localparam
       HEAD_COLOUR = 12'h5_c_0,
       TAIL_COLOUR = 12'h5_d_1;
    
   reg [11:0] rgb_nxt;
    
 always @(posedge clk or posedge reset) begin
        if(reset) begin
            hcount_out <= 0;
            hsync_out <= 0;
            hblnk_out <= 0;
            vcount_out <= 0;
            vsync_out <= 0;
            vblnk_out <= 0;
            rgb_out <= 0;
        end
        else begin
            hcount_out <= hcount_in;
            hsync_out <= hsync_in;
            hblnk_out <= hblnk_in;
            vcount_out <= vcount_in;
            vsync_out <= vsync_in;
            vblnk_out <= vblnk_in;
            rgb_out <= rgb_nxt;
        end        
    end


always@* begin
    if((hcount_in >= head_x*grid_size) && (hcount_in < ((head_x + 1)*grid_size)) && (vcount_in >= head_y*grid_size) && (vcount_in < ((head_y + 1)*grid_size)))
        rgb_nxt = HEAD_COLOUR;
    else if( (score >= 1) && (hcount_in >= (tail_x[6:0])*grid_size) && (hcount_in < ((tail_x[6:0] + 1)*grid_size)) && (vcount_in >= (tail_y[5:0])*grid_size) && (vcount_in < ((tail_y[5:0] + 1)*grid_size)))
       rgb_nxt = TAIL_COLOUR; 
    else if( (score >= 2) && (hcount_in >= (tail_x[13:7])*grid_size) && (hcount_in < ((tail_x[13:7] + 1)*grid_size)) && (vcount_in >= (tail_y[11:6])*grid_size) && (vcount_in < ((tail_y[11:6] + 1)*grid_size)))
        rgb_nxt = TAIL_COLOUR + 1;
    else if( (score >= 3) && (hcount_in >= (tail_x[20:14])*grid_size) && (hcount_in < ((tail_x[20:14] + 1)*grid_size)) && (vcount_in >= (tail_y[17:12])*grid_size) && (vcount_in < ((tail_y[17:12] + 1)*grid_size)))
        rgb_nxt = TAIL_COLOUR + 2; 
    else if( (score >= 4) && (hcount_in >= (tail_x[27:21])*grid_size) && (hcount_in < ((tail_x[27:21] + 1)*grid_size)) && (vcount_in >= (tail_y[23:18])*grid_size) && (vcount_in < ((tail_y[23:18] + 1)*grid_size)))
        rgb_nxt = TAIL_COLOUR + 3;
    else if( (score >= 5) && (hcount_in >= (tail_x[34:28])*grid_size) && (hcount_in < ((tail_x[34:28] + 1)*grid_size)) && (vcount_in >= (tail_y[29:24])*grid_size) && (vcount_in < ((tail_y[29:24] + 1)*grid_size)))
        rgb_nxt = TAIL_COLOUR + 4;
    else if( (score >= 6) && (hcount_in >= (tail_x[41:35])*grid_size) && (hcount_in < ((tail_x[41:35] + 1)*grid_size)) && (vcount_in >= (tail_y[35:30])*grid_size) && (vcount_in < ((tail_y[35:30] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 5;
    else if( (score >= 7) && (hcount_in >= (tail_x[48:42])*grid_size) && (hcount_in < ((tail_x[48:42] + 1)*grid_size)) && (vcount_in >= (tail_y[41:36])*grid_size) && (vcount_in < ((tail_y[41:36] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 6;
    else if( (score >= 8) && (hcount_in >= (tail_x[55:49])*grid_size) && (hcount_in < ((tail_x[55:49] + 1)*grid_size)) && (vcount_in >= (tail_y[47:42])*grid_size) && (vcount_in < ((tail_y[47:42] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 7;
    else if( (score >= 9) && (hcount_in >= (tail_x[62:56])*grid_size) && (hcount_in < ((tail_x[62:56] + 1)*grid_size)) && (vcount_in >= (tail_y[53:48])*grid_size) && (vcount_in < ((tail_y[53:48] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 8;
    else if( (score >= 10) && (hcount_in >= (tail_x[69:63])*grid_size) && (hcount_in < ((tail_x[69:63] + 1)*grid_size)) && (vcount_in >= (tail_y[59:54])*grid_size) && (vcount_in < ((tail_y[59:54] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 9;
    else if( (score >= 11) && (hcount_in >= (tail_x[76:70])*grid_size) && (hcount_in < ((tail_x[76:70] + 1)*grid_size)) && (vcount_in >= (tail_y[65:60])*grid_size) && (vcount_in < ((tail_y[65:60] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 10;
    else if( (score >= 12) && (hcount_in >= (tail_x[83:77])*grid_size) && (hcount_in < ((tail_x[83:77] + 1)*grid_size)) && (vcount_in >= (tail_y[71:66])*grid_size) && (vcount_in < ((tail_y[71:66] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 11;                
    else if( (score >= 13) && (hcount_in >= (tail_x[90:84])*grid_size) && (hcount_in < ((tail_x[90:84] + 1)*grid_size)) && (vcount_in >= (tail_y[77:72])*grid_size) && (vcount_in < ((tail_y[77:72] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 12;
    else if( (score >= 14) && (hcount_in >= (tail_x[97:91])*grid_size) && (hcount_in < ((tail_x[97:91] + 1)*grid_size)) && (vcount_in >= (tail_y[83:78])*grid_size) && (vcount_in < ((tail_y[83:78] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 13;
    else if( (score >= 15) && (hcount_in >= (tail_x[104:98])*grid_size) && (hcount_in < ((tail_x[104:98] + 1)*grid_size)) && (vcount_in >= (tail_y[89:84])*grid_size) && (vcount_in < ((tail_y[89:84] + 1)*grid_size)))
         rgb_nxt = TAIL_COLOUR + 14;
    else
        rgb_nxt = rgb_in;
end
endmodule

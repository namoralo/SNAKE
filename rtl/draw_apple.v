`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2022 15:02:58
// Design Name: 
// Module Name: draw_apple
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


module draw_apple(
   input wire [10:0] hcount_in,
   input wire hsync_in,
   input wire hblnk_in,
   input wire [10:0] vcount_in,
   input wire vsync_in,
   input wire vblnk_in,
   input wire [11:0] rgb_in,
   input wire [6:0] apple_x,
   input wire [5:0] apple_y,
   input wire [9:0] grid_size,
   input wire rst,
   input wire pclk,
   output reg [10:0] hcount_out,
   output reg hsync_out,
   output reg hblnk_out,
   output reg [10:0] vcount_out,
   output reg vsync_out,
   output reg vblnk_out,
   output reg [11:0] rgb_out
   );
   
   reg [11:0] rgb_nxt;
   
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
               hcount_out <= hcount_in;
               hsync_out <= hsync_in;
               hblnk_out <= hblnk_in;
               vcount_out <= vcount_in;
               vsync_out <= vsync_in;
               vblnk_out <= vblnk_in;
               rgb_out <= rgb_nxt;
           end        
       end

always @* begin 
    if((hcount_in >= (apple_x-1)*grid_size) && (hcount_in < ((apple_x-1)*grid_size + grid_size)) && (vcount_in >= (apple_y-1)*grid_size) && (vcount_in < ((apple_y-1)*grid_size + grid_size)))
        rgb_nxt = 12'hf_0_0; 
    else
        rgb_nxt = rgb_in; 
end


endmodule

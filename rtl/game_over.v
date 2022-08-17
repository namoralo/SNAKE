`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2022 00:25:21
// Design Name: 
// Module Name: game_over
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


module game_over(
    input wire clk,
    input wire reset,
    //input wire [10:0] hcount_in,
    //input wire hsync_in,
    //input wire hblnk_in,
    //input wire [10:0] vcount_in,
    //input wire vsync_in,
    //input wire vblnk_in,
    //input wire [11:0] rgb_in,
    input wire [6:0] frame_x_inside_grid,
    input wire [5:0] frame_y_inside_grid,
    input wire [6:0] frame_x_outside_grid,
    input wire [5:0] frame_y_outside_grid,
    input wire [6:0] number_x_grid,
    input wire [5:0] number_y_grid,
    input wire [6:0] head_x,
    input wire [5:0] head_y,
    input wire [104:0] tail_x,
    input wire [89:0]  tail_y,
    input wire [3:0] score,
    //output reg [10:0] hcount_out,
    //output reg hsync_out,
    //output reg hblnk_out,
    //output reg [10:0] vcount_out,
    //output reg vsync_out,
    //output reg vblnk_out,
    //output reg [11:0] rgb_out,
    output reg game_over, victory
);
 
 //reg [11:0] rgb_nxt;
 reg game_over_nxt, victory_nxt;
 wire frame, body;
 
 assign frame = ((score < 15) && ((head_x == frame_x_outside_grid) || (head_x == (number_x_grid - frame_x_inside_grid)) || (head_y == frame_y_outside_grid) || (head_y == (number_y_grid - frame_y_inside_grid))));
 assign body = ((score < 15) &&
     (((score >= 1) && (head_x == tail_x[6:0]) && (head_y == tail_y[5:0])) 
     ||
     ((score >= 2) && (head_x == tail_x[13:7]) && (head_y == tail_y[11:6])) 
     ||
     ((score >= 3) && (head_x == tail_x[20:14]) && (head_y == tail_y[17:12]))
         ||
     ((score >= 4) && (head_x == tail_x[27:21]) && (head_y == tail_y[23:18]))
         ||
     ((score >= 5) && (head_x == tail_x[34:28]) && (head_y == tail_y[29:24]))
         ||
     ((score >= 6) && (head_x == tail_x[41:35]) && (head_y == tail_y[35:30]))
          ||
     ((score >= 7) && (head_x == tail_x[48:42]) && (head_y == tail_y[41:36]))
          ||
     ((score >= 8) && (head_x == tail_x[55:49]) && (head_y == tail_y[47:42]))
          ||
     ((score >= 9) && (head_x == tail_x[62:56]) && (head_y == tail_y[53:48]))
          ||
     ((score >= 10) && (head_x == tail_x[69:63]) && (head_y == tail_y[59:54]))
          ||
     ((score >= 11) && (head_x == tail_x[76:70]) && (head_y == tail_y[65:60]))
          ||
     ((score >= 12) && (head_x == tail_x[83:77]) && (head_y == tail_y[71:66]))
          ||                
     ((score >= 13) && (head_x == tail_x[90:84]) && (head_y == tail_y[77:72]))
          ||
     ((score >= 14) && (head_x == tail_x[97:91]) && (head_y == tail_y[83:78])))
         // ||
    // ((score >= 15) && (head_x == tail_x[104:98]) && (head_y == tail_y[89:84]))
     );
 
always @(posedge clk or posedge reset) begin
    if(reset) begin
    /*    hcount_out <= 0;
        hsync_out <= 0;
        hblnk_out <= 0;
        vcount_out <= 0;
        vsync_out <= 0;
        vblnk_out <= 0;
        rgb_out <= 0;*/
        game_over <= 0;
        victory <= 0;
    end
    else begin
       /* hcount_out <= hcount_in;
        hsync_out <= hsync_in;
        hblnk_out <= hblnk_in;
        vcount_out <= vcount_in;
        vsync_out <= vsync_in;
        vblnk_out <= vblnk_in;
        rgb_out <= rgb_nxt;*/
        game_over <= game_over_nxt;
        victory <= victory_nxt;
    end        
end

    always @* begin
     /*  if (vblnk_in || hblnk_in) begin
          //rgb_nxt = 12'h0_0_0; 
           game_over_nxt = game_over;
           victory_nxt = victory;
       end
        else begin*/
            if(frame || body) begin
                game_over_nxt = 1;
                victory_nxt = victory;
            //    rgb_nxt = 12'hf_c_b;
            end
            else if(score == 15) begin
                game_over_nxt = game_over;
                victory_nxt = 1;
              //  rgb_nxt = 12'hb_d_f;
            end
            else begin
                //rgb_nxt = rgb_in;
                game_over_nxt = game_over;
                victory_nxt = victory;
            end  
        end            
    //end

endmodule

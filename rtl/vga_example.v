// File: vga_example.v
// This is the top level design for EE178 Lab #4.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module vga_example (
  input wire clk,
  input wire rst,
  input wire [3:0] btn,
  output wire vs,
  output wire hs,
  output wire [3:0] r,
  output wire [3:0] g,
  output wire [3:0] b,
  output wire pclk_mirror
 // inout wire ps2_clk,
  //inout wire ps2_data
  );

  // Converts 100 MHz clk into 65 MHz pclk.

  wire locked;
  wire pclk, mclk, rst_locked;

  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)


  clk_wiz_0 my_clk_wiz_0
  (
  // Clock out ports  
  .clk100MHz(),
  .clk65MHz(pclk),
  // Status and control signals               
  .reset(rst), 
  .locked(locked),
 // Clock in ports
  .clk(clk)
  );
  
  reset_locked my_reset_locked(
  
      .locked(locked),
      .pclk(pclk),
      .rst_locked(rst_locked)
      );
  
  ODDR pclk_oddr (
    .Q(pclk_mirror),
    .C(pclk),
    .CE(1'b1),
    .D1(1'b1),
    .D2(1'b0),
    .R(1'b0),
    .S(1'b0)
  );

  // Instantiate the vga_timing module, which is
  // the module you are designing for this lab.

    wire [10:0] vcount, hcount;
    wire vsync, hsync;
    wire vblnk, hblnk;
    
    wire [10:0] vcount_out_db, hcount_out_db;
    wire vsync_out_db, hsync_out_db;
    wire vblnk_out_db, hblnk_out_db;
    wire [11:0] rgb_out_db;
    
    wire [10:0] vcount_out_da, hcount_out_da;
    wire vsync_out_da, hsync_out_da;
    wire vblnk_out_da, hblnk_out_da;
    wire [11:0] rgb_out_da;

    
    wire vsync_out_v, hsync_out_v;

    wire [10:0] vcount_out_ds, hcount_out_ds;
    wire vsync_out_ds, hsync_out_ds;
    wire vblnk_out_ds, hblnk_out_ds;
    wire [11:0] rgb_out_ds;
    
    wire [10:0] vcount_out_dgo, hcount_out_dgo;
    wire vsync_out_dgo, hsync_out_dgo;
    wire vblnk_out_dgo, hblnk_out_dgo;
    wire [11:0] rgb_out_dgo;
    
    wire [10:0] vcount_out_dsr, hcount_out_dsr;
    wire vsync_out_dsr, hsync_out_dsr;
    wire vblnk_out_dsr, hblnk_out_dsr;
    wire [11:0] rgb_out_dsr;
    
    wire [79:0] char_line_pixels_game_over;
    wire [7:0] char_yx_game_over;
    wire [7:0] char_line_game_over;
    wire [7:0] char_code_game_over;
    
    wire [79:0] char_line_pixels_you_win;
    wire [7:0] char_yx_you_win;
    wire [7:0] char_line_you_win;
    wire [7:0] char_code_you_win;
    
    wire [39:0] char_line_pixels_score_reset;
    wire [7:0] char_yx_score_reset;
    wire [7:0] char_line_score_reset;
    wire [7:0] char_code_score_reset; 
    
    wire [9:0] hor_pix;
    wire [9:0] ver_pix;
    wire [6:0] frame_x_inside_grid;
    wire [5:0] frame_y_inside_grid;
    wire [6:0] frame_x_outside_grid;
    wire [5:0] frame_y_outside_grid;
    wire [9:0] frame_x_inside_px;
    wire [9:0] frame_y_inside_px;
    wire [6:0] number_x_grid;
    wire [5:0] number_y_grid;
    wire [6:0] frame_x_size_grid;
    wire [5:0] frame_y_size_grid;
    wire [9:0] frame_x_outside_px;
    wire [9:0] frame_y_outside_px; 
    wire [6:0] x_start_grid;
    wire [5:0] y_start_grid ;
    
    wire [6:0] apple_x;
    wire [5:0] apple_y;   
    wire [6:0] head_x;
    wire [5:0] head_y;
    wire [104:0] tail_x;
    wire [89:0]  tail_y;
    
    wire [9:0] grid_size;
    wire [3:0] score;
    wire [4:0] direction;
    wire game_over, victory;
    
//////////////////////////////////////  
  
    vga_timing my_timing (
        .vcount(vcount),
        .vsync(vsync),
        .vblnk(vblnk),
        .hcount(hcount),
        .hsync(hsync),
        .hblnk(hblnk),
        .pclk(pclk),
        .rst(rst_locked)
    );

    draw_background my_draw_background(
        .hcount_in(hcount),
        .hsync_in(hsync),
        .hblnk_in(hblnk),
        .vcount_in(vcount),
        .vsync_in(vsync),
        .vblnk_in(vblnk),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_out_db),
        .hsync_out(hsync_out_db),
        .hblnk_out(hblnk_out_db),
        .vcount_out(vcount_out_db),
        .vsync_out(vsync_out_db),
        .vblnk_out(vblnk_out_db),
        .rgb_out(rgb_out_db),
        .hor_pix(hor_pix),
        .ver_pix(ver_pix),
        .frame_x_size_grid(frame_x_size_grid),
        .frame_y_size_grid(frame_y_size_grid),
        .frame_x_inside_px(frame_x_inside_px),
        .frame_y_inside_px(frame_y_inside_px),
        .frame_x_outside_px(frame_x_outside_px),
        .frame_y_outside_px(frame_y_outside_px),
        .frame_x_inside_grid(frame_x_inside_grid),
        .frame_y_inside_grid(frame_y_inside_grid),
        .frame_x_outside_grid(frame_x_outside_grid),
        .frame_y_outside_grid(frame_y_outside_grid),
        .number_x_grid(number_x_grid),
        .number_y_grid(number_y_grid),
        .grid_size(grid_size)
    );
    
    random_coordinates my_random_coordinates(
        .clk(pclk),
        .reset(rst_locked),
        .frame_x_inside_grid(frame_x_inside_grid),
        .frame_y_inside_grid(frame_y_inside_grid),
        .number_x_grid(number_x_grid),
        .number_y_grid(number_y_grid),
        .x_start_grid(x_start_grid),
        .y_start_grid(y_start_grid)
    );
    
    decoder my_decoder(
        .clk(pclk),
        .reset(rst_locked),
        .button(btn),
        .direction(direction)
        );
    
    move my_move(
        .clk(pclk),
        .reset(rst_locked),
        .direction(direction),
        .head_x(head_x),
        .head_y(head_y),
        .tail_x(tail_x),
        .tail_y(tail_y)
    );
    
    apple my_apple(
        .clk(pclk),
        .reset(rst_locked),
        .x_start_grid(x_start_grid),
        .y_start_grid(y_start_grid),
        .grid_size(grid_size),
        .head_x(head_x),
        .head_y(head_y),
        .apple_x(apple_x),
        .apple_y(apple_y),
        .score(score)
    );
    
    draw_snake my_draw_snake(
        .hcount_in(hcount_out_db),
        .hsync_in(hsync_out_db),
        .hblnk_in(hblnk_out_db),
        .vcount_in(vcount_out_db),
        .vsync_in(vsync_out_db),
        .vblnk_in(vblnk_out_db),
        .rgb_in(rgb_out_db),
        .head_x(head_x),
        .head_y(head_y),
        .tail_x(tail_x),
        .tail_y(tail_y), 
        .grid_size(grid_size),
        .score(score),
        .clk(pclk),
        .reset(rst_locked),
        .hcount_out(hcount_out_ds),
        .hsync_out(hsync_out_ds),
        .hblnk_out(hblnk_out_ds),
        .vcount_out(vcount_out_ds),
        .vsync_out(vsync_out_ds),
        .vblnk_out(vblnk_out_ds),
        .rgb_out(rgb_out_ds)   
    );
    
    draw_apple my_draw_apple(
        .hcount_in(hcount_out_ds),
        .hsync_in(hsync_out_ds),
        .hblnk_in(hblnk_out_ds),
        .vcount_in(vcount_out_ds),
        .vsync_in(vsync_out_ds),
        .vblnk_in(vblnk_out_ds),
        .rgb_in(rgb_out_ds),
        .apple_x(apple_x),
        .apple_y(apple_y),
        .grid_size(grid_size),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_out_da),
        .hsync_out(hsync_out_da),
        .hblnk_out(hblnk_out_da),
        .vcount_out(vcount_out_da),
        .vsync_out(vsync_out_da),
        .vblnk_out(vblnk_out_da),
        .rgb_out(rgb_out_da)
    );
       
    game_over my_game_over(
        .clk(pclk),
        .reset(rst_locked),
        .frame_x_inside_grid(frame_x_inside_grid),
        .frame_y_inside_grid(frame_y_inside_grid),
        .frame_x_outside_grid(frame_x_outside_grid),
        .frame_y_outside_grid(frame_y_outside_grid),
        .number_x_grid(number_x_grid),
        .number_y_grid(number_y_grid),
        .head_x(head_x),
        .head_y(head_y),
        .tail_x(tail_x),
        .tail_y(tail_y),
        .score(score),
        .game_over(game_over),
        .victory(victory)
    );
    
    draw_game_over my_draw_game_over(
        .hcount_in(hcount_out_da),
        .hsync_in(hsync_out_da),
        .hblnk_in(hblnk_out_da),
        .vcount_in(vcount_out_da),
        .vsync_in(vsync_out_da),
        .vblnk_in(vblnk_out_da),
        .rgb_in(rgb_out_da),
        .char_pixels_game_over(char_line_pixels_game_over),
        .char_pixels_you_win(char_line_pixels_you_win),
       // .char_pixels_score_reset(char_line_pixels_score_reset),
        .game_over(game_over),
        .victory(victory),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_out_dgo),
        .hsync_out(hsync_out_dgo),
        .hblnk_out(hblnk_out_dgo),
        .vcount_out(vcount_out_dgo),
        .vsync_out(vsync_out_dgo),
        .vblnk_out(vblnk_out_dgo),
        .rgb_out(rgb_out_dgo),
        .char_yx_game_over(char_yx_game_over),
        .char_line_game_over(char_line_game_over),
        .char_yx_you_win(char_yx_you_win),
        .char_line_you_win(char_line_you_win)
       // .char_yx_score_reset(char_yx_score_reset),
        //.char_line_score_reset(char_line_score_reset)
    );
    
   /* draw_score_reset my_draw_score_reset(
        .hcount_in(hcount_out_dgo),
        .hsync_in(hsync_out_dgo),
        .hblnk_in(hblnk_out_dgo),
        .vcount_in(vcount_out_dgo),
        .vsync_in(vsync_out_dgo),
        .vblnk_in(vblnk_out_dgo),
        .rgb_in(rgb_out_dgo),
    //    input wire [79:0] char_pixels_game_over,
      //  input wire [79:0] char_pixels_you_win,
        .char_pixels_score_reset(char_line_pixels_score_reset),
        .game_over(game_over), 
        .victory(victory),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_out_dsr),
        .hsync_out(hsync_out_dsr),
        .hblnk_out(hblnk_out_dsr),
        .vcount_out(vcount_out_dsr),
        .vsync_out(vsync_out_dsr),
        .vblnk_out(vblnk_out_dsr),
        .rgb_out(rgb_out_dsr),
    //    output wire [7:0] char_yx_game_over,
    //    output wire [7:0] char_line_game_over,
    //    output wire [7:0] char_yx_you_win,
    //    output wire [7:0] char_line_you_win,
        .char_yx_score_reset(char_yx_score_reset),
        .char_line_score_reset(char_line_score_reset)
        );
    */
    
    arcade_big_font my_arcade_big_font_game_over(
        .clk(pclk),
        .addr({char_code_game_over,char_line_game_over}),
        .char_line_pixels(char_line_pixels_game_over)
    );
    
    arcade_big_font my_arcade_big_font_you_win(
        .clk(pclk),
        .addr({char_code_you_win,char_line_you_win}),
        .char_line_pixels(char_line_pixels_you_win)
    );
    
   /* arcade_small_font my_arcade_small_font(
        .clk(pclk),
        .addr({char_code_score_reset,char_line_score_reset}),
        .char_line_pixels(char_line_pixels_score_reset)
    );
    */
    
    game_over_writing my_game_over_writing(
                .clk(pclk),
                .char_yx(char_yx_game_over), 
                .char_code(char_code_game_over) 
        );
        
       you_win_writing my_you_win_writing(
        
                    .clk(pclk),
                    .char_yx(char_yx_you_win), 
                    .char_code(char_code_you_win) 
            );
            
   /* score_reset_writing my_score_reset_writing(
        .clk(pclk),
        .char_yx(char_yx_score_reset), 
        .char_code(char_code_score_reset) 
    );
    */
    
    /* vga my_vga(
    .hsync_in(hsync_out_df),
    .vsync_in(vsync_out_df),
    .rst(rst_locked),
    .pclk(pclk),
    .hsync_out(hsync_out_v),
    .vsync_out(vsync_out_v)
    );
    */
    
    assign hs = hsync_out_dgo;
    assign vs = vsync_out_dgo;
    assign r = rgb_out_dgo[11:8];//red_out_md;
    assign g = rgb_out_dgo[7:4]; //green_out_md;
    assign b = rgb_out_dgo[3:0]; //blue_out_md;
    
    
    /*
        assign hs = hsync_out_da;
        assign vs = vsync_out_da;
        assign r = rgb_out_da[11:8];//red_out_md;
        assign g = rgb_out_da[7:4]; //green_out_md;
        assign b = rgb_out_da[3:0]; //blue_out_md;
      */  
endmodule

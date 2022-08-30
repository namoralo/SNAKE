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
  input wire PS2Clk,
  input wire PS2Data,
  output wire vs,
  output wire hs,
  output wire [3:0] r,
  output wire [3:0] g,
  output wire [3:0] b,
  //output wire tx,
  output wire pclk_mirror

  );

  // Converts 100 MHz clk into 65 MHz pclk.

  wire locked;
  wire pclk,kclk, rst_locked;

  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)


  clk_wiz_0 my_clk_wiz_0
  (
  // Clock out ports  
  .clk100MHz(kclk),
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
    
    wire [10:0] vcount_db, hcount_db;
    wire vsync_db, hsync_db;
    wire vblnk_db, hblnk_db;
    wire [11:0] rgb_db;
    
    wire [10:0] vcount_da, hcount_da;
    wire vsync_da, hsync_da;
    wire vblnk_da, hblnk_da;
    wire [11:0] rgb_da;

    wire [10:0] vcount_ds, hcount_ds;
    wire vsync_ds, hsync_ds;
    wire vblnk_ds, hblnk_ds;
    wire [11:0] rgb_ds;
    
    wire [10:0] vcount_dgo, hcount_dgo;
    wire vsync_dgo, hsync_dgo;
    wire vblnk_dgo, hblnk_dgo;
    wire [11:0] rgb_dgo;
    
    wire [10:0] vcount_dyw, hcount_dyw;
    wire vsync_dyw, hsync_dyw;
    wire vblnk_dyw, hblnk_dyw;
    wire [11:0] rgb_dyw;
    
    wire [10:0] vcount_dsc, hcount_dsc;
    wire vsync_dsc, hsync_dsc;
    wire vblnk_dsc, hblnk_dsc;
    wire [11:0] rgb_dsc;
    
    wire [10:0] vcount_dr, hcount_dr;
    wire vsync_dr, hsync_dr;
    wire vblnk_dr, hblnk_dr;
    wire [11:0] rgb_dr;
    
    wire [10:0] vcount_dn, hcount_dn;
    wire vsync_dn, hsync_dn;
    wire vblnk_dn, hblnk_dn;
    wire [11:0] rgb_dn;
    
    wire [79:0] char_line_pixels_game_over;
    wire [7:0] char_yx_game_over;
    wire [7:0] char_line_game_over;
    wire [7:0] char_code_game_over;
    
    wire [79:0] char_line_pixels_you_win;
    wire [7:0] char_yx_you_win;
    wire [7:0] char_line_you_win;
    wire [7:0] char_code_you_win;
    
    wire [39:0] char_line_pixels_score;
    wire [7:0] char_yx_score;
    wire [7:0] char_line_score;
    wire [7:0] char_code_score; 
    
    wire [39:0] char_line_pixels_reset;
    wire [7:0] char_yx_reset;
    wire [7:0] char_line_reset;
    wire [7:0] char_code_reset;
    
    wire [39:0] char_line_pixels_numbers;
    wire [7:0] char_yx_numbers;
    wire [7:0] char_line_numbers;
    wire [7:0] char_code_numbers;
    
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
    wire game_over_dyw, victory_dyw;

    
    wire [15:0] keycode;
    
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
        .hcount_out(hcount_db),
        .hsync_out(hsync_db),
        .hblnk_out(hblnk_db),
        .vcount_out(vcount_db),
        .vsync_out(vsync_db),
        .vblnk_out(vblnk_db),
        .rgb_out(rgb_db),
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
    /*  
    top my_top(
      .clk(kclk),
      .PS2Data(PS2Data),
      .PS2Clk(PS2Clk),
      .tx(tx),
      .keycode_out(keycode)
  );
  */
    PS2Receiver my_PS2Receiver(
        .clk(pclk),
        .kclk(PS2Clk),
        .kdata(PS2Data),
        .keycode(keycode),
        .oflag()
        );
        
    decoder my_decoder(
        .clk(pclk),
        .reset(rst_locked),
        .keycode(keycode),
        //.button(btn),
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
        .hcount_in(hcount_db),
        .hsync_in(hsync_db),
        .hblnk_in(hblnk_db),
        .vcount_in(vcount_db),
        .vsync_in(vsync_db),
        .vblnk_in(vblnk_db),
        .rgb_in(rgb_db),
        .head_x(head_x),
        .head_y(head_y),
        .tail_x(tail_x),
        .tail_y(tail_y), 
        .grid_size(grid_size),
        .score(score),
        .clk(pclk),
        .reset(rst_locked),
        .hcount_out(hcount_ds),
        .hsync_out(hsync_ds),
        .hblnk_out(hblnk_ds),
        .vcount_out(vcount_ds),
        .vsync_out(vsync_ds),
        .vblnk_out(vblnk_ds),
        .rgb_out(rgb_ds)   
    );
    
    draw_apple my_draw_apple(
        .hcount_in(hcount_ds),
        .hsync_in(hsync_ds),
        .hblnk_in(hblnk_ds),
        .vcount_in(vcount_ds),
        .vsync_in(vsync_ds),
        .vblnk_in(vblnk_ds),
        .rgb_in(rgb_ds),
        .apple_x(apple_x),
        .apple_y(apple_y),
        .grid_size(grid_size),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_da),
        .hsync_out(hsync_da),
        .hblnk_out(hblnk_da),
        .vcount_out(vcount_da),
        .vsync_out(vsync_da),
        .vblnk_out(vblnk_da),
        .rgb_out(rgb_da)
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
    
        draw_you_win my_draw_you_win(
        .hcount_in(hcount_da),
        .hsync_in(hsync_da),
        .hblnk_in(hblnk_da),
        .vcount_in(vcount_da),
        .vsync_in(vsync_da),
        .vblnk_in(vblnk_da),
        .rgb_in(rgb_da),
        .game_over_in(game_over),
        .victory_in(victory),
        .char_pixels_you_win(char_line_pixels_you_win),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_dyw),
        .hsync_out(hsync_dyw),
        .hblnk_out(hblnk_dyw),
        .vcount_out(vcount_dyw),
        .vsync_out(vsync_dyw),
        .vblnk_out(vblnk_dyw),
        .rgb_out(rgb_dyw),
        .game_over_out(game_over_dyw),
        .victory_out(victory_dyw),
        .char_yx_you_win(char_yx_you_win),
        .char_line_you_win(char_line_you_win)
    );
    
    draw_game_over my_draw_game_over(
        .hcount_in(hcount_dyw),
        .hsync_in(hsync_dyw),
        .hblnk_in(hblnk_dyw),
        .vcount_in(vcount_dyw),
        .vsync_in(vsync_dyw),
        .vblnk_in(vblnk_dyw),
        .rgb_in(rgb_dyw),
        .game_over(game_over_dyw),
        .victory(victory_dyw),
        .char_pixels_game_over(char_line_pixels_game_over),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_dgo),
        .hsync_out(hsync_dgo),
        .hblnk_out(hblnk_dgo),
        .vcount_out(vcount_dgo),
        .vsync_out(vsync_dgo),
        .vblnk_out(vblnk_dgo),
        .rgb_out(rgb_dgo),
        .char_yx_game_over(char_yx_game_over),
        .char_line_game_over(char_line_game_over)
    );
   /* 
    draw_score_reset my_draw_score_reset(
        .hcount_in(hcount_out_dgo),
        .hsync_in(hsync_out_dgo),
        .hblnk_in(hblnk_out_dgo),
        .vcount_in(vcount_out_dgo),
        .vsync_in(vsync_out_dgo),
        .vblnk_in(vblnk_out_dgo),
        .rgb_in(rgb_out_dgo),
        .char_pixels_score_reset(char_line_pixels_score_reset),
        .game_over_in(game_over), 
        .victory_in(victory),
        .rst(rst_locked),
        .pclk(pclk),
        .hcount_out(hcount_out_dsr),
        .hsync_out(hsync_out_dsr),
        .hblnk_out(hblnk_out_dsr),
        .vcount_out(vcount_out_dsr),
        .vsync_out(vsync_out_dsr),
        .vblnk_out(vblnk_out_dsr),
        .rgb_out(rgb_out_dsr),
        .game_over_out(), 
        .victory_out(),
        .char_yx_score_reset(char_yx_score_reset),
        .char_line_score_reset(char_line_score_reset)
        );
   */
   draw_score_reset #(
           .SCORE_RESET_X_POS_RECT(232),
           .SCORE_RESET_Y_POS_RECT(380),
           .SCORE_RESET_WIDTH_RECT(560),
           .SCORE_RESET_LENGTH_RECT(40)
   ) my_draw_score(
           .hcount_in(hcount_dgo),
           .hsync_in(hsync_dgo),
           .hblnk_in(hblnk_dgo),
           .vcount_in(vcount_dgo),
           .vsync_in(vsync_dgo),
           .vblnk_in(vblnk_dgo),
           .rgb_in(rgb_dgo),
           .char_pixels_score_reset(char_line_pixels_score),
           .game_over(game_over), 
           .victory(victory),
           .rst(rst_locked),
           .pclk(pclk),
           .hcount_out(hcount_dsc),
           .hsync_out(hsync_dsc),
           .hblnk_out(hblnk_dsc),
           .vcount_out(vcount_dsc),
           .vsync_out(vsync_dsc),
           .vblnk_out(vblnk_dsc),
           .rgb_out(rgb_dsc),
           .char_yx_score_reset(char_yx_score),
           .char_line_score_reset(char_line_score)
           );
      
    draw_score_reset #(
                      .SCORE_RESET_X_POS_RECT(472),
                      .SCORE_RESET_Y_POS_RECT(460),
                      .SCORE_RESET_WIDTH_RECT(80),
                      .SCORE_RESET_LENGTH_RECT(40)
              ) my_draw_numbers(
                .hcount_in(hcount_dsc),
                .hsync_in(hsync_dsc),
                .hblnk_in(hblnk_dsc),
                .vcount_in(vcount_dsc),
                .vsync_in(vsync_dsc),
                .vblnk_in(vblnk_dsc),
                .rgb_in(rgb_dsc),
                .char_pixels_score_reset(char_line_pixels_numbers),
                .game_over(game_over), 
                .victory(victory),
                .rst(rst_locked),
                .pclk(pclk),
                .hcount_out(hcount_dn),
                .hsync_out(hsync_dn),
                .hblnk_out(hblnk_dn),
                .vcount_out(vcount_dn),
                .vsync_out(vsync_dn),
                .vblnk_out(vblnk_dn),
                .rgb_out(rgb_dn),
                .char_yx_score_reset(char_yx_numbers),
                .char_line_score_reset(char_line_numbers)
                );

    draw_score_reset #(
                      .SCORE_RESET_X_POS_RECT(232),
                      .SCORE_RESET_Y_POS_RECT(580),
                      .SCORE_RESET_WIDTH_RECT(560),
                      .SCORE_RESET_LENGTH_RECT(80)
              ) my_draw_reset(
                .hcount_in(hcount_dn),
                .hsync_in(hsync_dn),
                .hblnk_in(hblnk_dn),
                .vcount_in(vcount_dn),
                .vsync_in(vsync_dn),
                .vblnk_in(vblnk_dn),
                .rgb_in(rgb_dn),
                .char_pixels_score_reset(char_line_pixels_reset),
                .game_over(game_over), 
                .victory(victory),
                .rst(rst_locked),
                .pclk(pclk),
                .hcount_out(hcount_dr),
                .hsync_out(hsync_dr),
                .hblnk_out(hblnk_dr),
                .vcount_out(vcount_dr),
                .vsync_out(vsync_dr),
                .vblnk_out(vblnk_dr),
                .rgb_out(rgb_dr),
                .char_yx_score_reset(char_yx_reset),
                .char_line_score_reset(char_line_reset)
                );           
    
    arcade_game_over_font my_arcade_game_over_font(
        .clk(pclk),
        .addr({char_code_game_over,char_line_game_over}),
        .char_line_pixels(char_line_pixels_game_over)
    );
    
    arcade_you_win_font my_arcade_you_win_font(
        .clk(pclk),
        .addr({char_code_you_win,char_line_you_win}),
        .char_line_pixels(char_line_pixels_you_win)
    );
    
    arcade_small_font my_arcade_small_score_font(
        .clk(pclk),
        .addr({char_code_score,char_line_score}),
        .char_line_pixels(char_line_pixels_score)
    );

    arcade_small_font my_arcade_small_reset_font(
        .clk(pclk),
        .addr({char_code_reset,char_line_reset}),
        .char_line_pixels(char_line_pixels_reset)
    );
    
    arcade_numbers_font my_numbers_font(
            .clk(pclk),
            .addr({char_code_numbers,char_line_numbers}),
            .char_line_pixels(char_line_pixels_numbers)
        );
    
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
            
    score_writing my_score_writing(
        .clk(pclk),
        .char_yx(char_yx_score), 
        .char_code(char_code_score) 
    );

    reset_writing my_reset_writing(
        .clk(pclk),
        .char_yx(char_yx_reset), 
        .char_code(char_code_reset) 
    );
    
    numbers_writing my_numbers_writing(
            .clk(pclk),
            .score(score),
            .char_yx(char_yx_numbers), 
            .char_code(char_code_numbers) 
        );    
    
        assign hs = hsync_dr;
        assign vs = vsync_dr;
        assign r = rgb_dr[11:8];//red_out_md;
        assign g = rgb_dr[7:4]; //green_out_md;
        assign b = rgb_dr[3:0]; //blue_out_md;
        
endmodule

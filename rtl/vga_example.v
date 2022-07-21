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
  output wire vs,
  output wire hs,
  output wire [3:0] r,
  output wire [3:0] g,
  output wire [3:0] b,
  output wire pclk_mirror,
  inout wire ps2_clk,
  inout wire ps2_data
  );

  // Converts 100 MHz clk into 65 MHz pclk.

  wire locked;
  wire pclk, mclk, rst_locked;

  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)


  clk_wiz_0 my_clk_wiz_0
  (
  // Clock out ports  
  .clk100MHz(mclk),
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

  wire [11:0] xpos, ypos;
  
  wire [3:0] red_out_md, green_out_md, blue_out_md;
  wire enable_mouse_display_out;

  wire vsync_out_v, hsync_out_v;
  wire vsync_out_1, hsync_out_1;
  wire [11:0] rgb_out_1, rgb_out_rd;
  
  wire [11:0] rgb_pixel_ir, pixel_addr_ir;
  
  wire [10:0] vcount_out_drc, hcount_out_drc;
  wire vsync_out_drc, hsync_out_drc;
  wire vblnk_out_drc, hblnk_out_drc;
  wire [11:0] rgb_out_drc;
  wire [7:0] char_line_pixels_fr;
  wire [10:0] addr_fr;
  wire [7:0] char_yx_drc;
  wire [3:0] char_line_drc, char_line_buf;
  wire [6:0] char_code;

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
  
      wire [9:0] frame_x_inside_grid;
    wire [9:0] frame_y_inside_grid;
          wire [9:0] frame_x_inside_px;
  wire [9:0] frame_y_inside_px;
     wire [9:0] number_x_grid;
     wire [9:0] number_y_grid;
    wire [9:0] grid_size;
     wire [6:0] x_start_grid;
     wire [5:0] y_start_grid ;   
    
  
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
      .frame_x_inside_px(),
      .frame_y_inside_px(),
      .frame_x_inside_grid(frame_x_inside_grid),
      .frame_y_inside_grid(frame_y_inside_grid),
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
          .grid_size(grid_size),
          .x_start_grid(x_start_grid),
          .y_start_grid(y_start_grid)
      );
      
      draw_apple my_draw_apple(
         .hcount_in(hcount_out_db),
         .hsync_in(hsync_out_db),
         .hblnk_in(hblnk_out_db),
         .vcount_in(vcount_out_db),
         .vsync_in(vsync_out_db),
         .vblnk_in(vblnk_out_db),
         .rgb_in(rgb_out_db),
         .apple_x(x_start_grid),
         .apple_y(y_start_grid),
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
      
/*
  draw_rect my_draw_rect(
    .xpos(xpos),
    .ypos(ypos),
    .hcount_in(hcount_out_db),
    .hsync_in(hsync_out_db),
    .hblnk_in(hblnk_out_db),
    .vcount_in(vcount_out_db),
    .vsync_in(vsync_out_db),
    .vblnk_in(vblnk_out_db),
    .rgb_in(rgb_out_db),
    .rgb_pixel(rgb_pixel_ir),
    .rst(rst_locked),
    .pclk(pclk),
    .hcount_out(hcount_out_dr),
    .hsync_out(hsync_out_dr),
    .hblnk_out(hblnk_out_dr),
    .vcount_out(vcount_out_dr),
    .vsync_out(vsync_out_dr),
    .vblnk_out(vblnk_out_dr),
    .rgb_out(rgb_out_dr),
    .pixel_addr(pixel_addr_ir)
  );
  
    image_rom my_image_rom(
     .clk(pclk),
     .address(pixel_addr_ir),
     .rgb(rgb_pixel_ir)
 );
  */
  MouseCtl my_MouseCtl(
    .clk(mclk),
    .rst(rst_locked),
    .xpos(xpos),
    .ypos(ypos),
    .zpos(),
    .left(),
    .middle(),
    .right(),
    .new_event(),
    .value(),
    .setx(),
    .sety(),
    .setmax_x(),
    .setmax_y(),
    .ps2_clk(ps2_clk),
    .ps2_data(ps2_data)
    
  );
  /*
 draw_rect_char my_draw_rect_char(
     .hcount_in(hcount_out_dr),
     .hsync_in(hsync_out_dr),
     .hblnk_in(hblnk_out_dr),
     .vcount_in(vcount_out_dr),
     .vsync_in(vsync_out_dr),
     .vblnk_in(vblnk_out_dr),
     .rgb_in(rgb_out_dr),
     .char_pixels(char_line_pixels_fr),
     .rst(rst_locked),
     .pclk(pclk),
     .hcount_out(hcount_out_drc),
     .hsync_out(hsync_out_drc),
     .hblnk_out(hblnk_out_drc),
     .vcount_out(vcount_out_drc),
     .vsync_out(vsync_out_drc),
     .vblnk_out(vblnk_out_drc),
     .rgb_out(rgb_out_drc),
     //.addr(addr_fr)
     .char_yx(char_yx_drc),
     .char_line(char_line_drc)//(char_line_buf)
     );
     
  vga_char_line my_vga_char_line(
     
         .char_line_in(char_line_buf),
         .rst(rst_locked),
         .pclk(pclk),
         .char_line_out(char_line_drc)
       
         ); 

  font_rom my_font_rom(
     .clk(pclk),
     .addr({char_code,char_line_drc}),
     .char_line_pixels(char_line_pixels_fr)
 );
 
 char_rom_16x16 my_char_rom_16x16(
     .clk(pclk),
     .char_yx(char_yx_drc),
     .char_code(char_code) 
     );
    */
 MouseDisplay my_MouseDisplay(
     .pixel_clk(pclk),
      .xpos(xpos),
      .ypos(ypos),
      .hcount({1'b0,hcount_out_da}), 
      .vcount({1'b0,vcount_out_da}),
      .blank(hblnk_out_da || vblnk_out_da),
      .red_in(rgb_out_da[11:8]),
      .green_in(rgb_out_da[7:4]),
      .blue_in(rgb_out_da[3:0]),
      .enable_mouse_display_out(enable_mouse_display_out), 
      .red_out(red_out_md),
      .green_out(green_out_md),
      .blue_out(blue_out_md)
);

  vga my_vga(
      .hsync_in(hsync_out_da),
      .vsync_in(vsync_out_da),
      .rst(rst_locked),
      .pclk(pclk),
      .hsync_out(hsync_out_v),
      .vsync_out(vsync_out_v)
   );
     
  assign hs = hsync_out_v;
  assign vs = vsync_out_v;
  assign r = red_out_md;
  assign g = green_out_md;
  assign b = blue_out_md;

endmodule

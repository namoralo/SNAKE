// File: vga_timing.v
// This is the vga timing design for EE178 Lab #4.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module vga_timing (
  output reg [10:0] vcount,
  output reg vsync,
  output reg vblnk,
  output reg [10:0] hcount,
  output reg hsync,
  output reg hblnk,
  input wire pclk,
  input wire rst 
  );
  
  localparam HOR_PIX            = 1024;
  localparam HOR_TOT_TIME       = 1344;
  localparam HOR_FRONT_PORCH    = 24;
  localparam HOR_SYNC_TIME      = 136;
  localparam HOR_BACK_PORCH     = 160;
  
  localparam VER_PIX            = 768;
  localparam VER_TOT_TIME       = 806;
  localparam VER_FRONT_PORCH    = 3;
  localparam VER_SYNC_TIME      = 6;
  localparam VER_BACK_PORCH     = 29;
    
   reg [10:0] vcount_nxt, hcount_nxt;
   reg vsync_nxt, vblnk_nxt, hsync_nxt, hblnk_nxt;
  
   always@(posedge pclk or posedge rst) begin
        if(rst)begin
            hcount <= 10'b0;
            hblnk <= 0;
            hsync <= 0;
            vcount <= 10'b0;
            vblnk <= 0;
            vsync <= 0;
        end

	else begin
            hcount <= hcount_nxt;
            hblnk <= hblnk_nxt;
            hsync <= hsync_nxt;
            vcount <= vcount_nxt;
            vblnk <= vblnk_nxt;
            vsync <= vsync_nxt;
	end
  end

     always @* begin   
        if(hcount == (HOR_TOT_TIME - 1)) begin
             hcount_nxt = 10'b0;
             
             if(vcount == (VER_TOT_TIME - 1))
                  vcount_nxt = 10'b0;
              else
                  vcount_nxt = vcount + 1;
                  
              if( (vcount >= VER_PIX - 1) && (vcount < VER_TOT_TIME - 1) )
                  vblnk_nxt = 1;
              else
                  vblnk_nxt = 0;
                          
              if( (vcount >= (VER_PIX + VER_FRONT_PORCH - 1)) && (vcount < (VER_PIX + VER_FRONT_PORCH + VER_SYNC_TIME - 1) ) )
                  vsync_nxt = 1;                      
              else
                  vsync_nxt = 0; 
         end 
         
         else begin
             hcount_nxt = hcount + 1;
             vcount_nxt = vcount; 
             vblnk_nxt = vblnk;
             vsync_nxt = vsync;
         end
             
         if( (hcount >= HOR_PIX - 1) && (hcount < HOR_TOT_TIME - 1))
             hblnk_nxt = 1;
         else
             hblnk_nxt = 0;  
            
         if( (hcount >= (HOR_PIX + HOR_FRONT_PORCH - 1)) && (hcount < (HOR_PIX + HOR_FRONT_PORCH + HOR_SYNC_TIME - 1)))
             hsync_nxt = 1;
         else
             hsync_nxt = 0;  
     end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2022 14:49:09
// Design Name: 
// Module Name: score_reset_writing
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


module score_reset_writing(
            input  wire        clk,
            input  wire [7:0]  char_yx, 
            output reg  [7:0]  char_code 
    );
    
        // signal declaration
        reg [7:0] data;
    
        // body
        always @(posedge clk)
            char_code <= data;
    
        always @* begin
            case (char_yx)
                8'h00: data = 8'h47; //
                8'h01: data = 8'h00; //
                8'h02: data = 8'h01; //
                8'h03: data = 8'h00; //
                8'h04: data = 8'h01; //
                8'h05: data = 8'h00; //
                8'h06: data = 8'h01; //
                8'h07: data = 8'h00; //
                8'h08: data = 8'h01; //
                8'h09: data = 8'h01; //
                8'h0a: data = 8'h01; //
                8'h0b: data = 8'h00; //
                8'h0c: data = 8'h01; //
                8'h0d: data = 8'h00; //
               
                8'h10: data = 8'h47; //
                8'h11: data = 8'h00; //
                8'h12: data = 8'h01; //
                8'h13: data = 8'h00; //
                8'h14: data = 8'h01; //
                8'h15: data = 8'h00; //
                8'h16: data = 8'h01; //
                8'h17: data = 8'h00; //
                8'h18: data = 8'h01; //
                8'h19: data = 8'h01; //
                8'h1a: data = 8'h01; //
                8'h1b: data = 8'h00; //
                8'h1c: data = 8'h01; //
                8'h1d: data = 8'h00; //
                
                8'h20: data = 8'h47; //
                8'h21: data = 8'h00; //
                8'h22: data = 8'h01; //
                8'h23: data = 8'h00; //
                8'h24: data = 8'h01; //
                8'h25: data = 8'h00; //
                8'h26: data = 8'h01; //
                8'h27: data = 8'h00; //
                8'h28: data = 8'h01; //
                8'h29: data = 8'h01; //
                8'h2a: data = 8'h01; //
                8'h2b: data = 8'h00; //
                8'h2c: data = 8'h01; //
                8'h2d: data = 8'h00; //
                
                8'h30: data = 8'h47; //
                8'h31: data = 8'h00; //
                8'h32: data = 8'h01; //
                8'h33: data = 8'h00; //
                8'h34: data = 8'h01; //
                8'h35: data = 8'h00; //
                8'h36: data = 8'h01; //
                8'h37: data = 8'h00; //
                8'h38: data = 8'h01; //
                8'h39: data = 8'h01; //
                8'h3a: data = 8'h01; //
                8'h3b: data = 8'h00; //
                8'h3c: data = 8'h01; //
                8'h3d: data = 8'h00; //
                
                8'h40: data = 8'h47; //
                8'h41: data = 8'h00; //
                8'h42: data = 8'h01; //
                8'h43: data = 8'h00; //
                8'h44: data = 8'h01; //
                8'h45: data = 8'h00; //
                8'h46: data = 8'h01; //
                8'h47: data = 8'h00; //
                8'h48: data = 8'h01; //
                8'h49: data = 8'h01; //
                8'h4a: data = 8'h01; //
                8'h4b: data = 8'h00; //
                8'h4c: data = 8'h01; //
                8'h4d: data = 8'h00; //
                
                8'h50: data = 8'h47; //
                8'h51: data = 8'h00; //
                8'h52: data = 8'h01; //
                8'h53: data = 8'h00; //
                8'h54: data = 8'h01; //
                8'h55: data = 8'h00; //
                8'h56: data = 8'h01; //
                8'h57: data = 8'h00; //
                8'h58: data = 8'h01; //
                8'h59: data = 8'h01; //
                8'h5a: data = 8'h01; //
                8'h5b: data = 8'h00; //
                8'h5c: data = 8'h01; //
                8'h5d: data = 8'h00; //
                
                default: data = 8'h00;
            endcase
    end
endmodule


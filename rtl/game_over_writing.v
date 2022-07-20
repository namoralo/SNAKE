`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2022 12:17:42
// Design Name: 
// Module Name: char_rom_16x16
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


module game_over_writing(
            input  wire        clk,
            input  wire [7:0]  char_yx, 
            output reg  [6:0]  char_code 
    );
    
        // signal declaration
        reg [6:0] data;
    
        // body
        always @(posedge clk)
            char_code <= data;
    
        always @* begin
            case (char_yx)
                8'h00: data = 7'h00; 
                8'h01: data = 7'h00; 
                8'h02: data = 7'h00; 
                8'h03: data = 7'h00; 
                8'h04: data = 7'h00; 
                8'h05: data = 7'h00;  
                8'h06: data = 7'h00; 
                8'h07: data = 7'h00; 
                8'h08: data = 7'h00; 
                8'h09: data = 7'h00; 
                8'h0a: data = 7'h00;  
                8'h0b: data = 7'h00; 
                8'h0c: data = 7'h00; 
                8'h0d: data = 7'h00; 
                8'h0e: data = 7'h00; 
                8'h0f: data = 7'h00;  
                
                8'h10: data = 7'h00; 
                8'h11: data = 7'h00; 
                8'h12: data = 7'h00; 
                8'h13: data = 7'h00; 
                8'h14: data = 7'h00;
                8'h15: data = 7'h00;  
                8'h16: data = 7'h00;  
                8'h17: data = 7'h00; 
                8'h18: data = 7'h00; 
                8'h19: data = 7'h00;  
                8'h1a: data = 7'h00; 
                8'h1b: data = 7'h00; 
                8'h1c: data = 7'h00; 
                8'h1d: data = 7'h00; 
                8'h1e: data = 7'h00;  
                8'h1f: data = 7'h00; 
                 
                
                8'h20: data = 7'h00; 
                8'h21: data = 7'h00; 
                8'h22: data = 7'h00; 
                8'h23: data = 7'h00;  
                8'h24: data = 7'h47; 
                8'h25: data = 7'h41; 
                8'h26: data = 7'h4d; 
                8'h27: data = 7'h45; 
                8'h28: data = 7'h00;
                8'h29: data = 7'h49;  
                8'h2a: data = 7'h56; 
                8'h2b: data = 7'h45; 
                8'h2c: data = 7'h52; 
                8'h2d: data = 7'h00;  
                8'h2e: data = 7'h00; 
                8'h2f: data = 7'h00; 
                
                
                8'h30: data = 7'h00; 
                8'h31: data = 7'h00;
                8'h32: data = 7'h00; 
                8'h33: data = 7'h00;  
                8'h34: data = 7'h00;
                8'h35: data = 7'h00;  
                8'h36: data = 7'h00; 
                8'h37: data = 7'h00; 
                8'h38: data = 7'h00; 
                8'h39: data = 7'h00; 
                8'h3a: data = 7'h00; 
                8'h3b: data = 7'h00;  
                8'h3c: data = 7'h00; 
                8'h3d: data = 7'h00; 
                8'h3e: data = 7'h00; 
                8'h3f: data = 7'h00; 
                                
                8'h40: data = 7'h00; 
                8'h41: data = 7'h00; 
                8'h42: data = 7'h00; 
                8'h43: data = 7'h00;  
                8'h44: data = 7'h00; 
                8'h45: data = 7'h53; 
                8'h46: data = 7'h63; 
                8'h47: data = 7'h6f; 
                8'h48: data = 7'h72; 
                8'h49: data = 7'h65;  
                8'h4a: data = 7'h3a; 
                8'h4b: data = 7'h00; 
                8'h4c: data = 7'h00; 
                8'h4d: data = 7'h00; 
                8'h4e: data = 7'h00;  
                8'h4f: data = 7'h00; 
                
                8'h50: data = 7'h00; 
                8'h51: data = 7'h00; 
                8'h52: data = 7'h00; 
                8'h53: data = 7'h00; 
                8'h54: data = 7'h00; 
                8'h55: data = 7'h00; 
                8'h56: data = 7'h00;  
                8'h57: data = 7'h00; 
                8'h58: data = 7'h00; 
                8'h59: data = 7'h00; 
                8'h5a: data = 7'h00;  
                8'h5b: data = 7'h00; 
                8'h5c: data = 7'h00; 
                8'h5d: data = 7'h00; 
                8'h5e: data = 7'h00;  
                8'h5f: data = 7'h00; 
                                
                8'h60: data = 7'h00; 
                8'h61: data = 7'h00; 
                8'h62: data = 7'h00; 
                8'h63: data = 7'h00; 
                8'h64: data = 7'h00; 
                8'h65: data = 7'h00; 
                8'h66: data = 7'h00; 
                8'h67: data = 7'h00; 
                8'h68: data = 7'h00;  
                8'h69: data = 7'h00; 
                8'h6a: data = 7'h00; 
                8'h6b: data = 7'h00; 
                8'h6c: data = 7'h00; 
                8'h6d: data = 7'h00; 
                8'h6e: data = 7'h00;  
                8'h6f: data = 7'h00;  

            endcase
    end
endmodule

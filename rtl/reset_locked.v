`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2022 10:11:18
// Design Name: 
// Module Name: reset_locked
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


module reset_locked(

    input wire locked,
    input wire pclk,
    output reg rst_locked
    );
    
    reg [3:0] sreg, sreg_nxt;
        
    always @(posedge pclk or negedge locked) begin
        if(!locked) begin
            sreg <= 4'b1111; 
        end
        else begin
            sreg <= sreg_nxt;
        end
    end
    
        always @* begin
            sreg_nxt = {sreg[2:0], !locked};
            rst_locked = sreg[3];
        end
   
endmodule

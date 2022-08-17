`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2022 17:44:20
// Design Name: 
// Module Name: decoder
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


module decoder(
    input wire clk,
    input wire reset,
    input wire [3:0] button,
    output reg [4:0] direction
    );
    
    reg [4:0] direction_nxt;
    
    always@(posedge clk or posedge reset) begin
        if(reset) begin
direction <= 5'b10000;
        end
        else begin
direction <= direction_nxt;
            end
    end
    
    always @* begin
if(button[0])
                          direction_nxt = 5'b01000;
else if(button[1])
                   
                     
                      direction_nxt = 5'b00001;
 else if(button[2]) 
                        direction_nxt = 5'b00010;
 else if(button[3]) 

                        direction_nxt = 5'b00100;
 else
                        direction_nxt = direction;

                    end
        
endmodule

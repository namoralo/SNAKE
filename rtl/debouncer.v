`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 07/27/2016 02:04:22 PM
// Design Name: 
// Module Name: debouncer
// Project Name: Entliczek pentliczek
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Pobrano z https://digilent.com/reference/programmable-logic/basys-3/demos/keyboard
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input clk,
    input I,
    output reg O
    );
    parameter COUNT_MAX=255, COUNT_WIDTH=8;
    reg [COUNT_WIDTH-1:0] count;
    reg Iv=0;
    always@(posedge clk)
        if (I == Iv) begin
            if (count == COUNT_MAX)
                O <= I;
            else
                count <= count + 1'b1;
        end else begin
            count <= 'b0;
            Iv <= I;
        end
    
endmodule

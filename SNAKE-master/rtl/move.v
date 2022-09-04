`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 21.07.2022 19:57:46
// Design Name: 
// Module Name: move
// Project Name: Entliczek pentliczek
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


module move(
    input wire clk,
    input wire reset,
    input wire [4:0] direction,
    output reg [6:0] head_x,
    output reg [5:0] head_y,
    output reg [104:0] tail_x,
    output reg [89:0] tail_y
);

    reg [6:0] head_x_nxt;
    reg [5:0] head_y_nxt;
    reg [104:0] tail_x_nxt;
    reg [89:0] tail_y_nxt;
    reg [25:0] counter_px, counter_px_nxt;  

always@(posedge clk or posedge reset) begin
    if(reset) begin
        head_x <= 6'd32;
        head_y <= 5'd24;
        tail_x <= 105'b0;
        tail_y <= 90'b0;
        counter_px <= 0;
    end
    else begin
        head_x <= head_x_nxt;
        head_y <= head_y_nxt;
        tail_x <= tail_x_nxt;
        tail_y <= tail_y_nxt;
        counter_px <= counter_px_nxt;
    end
end

always @* begin
    if(counter_px == 15165696-1) begin
        counter_px_nxt = 0;
        case (direction)
            5'b00001: begin // ->
                tail_x_nxt = tail_x << 7;
                tail_y_nxt = tail_y << 6;
                tail_x_nxt[6:0] = head_x;
                tail_y_nxt[5:0] = head_y;
                head_x_nxt = head_x + 1;
                head_y_nxt = head_y;
            end
            5'b00010: begin // down
                tail_x_nxt = tail_x << 7;
                tail_y_nxt = tail_y << 6;
                tail_x_nxt[6:0] = head_x;
                tail_y_nxt[5:0] = head_y;
                head_x_nxt = head_x;
                head_y_nxt = head_y + 1;
            end
            5'b00100: begin // <-
                tail_x_nxt = tail_x << 7;
                tail_y_nxt = tail_y << 6;
                tail_x_nxt[6:0] = head_x;
                tail_y_nxt[5:0] = head_y;
                head_x_nxt = head_x - 1;
                head_y_nxt = head_y;
            end
            5'b01000: begin // up
                tail_x_nxt = tail_x << 7;
                tail_y_nxt = tail_y << 6;
                tail_x_nxt[6:0] = head_x;
                tail_y_nxt[5:0] = head_y;
                head_x_nxt = head_x;
                head_y_nxt = head_y - 1;
            end
            5'b10000: begin // stop
                tail_x_nxt = tail_x;
                tail_y_nxt = tail_y;
                head_x_nxt = head_x;
                head_y_nxt = head_y;
            end
            default: begin // stop
                tail_x_nxt = tail_x;
                tail_y_nxt = tail_y;
                head_x_nxt = head_x;
                head_y_nxt = head_y;
            end
        endcase               
    end   
    else begin
        counter_px_nxt = counter_px+1;  
        head_x_nxt = head_x;
        head_y_nxt = head_y;
        tail_x_nxt = tail_x;
        tail_y_nxt = tail_y;
    end        
end

endmodule

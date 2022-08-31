`timescale 1ns/1ps
/******************************************************************************
 * (C) Copyright 2016 AGH UST All Rights Reserved
 *
 * MODULE:    bcd2sseg
 * DEVICE:    general
 * PROJECT:   stopwatch
 * ABSTRACT:  This module converts 8421 BCD code into 7-segment display code
 *            (active LOW)
 *
 * HISTORY:
 * 1 Jan 2016, RS - initial version
 *******************************************************************************/
module bcd2sseg (
        input  wire [3:0] bcd,
        output reg  [6:0] sseg
    );

    // bits for segments  gfedcba
    localparam SSEG_0 = 7'b1000000;
    localparam SSEG_1 = 7'b1111001;
    localparam SSEG_2 = 7'b0100100;
    localparam SSEG_3 = 7'b0110000;
    localparam SSEG_4 = 7'b0011001;
    localparam SSEG_5 = 7'b0010010;
    localparam SSEG_6 = 7'b0000010;
    localparam SSEG_7 = 7'b1111000;
    localparam SSEG_8 = 7'b0000000;
    localparam SSEG_9 = 7'b0010000;
    localparam SSEG_X = SSEG_2 | SSEG_5;

    always @*
        case(bcd)
            4'd0 : sseg    = SSEG_0;
            4'd1 : sseg    = SSEG_1;
            4'd2 : sseg    = SSEG_2;
            4'd3 : sseg    = SSEG_3;
            4'd4 : sseg    = SSEG_4;
            4'd5 : sseg    = SSEG_5;
            4'd6 : sseg    = SSEG_6;
            4'd7 : sseg    = SSEG_7;
            4'd8 : sseg    = SSEG_8;
            4'd9 : sseg    = SSEG_9;
            default : sseg = SSEG_X;
        endcase

endmodule

`timescale 1ns / 1ps
/******************************************************************************
* (C) Copyright 2016 AGH UST All Rights Reserved
*
* MODULE:    stopwatch
* DEVICE:    xc7a35t_0 (BASYS3)
* PROJECT:   stopwatch
*
* ABSTRACT:  Simple stopwatch with start and stop buttons and LCD display
*
* HISTORY:
* 4 Jan 2016, RS - initial version
* 31.08.22 zmienienie mainclock, usuniêcie zbêdnych modu³ów, podpiêcie score
* Pobrano z UPEL UEC1
*******************************************************************************/
module display(
    input  wire       clk65MHz, // main clock, POSedge active
    input  wire       rst, 
    input wire [3:0] score,
    // 7-segment display control (common anode)
    output wire [6:0] sseg_ca,   // segments (active LOW)
    output wire [3:0] sseg_an    // anode enable (active LOW)
);
    
    wire        clk10kHz; // LCD clock, POSedge active

//------------------------------------------------------------------------------------------------
// clock divider to produce LCD multiplexing 10000 Hz clock from 100 MHz external clock
clk_divider
#(
    .FREQ(10000)          // 4-bit ring counter
)
u_clk_divider_display(
    .clk65MHz(clk65MHz), //input clock 100 MHz
    .rst (rst),            //async reset active high
    .clk_div (clk10kHz)
);

//------------------------------------------------------------------------------
// binary to BCD converting

    wire [3:0]  bcd0;        // LSB
    wire [3:0]  bcd1;
    wire [3:0]  bcd2;
    wire [3:0]  bcd3;        // MSB

bin2bcd u_bin2bcd
(
    .bin ({12'b0, score}),
    .bcd0(bcd0),
    .bcd1(bcd1),
    .bcd2(bcd2),
    .bcd3(bcd3)
);

//------------------------------------------------------------------------------
// control module for 7-segment display

sseg_x4 u_sseg_x4
(
    .clk (clk10kHz), //posedge active clock
    .rst (rst),      //async reset active HIGH
    .bcd0 (bcd0),    //bcd inputs
    .bcd1 (bcd1),
    .bcd2 (bcd2),
    .bcd3 (bcd3),
    .sseg_ca(sseg_ca),
    .sseg_an(sseg_an)
);

endmodule


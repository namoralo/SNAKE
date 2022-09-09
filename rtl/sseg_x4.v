`timescale 1ns / 1ps
/******************************************************************************
 * (C) Copyright 2016 AGH UST All Rights Reserved
 *
 * MODULE:    sseg_x4
 * DEVICE:    general
 * PROJECT:   stopwatch
 *
 * ABSTRACT:  This module provides the control signals for 4-digit 7-segment
 *            display unit with common anode. BCD inputs are multiplexed
 *            with given input clk frequency.
 *
 * HISTORY:
 * 1 Jan 2016, RS - initial version
 * 4 Jan 2016, RS - removed clock divider
 *
 * Pobrano z UPEL UEC1
 *******************************************************************************/
module sseg_x4 (
        input  wire       clk, // posedge active clock, 100 MHz
        input  wire       rst,       // async reset active HIGH
        input  wire [3:0] bcd0,      // bcd inputs
        input  wire [3:0] bcd1,
        input  wire [3:0] bcd2,
        input  wire [3:0] bcd3,

        // outputs for 7-segment display control
        output wire [6:0] sseg_ca,   // 7-segment control (active LOW)
        output wire [3:0] sseg_an    // anode control (active LOW)
    );
//------------------------------------------------------------------------------

    wire [3:0] bcd_selected; // code selected for display

//------------------------------------------------------------------------------
// ring oscillator for multiplexing the displayed digits

    ring_counter
    #(
        .SIZE(4),          // 4-bit ring counter
        .INIT_VAL(4'b1110) // with single rotating 0
    )
    u_ring_counter
    (
        .clk(clk),
        .rst(rst),
        .ring(sseg_an)
    );

//------------------------------------------------------------------------------
// multiplexing BCD codes to single output

    sseg_mux u_sseg_mux
    (
        .sel(sseg_an),
        .bcd0(bcd0),
        .bcd1(bcd1),
        .bcd2(bcd2),
        .bcd3(bcd3),
        .bcd_selected(bcd_selected)
    );

//------------------------------------------------------------------------------
// converting BCD code to 7-segment display

    bcd2sseg u_bcd2sseg
    (
        .bcd (bcd_selected),
        .sseg(sseg_ca)
    );

//------------------------------------------------------------------------------

endmodule

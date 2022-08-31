`timescale 1ns / 1ps
/******************************************************************************
 * (C) Copyright 2016 AGH UST All Rights Reserved
 *
 * MODULE:    bin2bcd
 * DEVICE:    general
 * PROJECT:   stopwatch
 *
 * ABSTRACT:  binary to BCD converter, three 8421 BCD digits
 *            Algorithm description:
 *            http://www.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html
 *
 * HISTORY:
 * 1 Jan 2016, RS - initial version
 * 12.01.22 dodanie bcd3
 * 12.01.22 zmienienie liczby wej�� z 12 na 16
 *******************************************************************************/
module bin2bcd (
        input  wire [15:0] bin,  // input binary number
        output reg  [3:0]  bcd0, // LSB
        output reg  [3:0]  bcd1,
        output reg  [3:0]  bcd2,
        output reg  [3:0]  bcd3  // MSB
    );

    integer i;

    always @(bin)
    begin

        bcd0 = 0;
        bcd1 = 0;
        bcd2 = 0;
        bcd3 = 0;

        for ( i = 15; i >= 0; i = i - 1 )
        begin
            if( bcd0 > 4 ) bcd0 = bcd0 + 3;
            if( bcd1 > 4 ) bcd1 = bcd1 + 3;
            if( bcd2 > 4 ) bcd2 = bcd2 + 3;
            if( bcd3 > 4 ) bcd3 = bcd3 + 3;
            { bcd3[3:0], bcd2[3:0], bcd1[3:0], bcd0[3:0] } =
            { bcd3[2:0], bcd2[3:0], bcd1[3:0], bcd0[3:0],bin[i] };
        end

    end

endmodule

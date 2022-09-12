`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 31.07.2022 18:45:55
// Design Name: 
// Module Name: arcade_small_font
// Project Name: Entliczek pentliczek
// Target Devices: 
// Tool Versions: 
// Description: Ma�a czcionka
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Wzorowano na czcionce Arcade Classic
//////////////////////////////////////////////////////////////////////////////////


module arcade_small_font(
    input  wire        clk,
    input  wire [15:0] addr,            
    output reg  [31:0] char_line_pixels 
);

    // signal declaration
    reg [31:0] data;

// body
always @(posedge clk)
    char_line_pixels <= data;

always @* begin
    case (addr)
        //code x00
        16'h0000: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h0001: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h0002: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h0003: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
 			
        16'h0004: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;      
        16'h0005: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h0006: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h0007: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
 				
        16'h0008: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h0009: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h000a: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h000b: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
			   
        16'h000c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h000d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h000e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;     
        16'h000f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
			   
        16'h0010: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h0011: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h0012: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h0013: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        		   	
        16'h0014: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h0015: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h0016: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h0017: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
			   
        16'h0018: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;   
        16'h0019: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h001a: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h001b: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
			   
        16'h001c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h001d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;      
        16'h001e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h001f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 

        //code x3A
        16'h3a00: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a01: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a02: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a03: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 

        16'h3a04: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 		   
        16'h3a05: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;  
        16'h3a06: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a07: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
 
        16'h3a08: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a09: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;   		   
        16'h3a0a: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a0b: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
 
        16'h3a0c: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 
        16'h3a0d: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 
        16'h3a0e: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 		   
        16'h3a0f: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 

        16'h3a10: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a11: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a12: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a13: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        		   
        16'h3a14: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 
        16'h3a15: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 
        16'h3a16: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 
        16'h3a17: data = 32'b0000_1111_0000_0000_0000_0000_0000_0000; 

        16'h3a18: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;		   
        16'h3a19: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h3a1a: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h3a1b: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
 
        16'h3a1c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h3a1d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;		   
        16'h3a1e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h3a1f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        
        //code x41
        16'h4100: data = 32'b0000_0000_1111_1111_1111_0000_0000_0000;
        16'h4101: data = 32'b0000_0000_1111_1111_1111_0000_0000_0000;
        16'h4102: data = 32'b0000_0000_1111_1111_1111_0000_0000_0000;
        16'h4103: data = 32'b0000_0000_1111_1111_1111_0000_0000_0000;
			   
        16'h4104: data = 32'b0000_1111_1111_0000_1111_1111_0000_0000;
        16'h4105: data = 32'b0000_1111_1111_0000_1111_1111_0000_0000;
        16'h4106: data = 32'b0000_1111_1111_0000_1111_1111_0000_0000; 
        16'h4107: data = 32'b0000_1111_1111_0000_1111_1111_0000_0000;
			   
        16'h4108: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h4109: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h410a: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h410b: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
			   
        16'h410c: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h410d: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h410e: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h410f: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
			   
        16'h4110: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h4111: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h4112: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h4113: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
  			   
        16'h4114: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h4115: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h4116: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h4117: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
  			   
        16'h4118: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h4119: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h411a: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h411b: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
 			   
        16'h411c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h411d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h411e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h411f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		
        //code x43
        16'h4300: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000; 
        16'h4301: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000;  
        16'h4302: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000;  
        16'h4303: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000; 
  
        16'h4304: data = 32'b0000_1111_11111_0000_0000_1111_1111_0000;
        16'h4305: data = 32'b0000_1111_11111_0000_0000_1111_1111_0000;
        16'h4306: data = 32'b0000_1111_11111_0000_0000_1111_1111_0000;
        16'h4307: data = 32'b0000_1111_11111_0000_0000_1111_1111_0000;

        16'h4308: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4309: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h430a: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h430b: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 

        16'h430c: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        16'h430d: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h430e: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h430f: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
 
        16'h4310: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4311: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;   
        16'h4312: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4313: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        
        16'h4314: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000; 
        16'h4315: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000; 
        16'h4316: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000; 
        16'h4317: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;  

        16'h4318: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000; 
        16'h4319: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000; 
        16'h431a: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000; 
        16'h431b: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000; 
 
        16'h431c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h431d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h431e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h431f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
 
        //code x45
        16'h4500: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h4501: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h4502: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h4503: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;

        16'h4504: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4505: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4506: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4507: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 

        16'h4508: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4509: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h450a: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;   
        16'h450b: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 

        16'h450c: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000; 
        16'h450d: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000; 
        16'h450e: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000; 
        16'h450f: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000; 

        16'h4510: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        16'h4511: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4512: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        16'h4513: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        
        16'h4514: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        16'h4515: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        16'h4516: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h4517: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
   
        16'h4518: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h4519: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h451a: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        16'h451b: data = 32'b1111_1111_1111_1111_1111_1111_1111_0000; 

        16'h451c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h451d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h451e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h451f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

        //code x4F
        16'h4f00: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h4f01: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h4f02: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h4f03: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;

        16'h4f04: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f05: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f06: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f07: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 

        16'h4f08: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f09: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f0a: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;  
        16'h4f0b: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 

        16'h4f0c: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;  
        16'h4f0d: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;  
        16'h4f0e: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f0f: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 

        16'h4f10: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f11: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f12: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f13: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h4f14: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f15: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f16: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h4f17: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
  
        16'h4f18: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h4f19: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h4f1a: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h4f1b: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;

        16'h4f1c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h4f1d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h4f1e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h4f1f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

        //code x50
        16'h5000: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000;
        16'h5001: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000;
        16'h5002: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000;
        16'h5003: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000;
	      
        16'h5004: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5005: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5006: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5007: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
	      
        16'h5008: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5009: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h500a: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;   
        16'h500b: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
	      
        16'h500c: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h500d: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h500e: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h500f: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
	      
        16'h5010: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000;  
        16'h5011: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000;
        16'h5012: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000;  
        16'h5013: data = 32'b1111_1111_1111_1111_1111_1111_0000_0000; 
           
        16'h5014: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        16'h5015: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;  
        16'h5016: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h5017: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
   	      
        16'h5018: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;
        16'h5019: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;
        16'h501a: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;
        16'h501b: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000;
	      
        16'h501c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h501d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h501e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h501f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

        //code x52
        16'h5200: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h5201: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h5202: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h5203: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        
        16'h5204: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h5205: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5206: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5207: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h5208: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5209: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;  
        16'h520a: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;  
        16'h520b: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h520c: data = 32'b1111_1111_0000_0000_1111_1111_1111_0000; 
        16'h520d: data = 32'b1111_1111_0000_0000_1111_1111_1111_0000; 
        16'h520e: data = 32'b1111_1111_0000_0000_1111_1111_1111_0000;  
        16'h520f: data = 32'b1111_1111_0000_0000_1111_1111_1111_0000; 
        
        16'h5210: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000; 
        16'h5211: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000;  
        16'h5212: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000;  
        16'h5213: data = 32'b1111_1111_1111_1111_1111_0000_0000_0000; 
        
        16'h5214: data = 32'b1111_1111_0000_0000_1111_1111_0000_0000; 
        16'h5215: data = 32'b1111_1111_0000_0000_1111_1111_0000_0000; 
        16'h5216: data = 32'b1111_1111_0000_0000_1111_1111_0000_0000; 
        16'h5217: data = 32'b1111_1111_0000_0000_1111_1111_0000_0000;   
        
        16'h5218: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5219: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h521a: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h521b: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h521c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h521d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h521e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        16'h521f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        
        //code x53
        16'h5300: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h5301: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;  
        16'h5302: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;  
        16'h5303: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;  
        
        16'h5304: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;
        16'h5305: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5306: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5307: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h5308: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h5309: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h530a: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        16'h530b: data = 32'b1111_1111_0000_0000_0000_0000_0000_0000; 
        
        16'h530c: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h530d: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h530e: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;
        16'h530f: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;  
        
        16'h5310: data = 32'b0000_0000_0000_0000_0000_1111_1111_0000;
        16'h5311: data = 32'b0000_0000_0000_0000_0000_1111_1111_0000; 
        16'h5312: data = 32'b0000_0000_0000_0000_0000_1111_1111_0000;
        16'h5313: data = 32'b0000_0000_0000_0000_0000_1111_1111_0000;
        
        16'h5314: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5315: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5316: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5317: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;  
        
        16'h5318: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h5319: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000;  
        16'h531a: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h531b: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        
        16'h531c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h531d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h531e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h531f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        
        //code x54
        16'h5400: data = 32'b0000_1111_1111_1111_1111_1111_1111_0000;
        16'h5401: data = 32'b0000_1111_1111_1111_1111_1111_1111_0000; 
        16'h5402: data = 32'b0000_1111_1111_1111_1111_1111_1111_0000; 
        16'h5403: data = 32'b0000_1111_1111_1111_1111_1111_1111_0000;
        
        16'h5404: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;
        16'h5405: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5406: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5407: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        
        16'h5408: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5409: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h540a: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h540b: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        
        16'h540c: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h540d: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h540e: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h540f: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        
        16'h5410: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5411: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5412: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5413: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        
        16'h5414: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5415: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5416: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5417: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        
        16'h5418: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5419: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h541a: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h541b: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        
        16'h541c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h541d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;  
        16'h541e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h541f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        
        //code x55
        16'h5500: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5501: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5502: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5503: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h5504: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5505: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5506: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5507: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h5508: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5509: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h550a: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h550b: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h550c: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h550d: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h550e: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h550f: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h5510: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5511: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5512: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5513: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        
        16'h5514: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5515: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5516: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000; 
        16'h5517: data = 32'b1111_1111_0000_0000_0000_1111_1111_0000;   
        
        16'h5518: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h5519: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h551a: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        16'h551b: data = 32'b0000_1111_1111_1111_1111_1111_0000_0000; 
        
        16'h551c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h551d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h551e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h551f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        
        //code x59
        16'h5900: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        16'h5901: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000; 
        16'h5902: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000; 
        16'h5903: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        
        16'h5904: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        16'h5905: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        16'h5906: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        16'h5907: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;  
        
        16'h5908: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        16'h5909: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        16'h590a: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        16'h590b: data = 32'b0000_1111_1111_0000_0000_1111_1111_0000;
        
        16'h590c: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000;
        16'h590d: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000;
        16'h590e: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000;
        16'h590f: data = 32'b0000_0000_1111_1111_1111_1111_0000_0000; 
        
        16'h5910: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;   
        16'h5911: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5912: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5913: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        
        16'h5914: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5915: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5916: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        16'h5917: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000; 
        
        16'h5918: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h5919: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h591a: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        16'h591b: data = 32'b0000_0000_0000_1111_1111_0000_0000_0000;  
        
        16'h591c: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h591d: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;  
        16'h591e: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        16'h591f: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
        
        default: data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    endcase
end    

endmodule


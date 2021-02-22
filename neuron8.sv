
module neuron8(
	input  logic [31:0] x1,
	input  logic [31:0] x2,
	input  logic [31:0] x3,
	input  logic [31:0] x4,
	input  logic [31:0] x5,
	input  logic [31:0] x6,
	input  logic [31:0] x7,
	input  logic [31:0] x8,
	input  logic [31:0] x9,
	input  logic [31:0] b,
	output logic [31:0] y
	);

	parameter [31:0] w1 = 32'b0000000100000000_1010_1010_1101_0001; 
	parameter [31:0] w2 = 32'b0001000000010000_1010_1011_1101_0001;  
	parameter [31:0] w3 = 32'b0001001010010000_1110_1010_1101_0001; 
	parameter [31:0] w4 = 32'b0010000100100000_1010_1010_1001_0111; 
	parameter [31:0] w5 = 32'b0010001000010000_1010_1010_1101_0001; 
	parameter [31:0] w6 = 32'b0100100000100000_1010_1111_1101_0001;  
	parameter [31:0] w7 = 32'b0010010000100001_1110_1110_1101_0001; 
	parameter [31:0] w8 = 32'b0010001000010000_1010_1010_1101_1001;  

	assign y = x1*w1 + x2*w2* + x3*w3 + x4*w4 + x5*w5 + x6*w6 + x7*w7 + x8*w8 + b;

endmodule

module neuron_8(
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

	parameter [31:0] w1 = 32'b1; 
	parameter [31:0] w2 = 32'b1; 
	parameter [31:0] w3 = 32'b1; 
	parameter [31:0] w4 = 32'b1; 
	parameter [31:0] w5 = 32'b1; 
	parameter [31:0] w6 = 32'b1; 
	parameter [31:0] w7 = 32'b1; 
	parameter [31:0] w8 = 32'b1; 

	assign y = x1*w1 + x2*w2* + x3*w3 + x4*w4 + x5*w5 + x6*w6 + x7*w7 + x8*w8 + b;

endmodule
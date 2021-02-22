
module rnn(
	input  logic clk,
	input  logic rst_n,
	input  logic  [2:0] sel,
	input  logic [31:0] in,
	output logic [31:0] out);

	logic [31:0] x1, x2, x3, x4, x5, x6, x7, x8;

	always_ff @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			x1 <= 32'b0;
			x2 <= 32'b0;
			x3 <= 32'b0;
			x4 <= 32'b0;
			x5 <= 32'b0;
			x6 <= 32'b0;
			x7 <= 32'b0;
			x8 <= 32'b0;
		end else begin
			case (sel)
				3'd0: x1 <= in;
				3'd1: x2 <= in;
				3'd2: x3 <= in;
				3'd3: x4 <= in;
				3'd4: x5 <= in;
				3'd5: x6 <= in;
				3'd6: x7 <= in;
				3'd7: x8 <= in;
			endcase
		end
	end
	
	neuron8 n1(.x1,.x2,.x3,.x4,.x5,.x6,.x7,.x8,.b(0),.y(out));

endmodule : rnn
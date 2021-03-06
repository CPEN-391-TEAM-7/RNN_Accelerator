module loader_2d(
	input  logic        clk,
	input  logic        reset_n,
	input  logic        write, 
	input  logic  [1:0] seli,
	input  logic  [3:0] selj,
	input  logic [15:0] param_in,

	output logic [15:0] param_out
	);

logic [15:0] matrix [1:0][3:0];

integer i;
integer j;
always_ff @(posedge clk or negedge reset_n) begin
	if(~reset_n) begin

		for(i = 0; i <2;i=i+1) begin
			for (j = 0; j< 4; j=j+1) begin
				matrix[i][j] <= 0;
			end
		end

	end else begin

		if (write) matrix[seli][selj] <= param_in;

	end
end

assign param_out = matrix[seli][selj];

endmodule

module loader_1d(
	input  logic        clk,
	input  logic        reset_n,
	input  logic        write, 
	input  logic  [3:0] sel,
	input  logic [15:0] param_in,

	output logic [15:0] param_out
	);

logic [15:0] vector [3:0];

integer i;
always_ff @(posedge clk or negedge reset_n) begin
	if(~reset_n) begin

		for(i = 0; i <4;i=i+1) begin
			vector[i] <= 0;
		end

	end else begin

		if (write) vector[sel] <= param_in;

	end
end

assign param_out = vector[sel];

endmodule
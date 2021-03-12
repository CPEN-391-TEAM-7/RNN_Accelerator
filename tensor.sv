module tensor_2d #(
	parameter ROW_BITS=2,
	parameter COL_BITS=4)
	(
	input  logic                 clk,
	input  logic                 rst_n,
	input  logic                 write, 
	input  logic  [15:0]         param_in,
	input  logic  [ROW_BITS-1:0] sel_r,
	input  logic  [COL_BITS-1:0] sel_c,

	output logic [15:0] param_out
	);

logic [15:0] matrix [0:(1 << ROW_BITS)-1][0:(1 << COL_BITS)-1];

integer i;
integer j;
always_ff @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin

		for(i = 0; i < (1 << ROW_BITS); i=i+1) begin
			for (j = 0; j< (1 << COL_BITS); j=j+1) begin
				matrix[i][j] <= 0;
			end
		end

	end else begin

		if (write) matrix[sel_r][sel_c] <= param_in;

	end
end

assign param_out = matrix[sel_r][sel_c];

endmodule

module tensor_1d #(parameter LEN=4)(
	input  logic        clk,
	input  logic        rst_n,
	input  logic        write, 
	input  logic  [LEN-1:0] sel,
	input  logic [15:0] param_in,

	output logic [15:0] param_out
	);

logic [15:0] vector [0:(1<<LEN)-1];

integer i;
always_ff @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin

		for(i = 0; i <(1 << LEN);i=i+1) begin
			vector[i] <= 0;
		end

	end else begin

		if (write) vector[sel] <= param_in;

	end
end

assign param_out = vector[sel];

endmodule
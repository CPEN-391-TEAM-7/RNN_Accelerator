module matmul #(
	parameter DATA1_LEN_BITS=2,
	parameter DATA2_ROW_BITS=2,
	parameter DATA2_COL_BITS=4)
	(
	input  logic        			  clk,
	input  logic        			  rst_n,
	input  logic					  start,
	input  logic [15:0] 			  data1,
	input  logic [15:0] 			  data2,
	input  logic [DATA2_COL_BITS-1:0] sel,

	output logic 					  ready,
	output logic                      busy,
	output logic					  done,
	output logic [15:0] 			  data_out
	output logic [DATA1_LEN_BITS-1:0] sel_vec,
	output logic [DATA2_ROW_BITS-1:0] sel_row,
	output logic [DATA2_COL_BITS-1:0] sel_cow
	);

	typedef enum {READY, CLEAR, BUSY,} matrix_state;
	matrix_state state;

	logic        			   imm_write, imm_reset;
	logic [15:0] 			   imm_in, imm_out;
	logic [31:0] 			   result;
	logic [DATA2_COL_BITS-1:0] imm_sel;

	tensor_1d #(.LEN(DATA2_ROW_BITS)) imm_vec(
		.clk, .rst_n(imm_reset && rst_n),  .write(imm_write),
		.sel(imm_sel), .param_in(imm_in), .param_out(imm_out));

	always_ff @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			state  <= READY;
			result   <= 32'b0;
			sel_vec  <= 0;
			sel_row  <= 0;
			sel_col  <= 0;
		end else begin
			case(state)

				READY: begin
					if(start) state <= CLEAR;
				end

				CLEAR: begin
					state <= BUSY;
				end

				BUSY: begin
					state <= BUSY;
				end
		end
	end

	// reset automatically when waiting for new data
	assign imm_reset = (state != CLEAR);
	assign ready     = (state == READY);
	assign done      = (state == DONE);

endmodule


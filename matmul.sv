module matmul #(
	parameter DATA1_LEN_BITS=2,
	parameter DATA2_ROW_BITS=2,
	parameter DATA2_COL_BITS=4)
	(
	input  logic        			  clk,
	input  logic        			  rst_n,
	input  logic					  start,
	input  logic signed [15:0] 		  data1,
	input  logic signed [15:0] 		  data2,
	input  logic [DATA2_COL_BITS-1:0] sel,

	output logic 					  ready,
	output logic signed [15:0]		  data_out,
	output logic [DATA1_LEN_BITS-1:0] sel_vec,
	output logic [DATA2_ROW_BITS-1:0] sel_row,
	output logic [DATA2_COL_BITS-1:0] sel_col
	);

	typedef enum {READY, CLEAR, BUSY} matrix_state;
	matrix_state state;

	logic        			   imm_write, imm_reset;
	logic signed [15:0] 	   imm_in, imm_out;
	logic signed [31:0] 	   result;
	logic [DATA2_COL_BITS-1:0] imm_sel;

	tensor_1d #(.LEN(DATA2_COL_BITS)) imm_vec(
		.clk, .rst_n(imm_reset && rst_n),  .write(imm_write),
		.sel(imm_sel), .param_in(imm_in), .param_out(imm_out));

	always_ff @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			state  <= READY;
			sel_vec  <= 0;
			sel_row  <= 0;
			sel_col  <= 0;
		end else begin
			case(state)

				READY: begin
					if(start) state <= CLEAR;
				end

				CLEAR: begin
					sel_vec  <= 0;
					sel_row  <= 0;
					sel_col  <= 0;
					state <= BUSY;
				end

				BUSY: begin
					
					if(sel_col == (1 << DATA2_COL_BITS)-1) begin
						if(sel_row == (1 << DATA1_LEN_BITS)-1) state <= READY;

						else begin
							sel_row <= sel_row+1;
							sel_col <= 0;
							sel_vec <= sel_vec+1;
						end
					end
					else begin
						sel_col <= sel_col +1;
					end
				end
			endcase
		end
	end

	always_comb begin : proc_
		result    = data2 * data1;
		result    = result >>> 8;
	end

	assign imm_write = (state == BUSY);
	assign imm_in    = imm_out + result[15:0];

	assign imm_sel   = (state == BUSY) ? sel_col : sel;

	// reset automatically when waiting for new data
	assign imm_reset = (state != CLEAR);
	assign ready     = (state == READY);
	assign data_out  = imm_out;

endmodule


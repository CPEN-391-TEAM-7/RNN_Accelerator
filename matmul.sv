module matmul #(
	parameter DATA1_LEN_BITS=2,
	parameter DATA2_ROW_BITS=2,
	parameter DATA2_COL_BITS=4)
	(
	input  logic        			  clk,		// clk input from DE1
	input  logic        			  rst_n,	// active low reset
	input  logic					  start,	// top level start signal
	input  logic signed [15:0] 		  data1,	// data from 2d matrix input
	input  logic signed [15:0] 		  data2,	// data from vector input
	input  logic [DATA2_COL_BITS-1:0] sel,		// select data from internal vector instance

	output logic 					  ready,	// show ready state to top level
	output logic [15:0] 			  data_out,	// output data from internal vector
	output logic [DATA1_LEN_BITS-1:0] sel_vec,	// external select input vector
	output logic [DATA2_ROW_BITS-1:0] sel_row,	// external select for 2d matrix row
	output logic [DATA2_COL_BITS-1:0] sel_col	// external select for 2d matrix col
	);

	typedef enum {READY, CLEAR, BUSY} matrix_state;
	matrix_state state;

	logic        			   imm_write, imm_reset;
	logic signed [15:0] 	   imm_in, imm_out;
	logic signed [31:0] 	   result;
	logic [DATA2_COL_BITS-1:0] imm_sel;


	// ==========================================================
	// internal vector
	// Used to store and read multlied data
	// ==========================================================
	tensor_1d #(.LEN(DATA2_COL_BITS)) imm_vec(
		.clk, .rst_n(imm_reset && rst_n),  .write(imm_write),
		.sel(imm_sel), .param_in(imm_in), .param_out(imm_out));

	// state machine for matrix vector multiply operation
	always_ff @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			state  <= READY;
			sel_vec  <= 0;
			sel_row  <= 0;
			sel_col  <= 0;
		end else begin
			case(state)

				// wait for start signal from top level
				READY: begin
					if(start) state <= CLEAR;
				end

				// clear all stored data for new multiply operation
				CLEAR: begin
					sel_vec  <= 0;
					sel_row  <= 0;
					sel_col  <= 0;
					state <= BUSY;
				end

				// run multiply in 2 dimensions
				BUSY: begin
					
					if(sel_col == (1 << DATA2_COL_BITS)-1) begin
						// go to ready if all multiplies finished
						if(sel_row == (1 << DATA1_LEN_BITS)-1) state <= READY;

						else begin
							// increment the matrix row and the vector index to perform a dot product
							sel_row <= sel_row+1;
							sel_col <= 0;
							sel_vec <= sel_vec+1;
						end
					end
					else begin
						// increment the column of the matrix 
						sel_col <= sel_col +1;
					end
				end
			endcase
		end
	end

	// used to multiple and shift signed fixed-point numbers
	// prevents overflow
	always_comb begin : proc_
		result    = data2 * data1;
		result    = result >>> 8;
	end

	// write to internal vector when doing multiplies
	assign imm_write = (state == BUSY);

	// send 16 bits of the multiplied data to the internal vector
	assign imm_in    = imm_out + result[15:0];

	// choose between who is reading the internal vector
	assign imm_sel   = (state == BUSY) ? sel_col : sel;

	// reset automatically when waiting for new data
	assign imm_reset = (state != CLEAR);
	assign ready     = (state == READY);
	assign data_out  = imm_out;

endmodule


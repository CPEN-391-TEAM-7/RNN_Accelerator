
module rnn(
	input  logic 		clk,
	input  logic 		rst_n,
	input  logic 		read,
	input  logic		write,
	input  logic [31:0] addr,
	input  logic [31:0]	data_in,
	output logic [31:0] data_out
	);

typedef enum {LOAD, READY, BUSY, DONE} state_t;
state_t state;

// ==========================================================
// input vector
// Will be rewritten after each char
// ==========================================================
logic        i_write;
logic  [3:0] i_sel;
logic [15:0] i_in, i_out;

tensor_1d #(.LEN(2)) input_char(
	.clk, .rst_n,
	.write(i_write), .sel(i_sel), 
	.param_in(i_in), .param_out(i_out));
// ==========================================================



// ==========================================================
// hidden state tensor module
// Will be rewritten after each char
// ==========================================================
logic        h_write;
logic  [3:0] h_sel;
logic [15:0] h_in, h_out;

tensor_1d #(.LEN(4)) hidden(
	.clk, .rst_n,
	.write(h_write), .sel(h_sel), 
	.param_in(h_in), .param_out(h_out));
// ==========================================================



// ==========================================================
// first recurrent matrix module
// ==========================================================
logic        r0_write;
logic  [1:0] r0_sel_r;
logic  [3:0] r0_sel_c;
logic [15:0] r0_in, r0_out;

tensor_2d #(.ROW_BITS(2), .COL_BITS(4)) rnn_0(
	.clk, .rst_n, .write(r0_write), 
	.sel_r(r0_sel_r), .sel_c(r0_sel_c), 
	.param_in(r0_in), .param_out(r0_out));
// ==========================================================



// ==========================================================
// second recurrent matrix module
// ==========================================================
logic        r1_write;
logic  [3:0] r1_sel_r;
logic  [3:0] r1_sel_c;
logic [15:0] r1_in, r1_out;

tensor_2d #(.ROW_BITS(4), .COL_BITS(4) ) rnn_1(
	.clk, .rst_n, .write(r1_write), 
	.sel_r(r1_sel_r), .sel_c(r1_sel_c), 
	.param_in(r1_in), .param_out(r1_out));
// ==========================================================



// ==========================================================
// recurrent bias tensor module
// ==========================================================
logic        rb_write;
logic  [3:0] rb_sel;
logic [15:0] rb_in, rb_out;

tensor_1d #(.LEN(4)) rnn_bias(
	.clk, .rst_n, .write(rb_write), 
	.sel(r_sel), .param_in(rb_in), .param_out(rb_out));
// ==========================================================



// ==========================================================
// dense layer vector module
// ==========================================================
logic        d_write;
logic  [3:0] d_sel;
logic [15:0] d_in, d_out;

tensor_1d #(.LEN(4)) dense(
	.clk, .rst_n, .write(d_write), 
	.sel(d_sel), .param_in(d_in), .param_out(d_out));

// dense layer bias scalar
logic [15:0] dense_bias;
// ==========================================================



// ==========================================================
// data routing 
// IMPORTANT: data_in is used for data AND secondary addressing
// 1. [ 15:0] represent Q16 fixed point numbers
// 2. [31:16] depend on the tensor size 
//		1D vector select: [23:16]
//      2D matrix rows: [31:24], cols: [23:16] 
// ==========================================================

assign i_in     = data_in[15:0];
assign i_write  = addr === 1 && state == LOAD && write;
assign i_sel    = data_in[23:16];

assign r0_in    = data_in[15:0];
assign r0_write = addr === 2 && state == LOAD && write;
assign r0_sel_r = data_in[31:24];
assign r0_sel_c = data_in[23:16];

assign r1_in    = data_in[15:0];
assign r1_write = addr === 3 && state == LOAD && write;
assign r1_sel_r = data_in[31:24];
assign r1_sel_c = data_in[23:16];

assign rb_in    = data_in[15:0];
assign rb_write = addr === 4 && state == LOAD && write;
assign rb_sel   = data_in[23:16]; 

assign d_in     = data_in[15:0];
assign d_write  = addr === 5 && state == LOAD && write;
assign d_sel    = data_in[23:16];
// ==========================================================



// ==========================================================
// RNN top-level Controller
// ==========================================================
always_ff @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		dense_bias <= 15'b0;
		state      <= LOAD;
	end else begin
		case(state)

			LOAD: begin
				if(write && addr == 6) dense_bias <= data_in[15:0];
				if(write && addr == 0) state <= READY;
			end

			READY: begin
				state <= BUSY;
			end

			BUSY: begin
				state <= DONE;
			end

			DONE: begin
				if(write && addr == 0) state <= READY;
			end

			default: begin
				state <= LOAD;
			end

		endcase
	end
end



endmodule : rnn
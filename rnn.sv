
module rnn(
	input  logic 		clk,
	input  logic 		rst_n,
	input  logic 		read,
	input  logic		write,
	input  logic [31:0] addr,
	input  logic [31:0]	data_in,
	output logic [31:0] data_out
	);

typedef enum {LOAD, BUSY, DONE} state_t;
state_t state;

// hidden state tensor module
// Will be rewritten after each char
logic        h_write;
logic  [3:0] h_sel;
logic [15:0] h_in, h_out;

tensor_1d #(.LEN(4)) hidden(
	.clk, .rst_n,
	.write(h_write), .sel(h_sel), 
	.param_in(h_in), .param_out(h_out));


// ==========================================================
// first recurrent matrix module
// ==========================================================
logic        r0_write;
logic  [1:0] r0_seli;
logic  [3:0] r0_selj;
logic [15:0] r0_in, r0_out;

tensor_2d #(.ROW_BITS(2), .COL_BITS(4)) rnn_0(
	.clk, .rst_n, .write(r0_write), 
	.seli(r0_seli), .selj(r0_selj), 
	.param_in(r0_in), .param_out(r0_out));
// ==========================================================


// ==========================================================
// second recurrent matrix module
// ==========================================================
logic        r1_write;
logic  [3:0] r1_seli;
logic  [3:0] r1_selj;
logic [15:0] r1_in, r1_out;

tensor_2d #(.ROW_BITS(4), .COL_BITS(4) ) rnn_1(
	.clk, .rst_n, .write(r1_write), 
	.seli(r1_seli), .selj(r1_selj), 
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


endmodule : rnn
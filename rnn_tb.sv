
module rnn_tb();

	logic 		 clk;
	logic 		 rst_n;
	logic 		 read;
	logic		 write;
	logic [31:0] addr;
	logic [31:0] data_in;
	logic [31:0] data_out;

	integer r0;
	integer c0;
	integer s0;

	integer r1;
	integer c1;
	integer s1;

	rnn dut(.*);

	logic [15:0] embed_v [1:0] = {-3,2};

	logic [15:0] rnn0_m[0:1][0:3];
	assign rnn0_m[0] = { 2,-10,-10, 3};
	assign rnn0_m[1] = { 6,  9, 12, 1};

	logic [15:0] rnn1_m[0:3][0:3];
	assign rnn1_m[0] = { -2, -3, -5,  -3};
	assign rnn1_m[1] = { -1, 10, -2,  -6};
	assign rnn1_m[2] = {  4, 11,  3, -12};
	assign rnn1_m[3] = {-11, -4,  3,  -1};


	always begin
		#1 clk = 0;
		#1 clk = 1;
	end

	initial begin
		// ==========================================================
		// RESET PHASE
		// ==========================================================
		rst_n   <= 0;
		write   <= 0;
		addr    <= 0;
		data_in <= 0;
		#10;
		rst_n   <= 1;
		#10;


		// ==========================================================
		// START input vector test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 1;
		data_in <= {16'b0,embed_v[0]};
		@(negedge clk)
		assert (dut.input_char.vector[0] === 16'd2);
		data_in <= {16'b1,embed_v[1]};

		@(negedge clk)
		assert (dut.input_char.vector[1] === 16'(-3));
		write <=0;
		#10;
		// ==========================================================
		// END input vector test
		// ==========================================================



		// ==========================================================
		// START RNN weight Matrix input test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 2;

		for (r0=0; r0< 2; r0=r0+1) begin
			for (c0=0; c0< 4; c0=c0+1) begin
				data_in <= {r0[7:0], c0[7:0], rnn0_m[r0][c0]};
				@(negedge clk)
				assert(dut.rnn_0.matrix[r0][c0] === rnn0_m[r0][c0]);
			end
		end

		write <= 0;
		#10;
		// ==========================================================
		// END RNN weight Matrix input test
		// ==========================================================


		// ==========================================================
		// START RNN recurrent Matrix input test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 3;

		for (r1=0; r1< 4; r1=r1+1) begin
			for (c1=0; c1< 4; c1=c1+1) begin
				data_in <= {r1[7:0], c1[7:0], rnn1_m[r1][c1]};
				@(negedge clk)
				assert(dut.rnn_1.matrix[r1][c1] === rnn1_m[r1][c1]);
			end
		end

		write <= 0;
		#10;

		// ==========================================================
		// END RNN recurrent Matrix input test
		// ==========================================================

		@(negedge clk)
		write   <= 1;
		addr    <= 0;

		@(negedge clk)
		assert(dut.state === dut.state_t.BUSY);


		$stop;
	end
endmodule

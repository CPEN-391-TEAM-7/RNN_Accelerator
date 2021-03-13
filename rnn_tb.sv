
module rnn_tb();

	// ==========================================================
	// input embedding rom setup
	// ==========================================================
	embedding embedding_rom();


	// ==========================================================
	// rnn weight matrix rom setup
	// ==========================================================
	integer r0, c0;
	rnn_weights     rnn_weights_rom();


	// ==========================================================
	// recurrent rnn matrix rom setup
	// ==========================================================
	integer r1, c1;
	rnn_recurrent rnn_recurrent_rom();


	// ==========================================================
	// rnn bias rom
	// ==========================================================
	integer rb;
	rnn_bias	rnn_bias_rom();


	// ==========================================================
	// dense rom setup
	// ==========================================================
	dense dense_rom();


	// ==========================================================
	// RNN dut setup
	// ==========================================================
	logic 		 clk;
	logic 		 rst_n;
	logic 		 read;
	logic		 write;
	logic [31:0] addr;
	logic [31:0] data_in;
	logic [31:0] data_out;

	rnn dut(.*);
	// ==========================================================

	logic [15:0] dense_b;
	assign dense_b = 16'b1111111111110010;



	// ==========================================================
	// Task used to load easily embedding vectors 
	// ==========================================================
	task load_char(input int char);

		integer i;

		@(negedge clk)

		for(i = 0; i<4; i=i+1) begin
			@(negedge clk)
			write   <= 1;
			addr    <= 1;
			data_in <= {16'(i),embedding_rom.E[char][i]};
		end

		@(negedge clk)

		assert(dut.input_char.vector[0] == embedding_rom.E[char][0]);
		assert(dut.input_char.vector[1] == embedding_rom.E[char][1]);
		assert(dut.input_char.vector[2] == embedding_rom.E[char][2]);
		assert(dut.input_char.vector[3] == embedding_rom.E[char][3]);

		write <=0;

	endtask 
	// ==========================================================




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
		read    <= 0;
		#10;
		rst_n   <= 1;
		#10;


		// ==========================================================
		// START input vector test
		// ==========================================================
		load_char(0); // has assert statements built in
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

		for (r0=0; r0< 4; r0=r0+1) begin
			for (c0=0; c0< 32; c0=c0+1) begin
				data_in <= {r0[7:0], c0[7:0], rnn_weights_rom.W[r0][c0]};
				@(negedge clk)
				assert(dut.rnn_0.matrix[r0][c0] === rnn_weights_rom.W[r0][c0]);
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

		for (r1=0; r1< 32; r1=r1+1) begin
			for (c1=0; c1< 32; c1=c1+1) begin
				data_in <= {r1[7:0], c1[7:0], rnn_recurrent_rom.R[r1][c1]};
				@(negedge clk)
				assert(dut.rnn_1.matrix[r1][c1] === rnn_recurrent_rom.R[r1][c1]);
			end
		end

		write <= 0;
		#10;

		// ==========================================================
		// END RNN recurrent Matrix input test
		// ==========================================================



		// ==========================================================
		// START RNN bias input test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 4;

		for (rb=0; rb< 32; rb=rb+1) begin
			data_in <= {rb[15:0], rnn_bias_rom.RB[rb]};
			@(negedge clk)
			assert(dut.rnn_bias.vector[rb] === rnn_bias_rom.RB[rb]);
		end

		write <= 0;
		#10;
		$stop;
		/*
		// ==========================================================
		// END RNN bias input test
		// ==========================================================



		// ==========================================================
		// START Dense Layer input test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 5;

		for (dv=0; dv< 4; dv=dv+1) begin
			data_in <= {dv[15:0], dense_v[dv]};
			@(negedge clk)
			assert(dut.dense.vector[dv] === dense_v[dv]);
		end

		write <= 0;
		#10;
		// ==========================================================
		// END Dense Layer test
		// ==========================================================



		// ==========================================================
		// START Dense bias input test
		// ==========================================================

		@(negedge clk)
		write   <= 1;
		addr    <= 6;

		data_in <= {16'b0, dense_b};
		@(negedge clk)
		assert(dut.dense_bias === dense_b);

		write <= 0;
		#10;




		// ==========================================================
		// Start RNN test
		// ==========================================================

		@(negedge clk)
		write   <= 1;
		addr    <= 0;

		@(negedge clk)

		write  <=0;
		assert(dut.state === dut.START);

		// ==========================================================
		// Weight matrix multiply result test
		// ==========================================================
		@(posedge dut.weight_multiplier.ready)
		assert(dut.weight_multiplier.imm_vec.vector[0] === 16'(-14));
		assert(dut.weight_multiplier.imm_vec.vector[1] === 16'(-47));
		assert(dut.weight_multiplier.imm_vec.vector[2] === 16'(-56));
		assert(dut.weight_multiplier.imm_vec.vector[3] === 16'(3));

		// ==========================================================
		// Recurrent Matrix multiply result test
		// ==========================================================
		@(posedge dut.recurrent_multiplier.ready)
		assert(dut.recurrent_multiplier.imm_vec.vector[0] === 0);
		assert(dut.recurrent_multiplier.imm_vec.vector[1] === 0);
		assert(dut.recurrent_multiplier.imm_vec.vector[2] === 0);
		assert(dut.recurrent_multiplier.imm_vec.vector[3] === 0);

		wait(dut.state === dut.LOAD);
		assert(dut.hidden.vector[0] === 16'(-16));
		assert(dut.hidden.vector[1] === 16'(-49));
		assert(dut.hidden.vector[2] === 16'(-57));
		assert(dut.hidden.vector[3] === 16'(2));
		#10;

		// ==========================================================
		// Second input test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 1;
		data_in <= {16'b0,embed_v2[0]};
		@(negedge clk)
		assert (dut.input_char.vector[0] === embed_v2[0]);
		data_in <= {16'b1,embed_v2[1]};

		@(negedge clk)
		assert (dut.input_char.vector[1] === embed_v2[1]);
		write <=0;
		#10;


		// ==========================================================
		// Full multiply test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 0;

		@(negedge clk)

		write  <=0;

		// ==========================================================
		// Full multiply test results
		// ==========================================================
		@(posedge dut.weight_multiplier.ready)
		assert(dut.weight_multiplier.imm_vec.vector[0] === 16'(2));
		assert(dut.weight_multiplier.imm_vec.vector[1] === 16'(107));
		assert(dut.weight_multiplier.imm_vec.vector[2] === 16'(116));
		assert(dut.weight_multiplier.imm_vec.vector[3] === 16'(-21));

		@(posedge dut.recurrent_multiplier.ready)
		assert(dut.recurrent_multiplier.imm_vec.vector[0] === 16'( -169));
		assert(dut.recurrent_multiplier.imm_vec.vector[1] === 16'(-1077));
		assert(dut.recurrent_multiplier.imm_vec.vector[2] === 16'(   13));
		assert(dut.recurrent_multiplier.imm_vec.vector[3] === 16'( 1024));

		wait(dut.state === dut.LOAD);
		assert(dut.hidden.vector[0] === 16'(-169));
		assert(dut.hidden.vector[1] === 16'(-972));
		assert(dut.hidden.vector[2] === 16'( 128));
		assert(dut.hidden.vector[3] === 16'(1002));
		#10;

		// ==========================================================
		// Dense multiply and final result test
		// ==========================================================
		@(negedge clk)
		write   <= 1;
		addr    <= 7;

		@(negedge clk)

		write  <=0;

		wait(dut.state === dut.VALID);

		assert(dut.result === 16'd17595);

		#20;

		$stop;

		*/

	end
endmodule

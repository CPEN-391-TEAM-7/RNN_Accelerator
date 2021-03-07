
module rnn_tb();

	logic 		 clk;
	logic 		 rst_n;
	logic 		 read;
	logic		 write;
	logic [31:0] addr;
	logic [31:0] data_in;
	logic [31:0] data_out;

	rnn dut(.*);

	always begin
		#1 clk = 0;
		#1 clk = 1;
	end

	initial begin
		rst_n   <= 0;
		write   <= 0;
		addr    <= 0;
		data_in <= 0;
		#10;
		rst_n   <= 1;
		#10;
		// START input vector test
		@(negedge clk)
		write   <= 1;
		addr    <= 1;
		data_in <= {16'b0,16'd2};
		@(negedge clk)
		assert (dut.input_char.vector[0] === 16'd2);
		data_in <= {16'b1,16'(-3)};

		@(negedge clk)
		assert (dut.input_char.vector[1] === 16'(-3));
		write <=0;
		#10;
		// END input vector test

		// START RNN Matrix 1 test
		@(negedge clk)
		write   <= 1;
		addr    <= 2;

		data_in <= {8'd0,8'd0,16'd2};
		@(negedge clk)
		assert (dut.rnn_0.matrix[0][0] === 16'd2);

		data_in <= {8'd0,8'd1,16'(-10)};
		@(negedge clk)
		assert (dut.rnn_0.matrix[0][1] === 16'(-10));

		data_in <= {8'd0,8'd2,16'(-10)};
		@(negedge clk)
		assert (dut.rnn_0.matrix[0][2] === 16'(-10));

		data_in <= {8'd0,8'd3,16'd3};
		@(negedge clk)
		assert (dut.rnn_0.matrix[0][3] === 16'd3);

		data_in <= {8'd1,8'd0,16'd6};
		@(negedge clk)
		assert (dut.rnn_0.matrix[1][0] === 16'd6);

		data_in <= {8'd1,8'd1,16'd9};
		@(negedge clk)
		assert (dut.rnn_0.matrix[1][1] === 16'd9);

		data_in <= {8'd1,8'd2,16'd12};
		@(negedge clk)
		assert (dut.rnn_0.matrix[1][2] === 16'd12);

		data_in <= {8'd1,8'd3,16'd1};
		@(negedge clk)
		assert (dut.rnn_0.matrix[1][3] === 16'd1);


		write <= 0;
		#10;
		$stop;
	end
endmodule

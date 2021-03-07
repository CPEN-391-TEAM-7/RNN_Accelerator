
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
		@(negedge clk)
		write   <= 1;
		addr    <= 1;
		data_in <= {16'b0,16'(-1)};
		@(negedge clk)
		write   <= 0;
		#10;
		$stop;
	end
endmodule

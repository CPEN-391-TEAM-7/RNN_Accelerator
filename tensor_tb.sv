
module matrix_tb();

	logic        clk        ;
	logic        reset_n    ;
	logic        write      ;
	logic  [1:0] seli       ;
	logic  [3:0] selj       ;
	logic [15:0] param_in   ;

	logic [15:0] param_out  ;

	loader_2d dut(.*);

	always begin
		#1 clk = 0;
		#1 clk = 1;
	end

	initial begin 
		reset_n  = 0;
		write    = 0;
		seli     = 0;
		selj     = 0;
		param_in = 0; 
		#5;
		reset_n  = 1;
		param_in = 16'hDEAD;
		write    = 1;
		@(posedge clk)
		@(posedge clk)
		write    = 0;
		#4;
		seli = 1;
		@(negedge clk)
		seli = 0;
		#10;

		$stop;
	end

endmodule

module vector_tb();

	logic        clk        ;
	logic        reset_n    ;
	logic        write      ;
	logic  [3:0] sel        ;
	logic [15:0] param_in   ;

	logic [15:0] param_out  ;

	loader_1d dut(.*);

	always begin
		#1 clk = 0;
		#1 clk = 1;
	end

	initial begin 
		reset_n  = 0;
		write    = 0;
		sel      = 0;
		param_in = 0; 
		#5;
		reset_n  = 1;
		param_in = 16'hBEEF;
		write    = 1;
		@(posedge clk)
		@(posedge clk)
		write    = 0;
		#4;
		sel = 1;
		@(negedge clk)
		sel = 0;
		#10;

		$stop;
	end

endmodule
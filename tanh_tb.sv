module tanh_tb();

	logic signed [15:0] in, out, guess, difference;
	tanh dut(.*);

assign difference = (guess - out) >= 0 ? guess - out: out - guess;

	initial begin
in = 16'b1110_000000000000;
guess = 16'b1111_000011001101;
assert(difference <= 1);
#5;
in = 16'b1110_000110011010;
guess = 16'b1111_000100000000;
assert(difference <= 1);
#5;
in = 16'b1110_001100110100;
guess = 16'b1111_000100110100;
assert(difference <= 1);
#5;
in = 16'b1110_010011001101;
guess = 16'b1111_000101100111;
assert(difference <= 1);
#5;
in = 16'b1110_011001100111;
guess = 16'b1111_000110011010;
assert(difference <= 1);
#5;
in = 16'b1110_100000000000;
guess = 16'b1111_000111001101;
assert(difference <= 1);
#5;
in = 16'b1110_100110011010;
guess = 16'b1111_001000000000;
assert(difference <= 1);
#5;
in = 16'b1110_101100110100;
guess = 16'b1111_001000110100;
assert(difference <= 1);
#5;
in = 16'b1110_110011001101;
guess = 16'b1111_001001100111;
assert(difference <= 1);
#5;
in = 16'b1110_111001100111;
guess = 16'b1111_001100110100;
assert(difference <= 1);
#5;
in = 16'b1111_000000000000;
guess = 16'b1111_010000000000;
assert(difference <= 1);
#5;
in = 16'b1111_000110011010;
guess = 16'b1111_010011001101;
assert(difference <= 1);
#5;
in = 16'b1111_001100110100;
guess = 16'b1111_010110011010;
assert(difference <= 1);
#5;
in = 16'b1111_010011001101;
guess = 16'b1111_011001100111;
assert(difference <= 1);
#5;
in = 16'b1111_011001100111;
guess = 16'b1111_011100110100;
assert(difference <= 1);
#5;
in = 16'b1111_100000000000;
guess = 16'b1111_100000000000;
assert(difference <= 1);
#5;
in = 16'b1111_100110011010;
guess = 16'b1111_100110011010;
assert(difference <= 1);
#5;
in = 16'b1111_101100110100;
guess = 16'b1111_101100110100;
assert(difference <= 1);
#5;
in = 16'b1111_110011001101;
guess = 16'b1111_110011001101;
assert(difference <= 1);
#5;
in = 16'b1111_111001100111;
guess = 16'b1111_111001100111;
assert(difference <= 1);
#5;
in = 16'b0000_000000000000;
guess = 16'b0000_000000000000;
assert(difference <= 1);
#5;
in = 16'b0000_000110011001;
guess = 16'b0000_000110011001;
assert(difference <= 1);
#5;
in = 16'b0000_001100110011;
guess = 16'b0000_001100110011;
assert(difference <= 1);
#5;
in = 16'b0000_010011001100;
guess = 16'b0000_010011001100;
assert(difference <= 1);
#5;
in = 16'b0000_011001100110;
guess = 16'b0000_011001100110;
assert(difference <= 1);
#5;
in = 16'b0000_100000000000;
guess = 16'b0000_100000000000;
assert(difference <= 1);
#5;
in = 16'b0000_100110011001;
guess = 16'b0000_100011001100;
assert(difference <= 1);
#5;
in = 16'b0000_101100110011;
guess = 16'b0000_100110011001;
assert(difference <= 1);
#5;
in = 16'b0000_110011001100;
guess = 16'b0000_101001100110;
assert(difference <= 1);
#5;
in = 16'b0000_111001100110;
guess = 16'b0000_101100110011;
assert(difference <= 1);
#5;
in = 16'b0001_000000000000;
guess = 16'b0000_110000000000;
assert(difference <= 1);
#5;
in = 16'b0001_000110011001;
guess = 16'b0000_110011001100;
assert(difference <= 1);
#5;
in = 16'b0001_001100110011;
guess = 16'b0000_110110011001;
assert(difference <= 1);
#5;
in = 16'b0001_010011001100;
guess = 16'b0000_110111001100;
assert(difference <= 1);
#5;
in = 16'b0001_011001100110;
guess = 16'b0000_111000000000;
assert(difference <= 1);
#5;
in = 16'b0001_100000000000;
guess = 16'b0000_111000110011;
assert(difference <= 1);
#5;
in = 16'b0001_100110011001;
guess = 16'b0000_111001100110;
assert(difference <= 1);
#5;
in = 16'b0001_101100110011;
guess = 16'b0000_111010011001;
assert(difference <= 1);
#5;
in = 16'b0001_110011001100;
guess = 16'b0000_111011001100;
assert(difference <= 1);
#5;
in = 16'b0001_111001100110;
guess = 16'b0000_111100000000;
assert(difference <= 1);
#5;
	end
endmodule

module tanh( input  logic signed [15:0] in,
			 output logic signed [15:0] out);

logic 	  sign;
logic [15:0] x,y;

`define p0_25 16'b0000_010000000000
`define p0_5  16'b0000_100000000000
`define p0_7  16'b0000_101100110011
`define p1_0  16'b0001_000000000000
`define p1_2  16'b0001_001100110011
`define p2_4  16'b0010_011001100110

always_comb begin

	sign = (in<0);
	x = sign ? -in : in;

	if      (x < `p0_5) y = x;
	else if (x < `p1_2) y = (x/2) + `p0_25;
	else if (x < `p2_4) y = (x/8) + `p0_7;
	else                y = `p1_0;

	out = sign ? -y:y;  

end

endmodule

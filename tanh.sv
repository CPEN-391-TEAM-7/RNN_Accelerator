
module tanh( input  logic signed [15:0] in,
			 output logic signed [15:0] out);

logic 	  sign;
logic [15:0] x,y;

`define p0f25 16'b0000_010000000000
`define p0f5  16'b0000_100000000000
`define p0f7  16'b0000_101100110011
`define p1f0  16'b0001_000000000000
`define p1f2  16'b0001_001100110011
`define p2f4  16'b0010_011001100110

always_comb begin

	sign = (in<0);
	x = sign ? -in : in;


	if      (x < `p0f5) y = x;
	else if (x < `p1f2) y = (x/2) + `p0f25;
	else if (x < `p2f4) y = (x/8) + `p0f7;
	else              y = `p1f0;

	out = sign ? -y:y;  

end

endmodule

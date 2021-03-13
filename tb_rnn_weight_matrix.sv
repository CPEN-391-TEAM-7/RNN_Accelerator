module rnn_weights();

	logic [15:0] W[0:3][0:31];

	assign W[0][0]  = 16'b0000000000010110;
	assign W[0][1]  = 16'b1111111111010110;
	assign W[0][2]  = 16'b1111111110010011;
	assign W[0][3]  = 16'b1111111111110001;
	assign W[0][4]  = 16'b0000000000101100;
	assign W[0][5]  = 16'b1111111111101110;
	assign W[0][6]  = 16'b1111111111110000;
	assign W[0][7]  = 16'b0000000100111000;
	assign W[0][8]  = 16'b0000000000111100;
	assign W[0][9]  = 16'b0000000000010010;
	assign W[0][10] = 16'b0000000001100001;
	assign W[0][11] = 16'b0000000000011100;
	assign W[0][12] = 16'b0000000001000010;
	assign W[0][13] = 16'b0000000001010111;
	assign W[0][14] = 16'b0000000000011010;
	assign W[0][15] = 16'b0000000001000110;
	assign W[0][16] = 16'b1111111111111111;
	assign W[0][17] = 16'b0000000010011110;
	assign W[0][18] = 16'b1111111110010101;
	assign W[0][19] = 16'b1111111111110000;
	assign W[0][20] = 16'b1111111111111011;
	assign W[0][21] = 16'b0000000100010100;
	assign W[0][22] = 16'b1111111111101111;
	assign W[0][23] = 16'b1111111111001110;
	assign W[0][24] = 16'b0000000000101011;
	assign W[0][25] = 16'b1111111110000000;
	assign W[0][26] = 16'b1111111011011010;
	assign W[0][27] = 16'b1111111111010111;
	assign W[0][28] = 16'b1111111111100100;
	assign W[0][29] = 16'b0000000010111100;
	assign W[0][30] = 16'b1111111111100100;
	assign W[0][31] = 16'b1111111110111101;
	assign W[1][0]  = 16'b1111111111100111;
	assign W[1][1]  = 16'b0000000000101010;
	assign W[1][2]  = 16'b0000000001101111;
	assign W[1][3]  = 16'b0000000001111011;
	assign W[1][4]  = 16'b1111111111001100;
	assign W[1][5]  = 16'b1111111111111011;
	assign W[1][6]  = 16'b1111111111100011;
	assign W[1][7]  = 16'b1111111111101010;
	assign W[1][8]  = 16'b1111111111010111;
	assign W[1][9]  = 16'b0000000000100111;
	assign W[1][10] = 16'b1111111110010100;
	assign W[1][11] = 16'b0000000001001001;
	assign W[1][12] = 16'b1111111111111110;
	assign W[1][13] = 16'b1111111110100100;
	assign W[1][14] = 16'b0000000000100110;
	assign W[1][15] = 16'b1111111111010100;
	assign W[1][16] = 16'b0000000001011101;
	assign W[1][17] = 16'b1111111111010001;
	assign W[1][18] = 16'b1111111111011010;
	assign W[1][19] = 16'b1111111110111000;
	assign W[1][20] = 16'b1111111110110100;
	assign W[1][21] = 16'b0000000001011111;
	assign W[1][22] = 16'b0000000000111111;
	assign W[1][23] = 16'b1111111110100101;
	assign W[1][24] = 16'b0000000000100000;
	assign W[1][25] = 16'b1111111111111010;
	assign W[1][26] = 16'b0000000000000100;
	assign W[1][27] = 16'b1111111100111000;
	assign W[1][28] = 16'b1111111111001101;
	assign W[1][29] = 16'b0000000000100010;
	assign W[1][30] = 16'b1111111111011111;
	assign W[1][31] = 16'b1111111011110100;
	assign W[2][0]  = 16'b0000000000110100;
	assign W[2][1]  = 16'b1111111110110111;
	assign W[2][2]  = 16'b1111111111000001;
	assign W[2][3]  = 16'b0000000001111000;
	assign W[2][4]  = 16'b0000000000111010;
	assign W[2][5]  = 16'b1111111111101101;
	assign W[2][6]  = 16'b0000000001010001;
	assign W[2][7]  = 16'b0000000011000110;
	assign W[2][8]  = 16'b1111111100111111;
	assign W[2][9]  = 16'b1111111100100000;
	assign W[2][10] = 16'b1111111100111000;
	assign W[2][11] = 16'b0000000100001010;
	assign W[2][12] = 16'b1111111110101111;
	assign W[2][13] = 16'b1111111111110100;
	assign W[2][14] = 16'b1111111111110111;
	assign W[2][15] = 16'b1111111111000011;
	assign W[2][16] = 16'b0000000001010111;
	assign W[2][17] = 16'b0000000010011000;
	assign W[2][18] = 16'b1111111101110011;
	assign W[2][19] = 16'b1111111101100010;
	assign W[2][20] = 16'b1111111101010101;
	assign W[2][21] = 16'b0000000001110010;
	assign W[2][22] = 16'b1111111111100010;
	assign W[2][23] = 16'b0000000010101011;
	assign W[2][24] = 16'b0000000001001000;
	assign W[2][25] = 16'b1111111111010110;
	assign W[2][26] = 16'b1111111100110101;
	assign W[2][27] = 16'b0000000100010001;
	assign W[2][28] = 16'b1111111111101011;
	assign W[2][29] = 16'b1111111111111100;
	assign W[2][30] = 16'b1111111110001100;
	assign W[2][31] = 16'b1111111101101001;
	assign W[3][0]  = 16'b1111111111110011;
	assign W[3][1]  = 16'b1111111111011100;
	assign W[3][2]  = 16'b1111111010110001;
	assign W[3][3]  = 16'b1111111111001110;
	assign W[3][4]  = 16'b1111111101100010;
	assign W[3][5]  = 16'b1111111111111100;
	assign W[3][6]  = 16'b0000000000000000;
	assign W[3][7]  = 16'b1111111110001010;
	assign W[3][8]  = 16'b0000000010001101;
	assign W[3][9]  = 16'b0000000011001010;
	assign W[3][10] = 16'b0000001100100011;
	assign W[3][11] = 16'b1111111100010010;
	assign W[3][12] = 16'b0000000000101100;
	assign W[3][13] = 16'b0000000001001000;
	assign W[3][14] = 16'b0000000001100100;
	assign W[3][15] = 16'b0000000001001010;
	assign W[3][16] = 16'b0000000000111101;
	assign W[3][17] = 16'b1111111110011100;
	assign W[3][18] = 16'b1111111110101001;
	assign W[3][19] = 16'b0000000001111010;
	assign W[3][20] = 16'b1111111001101101;
	assign W[3][21] = 16'b1111111001001100;
	assign W[3][22] = 16'b1111111011011001;
	assign W[3][23] = 16'b1111111010010111;
	assign W[3][24] = 16'b0000000001001111;
	assign W[3][25] = 16'b1111111110000101;
	assign W[3][26] = 16'b1111111101000011;
	assign W[3][27] = 16'b1111111111010000;
	assign W[3][28] = 16'b0000000010111101;
	assign W[3][29] = 16'b0000000011101111;
	assign W[3][30] = 16'b1111111110010111;
	assign W[3][31] = 16'b0000000001101011;


endmodule
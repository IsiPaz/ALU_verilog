module and4(in1, in2, out);

	input [3:0] in1, in2;
	output[3:0] out;

	and a1(out[0], in1[0], in2[0]);
	and a2(out[1], in1[1], in2[1]);
	and a3(out[2], in1[2], in2[2]);
	and a4(out[3], in1[3], in2[3]);

endmodule

module and16(in1, in2, out);
	
	input [15:0] in1, in2;
	output[15:0] out;

	and4 a11(.in1(in1[3:0]), .in2(in2[3:0]), .out(out[3:0]));
	and4 a12(.in1(in1[7:4]), .in2(in2[7:4]), .out(out[7:4]));
	and4 a13(.in1(in1[11:8]), .in2(in2[11:8]), .out(out[11:8]));
	and4 a14(.in1(in1[15:12]), .in2(in2[15:12]), .out(out[15:12]));

endmodule

module or4(in1, in2, out);

	input [3:0] in1, in2;
	output[3:0] out;

	or a1(out[0], in1[0], in2[0]);
	or a2(out[1], in1[1], in2[1]);
	or a3(out[2], in1[2], in2[2]);
	or a4(out[3], in1[3], in2[3]);

endmodule

module or16(in1, in2, out);
	
	input [15:0] in1, in2;
	output[15:0] out;

	or4 a11(.in1(in1[3:0]), .in2(in2[3:0]), .out(out[3:0]));
	or4 a12(.in1(in1[7:4]), .in2(in2[7:4]), .out(out[7:4]));
	or4 a13(.in1(in1[11:8]), .in2(in2[11:8]), .out(out[11:8]));
	or4 a14(.in1(in1[15:12]), .in2(in2[15:12]), .out(out[15:12]));

endmodule


module mux3to8(in, in1, in2, in3, in4, in5, in6, in7, CK, select, out);

	input [15:0] in, in1, in2, in3, in4, in5, in6, in7;
	input [2:0]  select;
	input CK;

	output reg [15:0] out;

	always @(posedge CK) begin	
		case(select)
			3'b000:out = in;
			3'b001:out = in1;
			3'b010:out = in2;
			3'b011:out = in3;
			3'b100:out = in4;
			3'b101:out = in5;
			3'b110:out = in6;
			3'b111:out = in7;
		endcase
	end

endmodule

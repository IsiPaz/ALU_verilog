module alu16(inputR1, inputR2, instruction, CK, outputR, busy);

	input [15:0] inputR1, inputR2;
	input [2:0] instruction;
	input CK;

	output[15:0] outputR;
	output reg busy;

	reg [15:0] in1,in2;
	wire[3:0]  busyL;

	wire  [15:0] out, out1, out2, out3, out4, out5, out6;

	initial begin
		busy = 1'b0;
		in1  = 16'h0000;
		in2  = 16'h0000;
	end

	adder add(
		.in1(in1),
		.in2(in2),
		.CK(CK),
		.out(out),
		.busy(busyL[0])
	);

	complent com(
		.in(in1),
		.CK(CK),
		.out(out1),
		.busy(busyL[1])
	);

	muler mul(
		.in1(in1),
		.in2(in2),
		.CK(CK),
		.out(out2),
		.busy(busyL[2])
	);

	diver div(
		.in1(in1),
		.in2(in2),
		.CK(CK),
		.reminder(out3),
		.quotient(out4),
		.busy(busyL[3])
	);

	and16 and1(in1,in2, out5);
	or16 or1(in1,in2, out6);

	mux3to8 outp(
		.in(out),
		.in1(out1),
		.in2(out2),
		.in3(out3),
		.in4(out4),
		.in5(out5),
		.in6(out6),
		.in7(16'h0000),
		.CK(CK),
		.select(instruction),
		.out(outputR)
	);
	//Just wire all output of operater together.
	
	always @(posedge CK) begin
		if(busy == 1'b0) begin
			in1  = inputR1;
			in2  = inputR2;
			//If the alu is free ,then get new input.
		end

		busy = busyL[0] | busyL[1] | busyL[2] | busyL[3];
		//Or all busyline.
	end

endmodule

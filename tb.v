module tb;

	reg [15:0] in1, in2;
	reg [2:0]  instruction;
	wire[15:0] out;
	reg CK;
	wire busy;

	initial begin
		$dumpfile("wave.vcd");
        $dumpvars;
		in1 <= 16'h000a; //1111000100110010
		in2 <= 16'h0009; //1110100000100101
		instruction = 3'b011;
		CK  = 1'b0;
	end

	alu16 al(
		.inputR1(in1),
		.inputR2(in2),
		.instruction(instruction),
		.CK(CK),
		.outputR(out),
		.busy(busy)
	);

	always begin #5 CK = ~CK; end

	initial begin
		$monitor("The output is: %d busy: %b ", out, busy);
	end

endmodule

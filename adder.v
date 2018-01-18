module complent(in, CK, out, busy);

	input  [15:0] in;
	input  CK;
	output reg [15:0] out;
	output reg busy;

	reg [15:0] m, c;

	initial begin
		m = 16'h0000;
		c = 16'h0000;
		out  = 16'h0000;
		busy = 1'b0;
	end

	always@(posedge CK) begin

		if(busy == 1'b0) begin
			//Initial all the value.
			//The out is already the complent number.
			//But if we want to get 2's we need to add 1 after get complent number.
			m    = 16'h0001;
			out  = 16'hffff ^ in;
			busy = 1'b1;
		end

		if(m == 16'h0000)
			busy = 1'b0;
		else begin
			c   = out & m;
			out = out ^ m;
			m   = c << 1;
			//Get the carry number and shift.
		end
	end

endmodule

module adder(in1, in2, CK, out, busy);

	input [15:0] in1, in2;
	input CK;
	output reg [15:0] out;
	output reg busy;

	reg [15:0] cc,m;
	
	initial begin
		out = 16'h0000;
		cc  = 16'h0000;
		m   = 16'h0000;
		busy= 1'b0;
	end

	always@(posedge CK) begin

		if(busy == 1'b0) begin
		//Initial the variable when first step.
			out = in1 ^ in2; 
			cc  = in1 & in2;
			cc  = cc << 1;
			m   = 16'h0000;
			busy= 1'b1;
		end

		if(cc == 16'h0000)
			busy = 1'b0;
		else begin
			m   = out & cc;
			out = out ^ cc;
			cc  = m << 1;
			//Get the carry number and shift.
		end

	end 

endmodule

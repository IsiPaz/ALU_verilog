module muler(in1, in2, CK, out, busy);

	input		[15:0] in1, in2;
	input  		CK;
	
	output reg	[15:0] out;
	output reg  busy;

	reg[15:0] m1, m2;

	initial begin
		m1 = 16'h0000;
		m2 = 16'h0000;
		out= 16'h0000;
		busy = 1'b0;
	end

	always @(posedge CK) begin

		if(busy == 1'b0) begin
			//Initial all the variable.
			m1   = in1;
			m2   = in2;
			out  = 16'h0000;
			busy = 1'b1;
		end
		
		if(m2[0] == 1'b1) 
			out = out + m1;
		//If the last bit of m2 is 1, add the m1 to out.

		m1 = m1 << 1;
		m2 = m2 >> 1;

		if(m2 == 16'b0000) 
				busy = 1'b0;
		//Set the busy to zero , if all done.
	end

endmodule 

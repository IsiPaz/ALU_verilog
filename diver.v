module diver(in1, in2, CK, reminder, quotient, busy);

	input [15:0] in1, in2;
	input CK;

	output reg [15:0] reminder, quotient;
	output reg busy;

	reg [31:0] m1, m2;
	reg [15:0] divisor;
	reg [5:0]  cnt;

	initial begin
		reminder = 16'h0000;
		quotient = 16'h0000;
		divisor	 = 16'h0000;
		m1		 = 32'h00000000;
		m2		 = 32'h00000000;
		cnt		 = 5'b00000;
		busy	 = 1'b0;
	end

	always @(posedge CK) begin

		if(busy == 1'b0) begin
		//Initial all the variable.
			m1       = {16'h0000, in1};
			m2       = {in2, 16'h0000};
			//m2 can make the diver implement like muler do.
			divisor  = in2;
			reminder = 16'h0000;
			quotient = 16'h0000;
			busy     = 1'b1;
			cnt      = 5'b00000;
		end

		if(cnt < 5'b10001) begin
			if(m1[31:16] >= divisor) 
				m1 = m1 - m2 + 1'b1;
			else 
				m1 = m1;
			//If the left half 16 bits smaller than divisor, let m1 subtract m2.
				
			m1 = m1 << 1;
			cnt = cnt + 1'b1;
			//Move left and counter increase.
		end
		else 
			busy = 1'b0;

		if(cnt == 5'b10000) begin
			if(m1[31:16] >= divisor) 
				m1 = m1 - m2 + 1'b1;
			else 
				m1 = m1;
			//Final exam for m1.

			reminder = m1[31:16];
			quotient = m1[15:0];
		end
	end

endmodule

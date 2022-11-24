module is_ne_32bit(out, in1, in2);
	output out;
	input[31:0] in1, in2;

	wire[31:0] w;

	// finding if the two inputs are different
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : comparing
			xor ai(w[i], in1[i], in2[i]);
		end
	endgenerate 
	
	wire[31:0] w2;
	
	//Checking if w consists 1 
	and a0 (w2[0], w[0], w[0]);
	
	genvar j;
	generate
		for(j=1; j<32; j = j+1) begin : find1
			or aj(w2[j], w[j], w2[j-1]);
		end
	endgenerate
		
	and finding_output (out, w2[31], w2[31]);
		
endmodule 
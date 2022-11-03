module is_ne(out, in1, in2);
	output out;
	input[4:0] in1, in2;

	wire[4:0] w;

	// finding if the two inputs are different
	genvar i;
	generate
		for(i=0; i<5; i = i+1) begin : comparing
			xor ai(w[i], in1[i], in2[i]);
		end
	endgenerate 
	
	wire[4:0] w2;
	
	//Checking if w consists 1 
	and a0 (w2[0], w[0], w[0]);
	
	genvar j;
	generate
		for(j=1; j<5; j = j+1) begin : find1
			or aj(w2[j], w[j], w2[j-1]);
		end
	endgenerate
		
	and finding_output (out, w2[4], w2[4]);
		
endmodule 
module sign_extension_27bit(out, in);
	input[26:0] in;
	output[31:0] out;
	
	genvar i;
	generate
		for(i=27; i<32; i = i+1) begin : extend
			and ai(out[i], in[26], in[26]);
		end
	endgenerate 
	
	genvar j;
	generate
		for( j =0; j <27; j= j+1) begin : initalize
			and(out[j], in[j], in[j]);
		end
	endgenerate
	
endmodule
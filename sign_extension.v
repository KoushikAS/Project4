module sign_extension(out, in);
	input[16:0] in;
	output[31:0] out;
	
	genvar i;
	generate
		for(i=17; i<32; i = i+1) begin : extend
			and ai(out[i], in[16], in[16]);
		end
	endgenerate 
	
	genvar j;
	generate
		for( j =0; j <17; j= j+1) begin : initalize
			and(out[j], in[j], in[j]);
		end
	endgenerate
	
endmodule
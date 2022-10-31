module sign_extension(out, in);
	input[15:0] in;
	output[31:0] out;
	
	genvar i;
	generate
		for(i=16; i<32; i = i+1) begin : extend
			and ai(out[i], in[15], in[15]);
		end
	endgenerate 
	
endmodule
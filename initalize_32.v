module initalize_32(out, in);
	output[31:0] out;
	input[31:0] in;
	
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : initiali
			and ai(out[i], in[i], 1'b1);
		end
	endgenerate 
	
endmodule 
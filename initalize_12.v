module initalize_12(out, in);
	output[11:0] out;
	input[11:0] in;
	
	genvar i;
	generate
		for(i=0; i<12; i = i+1) begin : initiali
			and ai(out[i], in[i], 1'b1);
		end
	endgenerate 
	
endmodule 
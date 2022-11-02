module initalize(out, in);
	output[4:0] out;
	input[4:0] in;
	
	genvar i;
	generate
		for(i=0; i<5; i = i+1) begin : initiali
			and ai(out[i], in[i], 1'b1);
		end
	endgenerate 
	
endmodule 
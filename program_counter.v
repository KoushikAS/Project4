module program_counter(out, in, clk, enable, clr, prev_out);

   input[11:0] in;
	input clk, enable, clr;
	output[11:0] out;
	output[11:0] prev_out;
 
	genvar i;
	generate
		for(i=0; i<12; i = i+1) begin : intialize
			dffe_ref df (out[i], in[i], clk, enable, clr);
		end
	endgenerate 
	
	genvar j;
	generate
		for(j=0; j<12; j = j+1) begin : prev_intialize
			dffe_ref df_prev (prev_out[j], out[j], clk, enable, clr);
		end
	endgenerate 
	
endmodule 
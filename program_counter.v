module program_counter(out, in, clk, enable, clr);

   input[11:0] in;
	input clk, enable, clr;
	output[11:0] out;
 
	genvar i;
	generate
		for(i=0; i<12; i = i+1) begin : intialize
			dffe_ref df (out[i], in[i], clk, enable, clr);
		end
	endgenerate 
	
endmodule 
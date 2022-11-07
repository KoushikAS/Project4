module pc_adder(out,in1);
	input[11:0] in1;
	output[11:0] out;
	wire[11:0] w;
	
	fulladder fa3(w[0], out[0], in1[0], 1'b1, 1'b0);
	genvar i;
	generate
		for(i=1; i<12; i = i+1) begin : intialize
			fulladder fa (w[i], out[i], in1[i], 1'b0, w[i-1]);
		end
	endgenerate 
	
endmodule 
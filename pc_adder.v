module pc_adder(out,in1);
	input[11:0] in1;
	output[11:0] out;
	wire[11:0] w;
	
	fulladder fa3(w[1], out[1], in1[1], 1'b1, 1'b0);
	genvar i;
	generate
		for(i=2; i<12; i = i+1) begin : intialize
			fulladder fa (w[i], out[i], in1[i], 1'b0, w[i-1]);
		end
	endgenerate 
	
endmodule 
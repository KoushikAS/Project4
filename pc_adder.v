module pc_adder(out,in1);
	input[11:0] in1;
	output[11:0] out;
	wire[11:0] w;
	
	and a1(out[0], in1[0], in1[0]);
	and a2(out[1], in1[1], in1[1]);
	fulladder fa3(w[2], out[2], in1[2], 1'b1, 1'b0);
	genvar i;
	generate
		for(i=3; i<12; i = i+1) begin : intialize
			fulladder fa (w[i], out[i], in1[i], 1'b0, w[i-1]);
		end
	endgenerate 
	
endmodule 
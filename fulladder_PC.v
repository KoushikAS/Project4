module fulladder_PC(out,in1);
	input[11:0] in1;
	output[31:0] out;
	wire [31:0] c;

	fulladder fa0(c[0], out[0], in1[0], 1'b0, 1'b1);
	genvar i;
	generate
		for(i=1; i<12; i = i+1) begin : intializei
			fulladder fai (c[i], out[i], in1[i], 1'b0, c[i-1]);
		end
	endgenerate 
	genvar j;
	generate
		for(j=12; j<32; j = j+1) begin : intializej
			fulladder faj (c[j], out[j], 1'b0, 1'b0, c[j-1]);
		end
	endgenerate
		
endmodule 
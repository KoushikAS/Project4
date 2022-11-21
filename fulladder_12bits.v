module fulladder_12bits(cout, out,in1, in2,cin);
	input[11:0] in1,in2;
	input cin;
	output[11:0] out;
	output cout;
	wire [11:0] c;

	fulladder fa0(c[0], out[0], in1[0], in2[0], cin);
	genvar i;
	generate
		for(i=1; i<11; i = i+1) begin : intialize
			fulladder fai (c[i], out[i], in1[i], in2[i], c[i-1]);
		end
	endgenerate 
	fulladder fa11(cout, out[11], in1[11], in2[11], c[10]);
	
endmodule 
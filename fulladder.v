module fulladder(cout, out,in1, in2,cin);
	input in1,in2,cin;
	output cout,out;
	wire w1, w2, w3;
	
	xor x1 (w1,in1,in2);
	xor x2 (out, w1, cin);
	
	and a1 (w2,w1,cin);
	and a2 (w3,in1,in2);
	or o1 (cout,w2,w3);
	
endmodule 
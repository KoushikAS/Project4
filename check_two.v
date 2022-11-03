module check_two(out, in1, in2, in3, in4);
	input[4:0] in1, in2, in3, in4;
	output out;
	
	wire w1, w2, w3, w4;
	
	is_ne compare1 (w1, in1, in2);
	is_ne compare2 (w2, in3, in4);
	
	not n1 (w3, w1);
	not n2 (w4, w2);
	
	and output_comparision(out, w3, w4);
	
endmodule 
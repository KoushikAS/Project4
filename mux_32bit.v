module mux_32bit(out, s, in0, in1);
	input[31:0] in0, in1;
	output[31:0] out;
	input s;
	
	wire snot;
	wire[31:0] w1,w2;
	
	not n1(snot,s);
		
		
	// First And Gate for 0th poistion
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : andgate1
			and ai (w1[i],in0[i],snot);
		end
	endgenerate
	
	// Second And Gate for 1st poistion	
	genvar j;
	generate
		for(j=0; j<32; j = j+1) begin : andgate2
			and aj (w2[j],in1[j], s);
		end
	endgenerate
	
	
	//Final Or Gate
	genvar k;
	generate
		for(k=0; k<32; k = k+1) begin : orgate
			or ok (out[k],w1[k],w2[k]);
		end
	endgenerate 
	
endmodule 
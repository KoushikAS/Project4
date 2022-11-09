module reg_32(q, d, clk, en, clr);

   //Inputs
   input[31:0] d;
	input clk, en, clr;
   
   //Internal wire
   wire clr;

   //Output
   output[31:0] q;

	
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : intialize
			dffe_ref df (q[i], d[i], clk, en, clr);
		end
	endgenerate 
	

endmodule 
module check_overflow(out_data, out_reg, in_data, in_reg, overflow, is_add_rtype, is_sub_rtype, is_add_i);
	output[31:0] out_data;
	output[4:0] out_reg;
	input[31:0] in_data;
	input[4:0] in_reg;
	input overflow, is_add_rtype, is_sub_rtype, is_add_i;
	
	
	wire[31:0] w1, w2;
	
	wire w3, w4, w5;
	
	and a1 (w3, is_add_rtype, overflow);
	and a2 (w4, is_add_i, overflow);
	and a3 (w5, is_sub_rtype, overflow);
	
	mux_32bit m1 (w1, w3, in_data, 32'd1);
	mux_32bit m2 (w2, w4, w1, 32'd2);
	mux_32bit m3 (out_data, w5, w2, 32'd3);
	
	wire w6, w7;
	
	or o1 (w6, is_add_rtype, is_sub_rtype, is_add_i);
	and a4 (w7, w6, overflow);

	assign out_reg = w7 ? 5'd30 : in_reg;
	
	
endmodule 
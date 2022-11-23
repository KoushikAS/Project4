module check_overflow(out_data, out_reg, in_data, in_reg, overflow, is_add_rtype, is_sub_rtype, is_add_i, address_imem, is_not_jal);
	output[31:0] out_data;
	output[4:0] out_reg;
	input[31:0] in_data;
	input[4:0] in_reg;
	input overflow, is_add_rtype, is_sub_rtype, is_add_i,is_not_jal;
	input[11:0] address_imem;
	
	wire[31:0] w1, w2;
	
	wire w3, w4, w5, w8;
	
	and a1 (w3, is_add_rtype, overflow);
	and a2 (w4, is_add_i, overflow);
	and a3 (w5, is_sub_rtype, overflow);
	
	mux_32bit m1 (w1, w3, in_data, 32'd1);
	mux_32bit m2 (w2, w4, w1, 32'd2);
	mux_32bit m3 (w8, w5, w2, 32'd3);
	
	wire[31:0] pc_adder;
	
	fulladder_PC pc_plusone(pc_adder, address_imem);
	mux_32bit m4 (out_data, is_not_jal, pc_adder, w8);
	
	wire w6, w7;
	wire[4:0]	w9;
	
	or o1 (w6, is_add_rtype, is_sub_rtype, is_add_i);
	and a4 (w7, w6, overflow);

	assign w9 = w7 ? 5'd30 : in_reg;
	assign out_reg = is_not_jal ? w9: 5'd31;
	
endmodule 
module pc_adder(out,in1, t, n, is_not_eq, is_less_than, is_not_jtype , is_not_jal, is_not_jr, is_bne, is_blt, rd);
	input[11:0] in1;
	input[26:0] t;
	input[16:0] n;
	input is_not_eq, is_less_than ,is_not_jtype, is_bne, is_blt, is_not_jal, is_not_jr;
	input[31:0] rd;
	output[11:0] out;
	wire[11:0] w1, w2, tmp1, tmp2;
	wire tmp, is_bne_true, is_blt_true, is_add_N, is_t;
	
	and a1(is_bne_true, is_bne, is_not_eq);
	and a2(is_blt_true, is_blt, is_less_than);
	
	or o1(is_add_N, is_bne_true, is_blt_true);
	
	assign w1 = is_add_N ? n[11:0] : 12'd0 ; 
	
	fulladder_12bits f1(tmp, w2, in1, w1, 1'b1);
	
	assign tmp1 =is_not_jtype ? w2[11:0] : t[11:0];
	assign tmp2 =is_not_jal ? tmp1[11:0] : t[11:0];
	assign out =is_not_jr ? tmp2[11:0] : rd[11:0];
	
endmodule 
module pc_adder(out,in1, t, n, is_not_eq, is_less_than, is_not_jtype , is_not_jal, is_not_jr,is_not_bex, is_bne, is_blt, regB);
	input[11:0] in1;
	input[26:0] t;
	input[16:0] n;
	input is_not_eq, is_less_than ,is_not_jtype, is_bne, is_blt, is_not_jal, is_not_jr, is_not_bex;
	input[31:0] regB;
	output[11:0] out;
	wire[11:0] w1, w2, w3;
	wire tmp, is_bne_true, is_blt_true, is_add_N, is_t, is_jtype, is_jal, is_bex, is_not_zero, is_bex_t;
	
	and a1(is_bne_true, is_bne, is_not_eq);
	and a2(is_blt_true, is_blt, is_less_than);
	
	or o1(is_add_N, is_bne_true, is_blt_true);
	
	assign w1 = is_add_N ? n[11:0] : 12'd0 ; 
	
	fulladder_12bits f1(tmp, w2, in1, w1, 1'b1);
	
	not isJTYPE(is_jtype, is_not_jtype);
	not isJAL(is_jal, is_not_jal);
	is_ne_32bit checkrstatus0(is_not_zero, regB, 32'd0);
	not isBEX(is_bex, is_not_bex);
	and (is_bex_t, is_bex, is_not_zero);

	
	or isT(is_t, is_jtype, is_jal, is_bex_t);
	
	assign w3 =is_t ? t[11:0] : w2[11:0] ;
	assign out =is_not_jr ? w3[11:0] : regB[11:0];
	
endmodule 
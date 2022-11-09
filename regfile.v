module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	wire[31:0] w[31:0];
	wire[31:0] en1,en2,en3;
	wire[31:0] tmp;
	
	
	//write
	
	reg_32 rew (w[0], data_writeReg, clock, 1'b0, 1'b1);	
	
	decoder5_32 d1 (ctrl_writeReg,en1[0],en1[1],en1[2],en1[3],en1[4],en1[5],en1[6],en1[7],en1[8],en1[9],
	en1[10],en1[11],en1[12],en1[13],en1[14],en1[15],en1[16],en1[17],en1[18],en1[19],
	en1[20],en1[21],en1[22],en1[23],en1[24],en1[25],en1[26],en1[27],en1[28],en1[29],
	en1[30],en1[31]);
	
	genvar i;
	generate
		for(i=1; i<32; i = i+1) begin : write
		and a (tmp[i],en1[i],ctrl_writeEnable);
		reg_32 rew (w[i], data_writeReg, clock, tmp[i], ctrl_reset);
		end
	endgenerate  

	
	//read1
	decoder5_32 d2 (ctrl_readRegA,en2[0],en2[1],en2[2],en2[3],en2[4],en2[5],en2[6],en2[7],en2[8],en2[9],
	en2[10],en2[11],en2[12],en2[13],en2[14],en2[15],en2[16],en2[17],en2[18],en2[19],
	en2[20],en2[21],en2[22],en2[23],en2[24],en2[25],en2[26],en2[27],en2[28],en2[29],
	en2[30],en2[31]);
	
	genvar j;
	generate
		for(j=0; j<32; j = j+1) begin : read1
			//bufif1  b1 (data_readRegA, w[j], t1[j]);
			assign data_readRegA = en2[j] ? w[j] : 32'bz;
		end
	endgenerate 
	

	//read2
	decoder5_32 d3 (ctrl_readRegB,en3[0],en3[1],en3[2],en3[3],en3[4],en3[5],en3[6],en3[7],en3[8],en3[9],
	en3[10],en3[11],en3[12],en3[13],en3[14],en3[15],en3[16],en3[17],en3[18],en3[19],
	en3[20],en3[21],en3[22],en3[23],en3[24],en3[25],en3[26],en3[27],en3[28],en3[29],
	en3[30],en3[31]);
	
	genvar k;
	generate
		for(k=0; k<32; k = k+1) begin : read2
			//bufif1  b2 (data_readRegB, w[k], t2[k]);
			assign data_readRegB = en3[k] ? w[k] : 32'bz;
		end
	endgenerate 
	

endmodule 
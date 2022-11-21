/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB,                   // I: Data from port B of regfile
	 is_not_eq,
	 is_bne
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */


	wire is_not_rtype, is_not_load ,is_not_store, is_add_rtype, is_sub_rtype, is_add_i;
	wire 	is_not_jtype, is_blt, is_not_bne, is_not_blt, is_bne_blt, is_regb_rd;
	output is_bne;
	
	is_ne isNotRType(is_not_rtype, q_imem[31:27], 5'b00000);
	is_ne isNotLoad(is_not_load, q_imem[31:27], 5'b01000);
	is_ne isNotStore(is_not_store, q_imem[31:27], 5'b00111);
	is_ne isNotJType(is_not_jtype, q_imem[31:27], 5'b00001);
	is_ne isNotBNE(is_not_bne, q_imem[31:27], 5'b00010);
	is_ne isNotBLT(is_not_blt, q_imem[31:27], 5'b00110);
	
	check_two isADD_Rtype(is_add_rtype, q_imem[31:27], 5'b00000 , q_imem[6:2], 5'd0);
	check_two isSUB_Rtype(is_sub_rtype, q_imem[31:27], 5'b00000 , q_imem[6:2], 5'd1);
	check_two isADD_Itype(is_add_i, q_imem[31:27], 5'b00101, q_imem[31:27], 5'b00101);
	check_two isBNE_type(is_bne, q_imem[31:27], 5'b00010, q_imem[31:27], 5'b00010);
	check_two isBLT_type(is_blt, q_imem[31:27], 5'b00110, q_imem[31:27], 5'b00110);
	or is_BNE_OR_BLT(is_bne_blt, is_bne, is_blt);	
	or is_REGB_RD(is_regb_rd, is_bne_blt, is_not_store);
	 /* Level 1 for Program counter */
	
	 wire[11:0] pc_in;
	 wire[4:0] dest_reg;
	 output is_not_eq;
	 wire is_less_than, overflow;
	
	 program_counter pc (address_imem, pc_in, clock, 1'b1, reset);
	 pc_adder padd(pc_in, address_imem, q_imem[26:0], q_imem[16:0], is_not_eq, is_less_than, is_not_jtype, is_bne, is_blt);
	 
	 /* Level 2 Reg file*/
	 
	 wire[4:0] regB_in;
	 mux_5bit rt_mux (regB_in, is_regb_rd, q_imem[26:22], q_imem[16:12] ); //checking for rd incase of store. 
	 
	 initalize rs (ctrl_readRegA, q_imem[21:17]); //initalizing rs (i.e. ctrl_readRegA)	 
	 initalize rt (ctrl_readRegB, regB_in); //initalizing rt (i.e. ctrl_readRegB)
	 initalize rd (dest_reg, q_imem[26:22]); //initalizing rd (i.e. dest_reg)
	 
	 and reg_write_enable (ctrl_writeEnable, is_not_store, is_not_jtype, is_not_bne, is_not_blt); 
	
	 /* Level 3 ALU */
	 
	 wire[31:0] alu_out, immed, alu_in2, overflow_out, tmp_in2;
	 wire[4:0] alu_opcode;

	
	 sign_extension si(immed, q_imem[16:0]);
	 
	 assign tmp_in2 = is_not_rtype? immed: data_readRegB; 		//chosing the right input for alu  
	 assign alu_in2 = is_bne_blt? q_imem[26:22]: tmp_in2; 		//chosing the right input for alu  
	 assign alu_opcode = is_not_rtype? 5'd0: q_imem[6:2]; 	//chosing the right op code for alu
	 
	 
	 alu a1(data_readRegA, alu_in2, alu_opcode, q_imem[11:7], alu_out, is_not_eq, is_less_than, overflow);
	 check_overflow  checkingoverflow (overflow_out, ctrl_writeReg, alu_out, dest_reg, overflow, is_add_rtype, is_sub_rtype, is_add_i);
	
	 /* Level 4 Data memory*/	
	 initalize_12 dm_address(address_dmem, overflow_out[11:0]);	//initalize dm_address->address_dmem	 
	 mux_32bit data_mem(data_writeReg, is_not_load, q_dmem, overflow_out);
	 
	 not dmem_write_enable (wren, is_not_store);					//initalizing wren
	 initalize_32 dmaddress_data(data, data_readRegB);			//initalizing dm_address->data
	 
	
	 
endmodule 
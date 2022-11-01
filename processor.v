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
    data_readRegB                   // I: Data from port B of regfile
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
	 
	 wire [31:0] tmp1, tmp7,tmp10;
	 wire tmp2, tmp3, tmp4, tmp5, tmp6, tmp8, tmp9,tmp11, tmp12;
	 wire is_not_rtype, is_not_load ,is_not_store;
	 alu isNotRType(q_imem[31:27], 5'b00000, 5'b00001, 5'b00000, tmp1, is_not_rtype, tmp2, tmp3);
	 alu isNotLoad(q_imem[31:27], 5'b01000, 5'b00001, 5'b00000, tmp7, is_not_load, tmp8, tmp9);
	 alu isNotStore(q_imem[31:27], 5'b00111, 5'b00001, 5'b00000, tmp10, is_not_store, tmp11, tmp12);
	 
	 /* Level 1 for Program counter */
	
	 wire[11:0] pc_in;
	
	 program_counter pc (address_imem, pc_in, clock, 1'b1, reset);
	 pc_adder padd(pc_in, address_imem);
	 
	 /* Level 2 Reg file*/
	 
	 and rs (ctrl_readRegA, q_imem[21:17], 1'b1);
	 and rt (ctrl_readRegB, q_imem[16:12], 1'b1);
	 and rd (ctrl_writeReg, q_imem[26:22], 1'b1);	 
	 
	 and reg_write_enable (ctrl_writeEnable, is_not_store, is_not_store); 
	
	 /* Level 3 ALU */
	 
	 wire[31:0] alu_out, immed, alu_in2;
	
	 sign_extension si(immed, q_imem[15:0]);
	 
	 mux_32bit min2(alu_in2, is_not_rtype, data_readRegB, immed);
	 alu a1(data_readRegA, alu_in2, q_imem[6:2], q_imem[11:7], alu_out, tmp4, tmp5, tmp6);
	
	 /* Level 4 Data memory*/	
	 and dm_address (address_dmem, alu_out[11:0], alu_out[11:0]);	 
	 mux_32bit data_mem(data_writeReg, is_not_load, q_dmem, alu_out);
	 
	 not dmem_write_enable (wren, is_not_store);
	 and dmem_data (data, data_readRegB, data_readRegB);
	 
endmodule
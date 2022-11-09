Simple Processor -- R-type and I-type

Team
Name: Koushik Annareddy Sreenath  Net Id: ka266
Name: Shravan Mysore Seetharam  Net Id:sm952


Design of processor:

Level 1: 
  We are incrementing the counter each cycle by 1 since we need to go to the next counter. To do thi we are maintaing a d flip flop in program_counter and incrementing using pc_adder
  
Level 2:
  In this level we are finding the registors to read and write from(i.e. read reg1, read reg2 and destination reg) and setting the write enable.
  Read reg 1 is always coming from instruction set (i.e. 21 bits to 17 bits)
  destination reg is always coming from instruction set (i.e. 25 bits to 22 bits)
  Read reg 2 can vary if the instruction set is store. Therefore if the instruction set is store then fetch 16 to 12 bits. else fetch 26 to 22.
  
  write is always enabled except when the instruction set is store.

Level 3:
  In this level we need to check to get alu output and check if there is a overflow and change values correspondingly. 
  
  For ALU
  input1 is always data from reg1. 
  input2 can depend on if the instruction type is R or I type 
  ALU opcode is set to the value given by instruciton set for R. otherwise it is set to ADD (i.e. 00000)
  shamt is always set by the values given in instruciton set. (since for non r type we are hardcoding the ALU opcode to 00000 it does not matter)
  
  Once we get an output from ALU we need to check overflow and set the values of ctr_writeReg and output the coressponding write registors. 
  
 Level 4:
  Check if the instruction set is store and set wren 1. 
  From the output from previous level set the data initalize address_dmem.
  if the output is load set the ctrl_writereg from dmem_data otherwise set it to value from output from previous level. 
  
  
  Design of Clock
    We have set processor clock and imem clock to be slow, since we want to allow some time for the instruction set to be updated properly
    We have set the dmem clock and reg clock as inverted to the main clock, because we wanted to the instruction set to update properly and all the necessary operations to be done before updating to registor or dmem. 
    
    
 -----------------------------------------------------------------------------------
 Files used 
 reg_32.v-> contains 32 d flipflop
 decoder5_32.v -> is used as a decoder by regfile.v to select readRegA and readRegB from the 32 registors.
 refile.v -> is used to write and read values from registors. 
 program_counter.v-> is used to store the current instrction address. 
 fulladder.v -> is used as a full adder 
 imem.v-> stores all the instructions. (generated)
 dffe.v -> is the d flip flop
 alu.v -> is the alu file used to do all the operations. (provided as reference)
 skeleton.v -> wrapper class contianing the different clocks and connecting imem dmem and regfile with processor. 
 processor.v -> contians the main logic
 dmem.v -> is the memory set (generated)
 pc_adder.v -> is used to increment the value of instuction address by 1
 sign_extension.v-> this value is used to create a 32 bit output for alu 2 for I type instructions. 
 mux_32bit -> is a mux for 32 bits data input.
 extend_clock -> is used to  create a clock by reducing the frequency. (i.e. make the clock slower)
 invert_clock -> is used to invert the clock(i.e posedge will be negedge, negedge will be posedge)
 initalize.v -> since we can't use behavioural verilog. copying the value using and gate for 5 bits. 
 initalize_12.v -> since we can't use behavioural verilog. copying the value using and gate for 12 bits. 
 initalize_32.v -> since we can't use behavioural verilog. copying the value using and gate for 32 bits. 
 processor_tb.v -> the test bench used for testing. 
 is_ne.v-> is used to check if both the inputs are equal. (needed for finding the type of instruction)
 check_two -> is used to give true if both the comparisions are equal.  (needed for finding the type of instruciton )
 check_overflow.v -> it used to select the alu_output or 1( incase of overflow and add), 2( incase of overflow and addI), 3( incase of overflow and sub). this is done by using 3 mux and passing one after the other. 
 mux_5bit.v -> is used a mux for 5 bit input. 
 
 

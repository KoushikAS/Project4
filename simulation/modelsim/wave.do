onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processor_tb/main_clock
add wave -noupdate /processor_tb/main_ctrl_reset
add wave -noupdate /processor_tb/imem_clock
add wave -noupdate /processor_tb/dmem_clock
add wave -noupdate /processor_tb/processor_clock
add wave -noupdate /processor_tb/regfile_clock
add wave -noupdate /processor_tb/main_q_imem
add wave -noupdate /processor_tb/main_address_dmem
add wave -noupdate /processor_tb/main_data
add wave -noupdate /processor_tb/main_wren
add wave -noupdate /processor_tb/main_ctrl_writeEnable
add wave -noupdate -radix unsigned /processor_tb/main_ctrl_writeReg
add wave -noupdate -radix decimal /processor_tb/main_data_writeReg
add wave -noupdate -expand -label {Contributors: main_data_writeReg} -group {Contributors: sim:/processor_tb/main_data_writeReg} /processor_tb/s1/my_processor/data_mem/w1
add wave -noupdate -expand -label {Contributors: main_data_writeReg} -group {Contributors: sim:/processor_tb/main_data_writeReg} /processor_tb/s1/my_processor/data_mem/w2
add wave -noupdate /processor_tb/main_counter
add wave -noupdate /processor_tb/s1/my_processor/data_mem/w2
add wave -noupdate -expand -label {Contributors: w2} -group {Contributors: sim:/processor_tb/s1/my_processor/data_mem/w2} /processor_tb/s1/my_processor/data_mem/in1
add wave -noupdate -expand -label {Contributors: w2} -group {Contributors: sim:/processor_tb/s1/my_processor/data_mem/w2} /processor_tb/s1/my_processor/data_mem/s
add wave -noupdate /processor_tb/s1/my_processor/data_mem/in1
add wave -noupdate -expand -label {Contributors: in1} -group {Contributors: sim:/processor_tb/s1/my_processor/data_mem/in1} /processor_tb/s1/my_processor/checkingoverflow/m3/w1
add wave -noupdate -expand -label {Contributors: in1} -group {Contributors: sim:/processor_tb/s1/my_processor/data_mem/in1} /processor_tb/s1/my_processor/checkingoverflow/m3/w2
add wave -noupdate /processor_tb/s1/my_processor/checkingoverflow/m3/w1
add wave -noupdate -expand -label {Contributors: w1} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m3/w1} /processor_tb/s1/my_processor/checkingoverflow/m3/in0
add wave -noupdate -expand -label {Contributors: w1} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m3/w1} /processor_tb/s1/my_processor/checkingoverflow/m3/snot
add wave -noupdate /processor_tb/s1/my_processor/checkingoverflow/m3/in0
add wave -noupdate -expand -label {Contributors: in0} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m3/in0} -radix decimal /processor_tb/s1/my_processor/checkingoverflow/m2/w1
add wave -noupdate -expand -label {Contributors: in0} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m3/in0} -radix decimal /processor_tb/s1/my_processor/checkingoverflow/m2/w2
add wave -noupdate /processor_tb/s1/my_processor/checkingoverflow/m2/w1
add wave -noupdate -expand -label {Contributors: w1 (1)} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m2/w1} /processor_tb/s1/my_processor/checkingoverflow/m2/in0
add wave -noupdate -expand -label {Contributors: w1 (1)} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m2/w1} /processor_tb/s1/my_processor/checkingoverflow/m2/snot
add wave -noupdate /processor_tb/s1/my_processor/checkingoverflow/m2/in0
add wave -noupdate -expand -label {Contributors: in0 (1)} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m2/in0} /processor_tb/s1/my_processor/checkingoverflow/m1/w1
add wave -noupdate -expand -label {Contributors: in0 (1)} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m2/in0} /processor_tb/s1/my_processor/checkingoverflow/m1/w2
add wave -noupdate /processor_tb/s1/my_processor/checkingoverflow/m1/w1
add wave -noupdate -expand -label {Contributors: w1 (2)} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m1/w1} /processor_tb/s1/my_processor/checkingoverflow/m1/in0
add wave -noupdate -expand -label {Contributors: w1 (2)} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m1/w1} /processor_tb/s1/my_processor/checkingoverflow/m1/snot
add wave -noupdate /processor_tb/s1/my_processor/checkingoverflow/m1/in0
add wave -noupdate -expand -label {Contributors: in0 (2)} -group {Contributors: sim:/processor_tb/s1/my_processor/checkingoverflow/m1/in0} /processor_tb/s1/my_processor/a1/inner_result
add wave -noupdate /processor_tb/s1/my_processor/a1/inner_result
add wave -noupdate -expand -label {Contributors: inner_result} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/inner_result} /processor_tb/s1/my_processor/a1/ctrl_ALUopcode
add wave -noupdate -expand -label {Contributors: inner_result} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/inner_result} /processor_tb/s1/my_processor/a1/ctrl_shiftamt
add wave -noupdate -expand -label {Contributors: inner_result} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/inner_result} /processor_tb/s1/my_processor/a1/inner_A
add wave -noupdate -expand -label {Contributors: inner_result} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/inner_result} /processor_tb/s1/my_processor/a1/inner_B
add wave -noupdate /processor_tb/s1/my_processor/a1/inner_A
add wave -noupdate -expand -label {Contributors: inner_A} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/inner_A} /processor_tb/s1/my_processor/a1/data_operandA
add wave -noupdate /processor_tb/s1/my_processor/a1/data_operandA
add wave -noupdate -expand -label {Contributors: data_operandA} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/data_operandA} /processor_tb/s1/my_regfile/ctrl_readRegA
add wave -noupdate -expand -label {Contributors: data_operandA} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/data_operandA} /processor_tb/s1/my_regfile/ctrl_writeEnable
add wave -noupdate -expand -label {Contributors: data_operandA} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/data_operandA} /processor_tb/s1/my_regfile/ctrl_writeReg
add wave -noupdate -expand -label {Contributors: data_operandA} -group {Contributors: sim:/processor_tb/s1/my_processor/a1/data_operandA} /processor_tb/s1/my_regfile/registers
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {249689 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 470
configure wave -valuecolwidth 204
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {889405 ps} {890032 ps}

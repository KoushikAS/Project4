transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/reg_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/decoder5_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/program_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/fulladder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/dffe.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/skeleton.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/dmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/pc_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/sign_extension.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/mux_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/extend_clock.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/invert_clock.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/initalize.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/initalize_12.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/initalize_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/is_ne.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/check_two.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/check_overflow.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/mux_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/fulladder_12bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/fulladder_PC.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/is_ne_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/sign_extension_27bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/assign_clock.v}

vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/processor_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all

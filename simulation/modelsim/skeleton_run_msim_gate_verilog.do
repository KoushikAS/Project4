transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {skeleton_7_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project4 {C:/Users/ka266/Documents/Project4/processor_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all

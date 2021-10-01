transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {e:/altera/13.0/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {e:/altera/13.0/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {e:/altera/13.0/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {e:/altera/13.0/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {e:/altera/13.0/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneii_ver
vmap cycloneii_ver ./verilog_libs/cycloneii_ver
vlog -vlog01compat -work cycloneii_ver {e:/altera/13.0/quartus/eda/sim_lib/cycloneii_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/add_v.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/add_b.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/polar.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/change.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/HDB3.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/m_sequence.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/even256_div.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/delvb.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/trans8to1.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/findv.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/recover.v}
vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA {E:/altera/13.0/projects/HDB3_FPGA/even16_div.v}

vlog -vlog01compat -work work +incdir+E:/altera/13.0/projects/HDB3_FPGA/simulation/modelsim {E:/altera/13.0/projects/HDB3_FPGA/simulation/modelsim/HDB3.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  HDB3_vlg_tst

add wave *
view structure
view signals
run -all

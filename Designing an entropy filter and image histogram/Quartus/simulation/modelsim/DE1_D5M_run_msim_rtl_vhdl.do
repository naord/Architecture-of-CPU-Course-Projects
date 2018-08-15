transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port/Sdram_FIFO.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/CCD_Capture.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/I2C_CCD_Config.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/I2C_Controller.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/Line_Buffer.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/Reset_Delay.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/sdram_pll.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/SEG7_LUT.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/SEG7_LUT_8.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/DE1_D5M.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port/command.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port/control_interface.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port/sdr_data_path.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/Sdram_Control_4Port/Sdram_Control_4Port.v}
vlog -vlog01compat -work work +incdir+C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/VGA_Controller.v}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/Separator_4_Dememory_WriteBack.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/Separator_3_Execute_Dememory.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/Separator_2_IDecod_Execute.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/Separator_1_IFetch_Idecode.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/MIPS.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/IFETCH.VHD}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/IDECODE.VHD}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_swap.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_subtractBios.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_signComputation.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_normalize.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_multiply.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_leadZerosCounter.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_fractionAdder.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_expSubtractor.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_expSelect.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_alignment.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FP_adder.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/FloatingPointEntity.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/EXECUTE.VHD}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/DMEMORY.VHD}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/CONTROL.VHD}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/RAW2RGB.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/top_mux.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/GS_histogram.vhd}
vcom -93 -work work {C:/CPU2/project/DE1_CAMERA/DE1_CAMERA/V/mux.vhd}


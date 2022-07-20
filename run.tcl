set project Snake
set top_module vga_example
set target xc7a35tcpg236-1
set bitstream_file build/${project}.runs/impl_1/${top_module}.bit

proc usage {} {
    puts "usage: vivado -mode tcl -source [info script] -tclargs \[simulation/bitstream/program\]"
    exit 1
}

if {($argc != 1) || ([lindex $argv 0] ni {"simulation" "bitstream" "program"})} {
    usage
}



if {[lindex $argv 0] == "program"} {
    open_hw_manager
    connect_hw_server
    current_hw_target [get_hw_targets *]
    open_hw_target
    current_hw_device [lindex [get_hw_devices] 0]
    refresh_hw_device -update_hw_probes false [lindex [get_hw_devices] 0]

    set_property PROBES.FILE {} [lindex [get_hw_devices] 0]
    set_property FULL_PROBES.FILE {} [lindex [get_hw_devices] 0]
    set_property PROGRAM.FILE ${bitstream_file} [lindex [get_hw_devices] 0]

    program_hw_devices [lindex [get_hw_devices] 0]
    refresh_hw_device [lindex [get_hw_devices] 0]
    
    exit
} else {
    file mkdir build
    create_project ${project} build -part ${target} -force
}

read_xdc {
    constraints/vga_example.xdc
    constraints/clk_wiz_0.xdc
    constraints/clk_wiz_0_board.xdc
    constraints/clk_wiz_0_late.xdc
    constraints/clk_wiz_0_ooc.xdc
}

read_verilog {
    rtl/vga_timing.v
    rtl/vga_example.v
    rtl/draw_background.v
    rtl/clk_wiz_0.v
    rtl/clk_wiz_0_clk_wiz.v
    rtl/vga.v
    rtl/reset_locked.v
    rtl/draw_rect_char.v
    rtl/font_rom.v
    rtl/game_over.v
    rtl/game_over_writing.v
    rtl/random_coordinates.v
    rtl/apple.v
    rtl/draw_apple.v
    rtl/snake.v
}

read_vhd {
    rtl/MouseCtl.vhd
    rtl/MouseDisplay.vhd
    rtl/Ps2Interface.vhd
}

read_mem {
    rtl/image_rom.data
}

add_files -fileset sim_1 {
    sim/testbench.v
    sim/tiff_writer.v
}

set_property top ${top_module} [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

if {[lindex $argv 0] == "simulation"} {
    launch_simulation
    start_gui
} else {
    launch_runs synth_1 -jobs 8
    wait_on_run synth_1

    launch_runs impl_1 -to_step write_bitstream -jobs 8
    wait_on_run impl_1
    exit
}

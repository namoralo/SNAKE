set project Entliczek_Pentliczek
set top_module snake_top
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
    constraints/SNAKE.xdc
    constraints/clk_wiz_0.xdc
    constraints/clk_wiz_0_board.xdc
    constraints/clk_wiz_0_late.xdc
    constraints/clk_wiz_0_ooc.xdc
}

read_verilog {
    rtl/snake_top.v
    rtl/vga_timing.v
    rtl/draw_background.v
    rtl/draw_apple.v
    rtl/draw_snake.v
    rtl/draw_game_over.v
    rtl/draw_you_win.v
    rtl/draw_score_reset.v
    rtl/random_coordinates.v
    rtl/apple.v
    rtl/PS2Receiver_copy.v
    rtl/decoder.v
    rtl/move.v
    rtl/delay.v
    rtl/game_over.v
    rtl/arcade_game_over_font.v    
    rtl/arcade_you_win_font.v
    rtl/arcade_numbers_font.v
    rtl/arcade_small_font.v
    rtl/numbers_writing.v
    rtl/score_writing.v
    rtl/reset_writing.v
    rtl/game_over_writing.v
    rtl/you_win_writing.v
    rtl/display.v
    rtl/bcd2sseg.v
    rtl/bin2bcd.v
    rtl/clk_divider.v
    rtl/ring_counter.v
    rtl/sseg_mux.v
    rtl/sseg_x4.v
    rtl/reset_locked.v
    rtl/clk_wiz_0.v
    rtl/clk_wiz_0_clk_wiz.v
    rtl/debouncer.v
    rtl/multiplayer.v
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

if { $argc != 1 } {
    puts ".bit must be specified by tclargs"
    exit 1
}
set bit [lindex $argv 0]
puts stderr ".bit is "
puts stderr $bit


open_hw
connect_hw_server
open_hw_target

current_hw_device [get_hw_devices xc7vx485t_0]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7vx485t_0] 0]

set_property PROBES.FILE {} [get_hw_devices xc7vx485t_0]
set_property FULL_PROBES.FILE {} [get_hw_devices xc7vx485t_0]
set_property PROGRAM.FILE $bit [get_hw_devices xc7vx485t_0]
program_hw_devices [get_hw_devices xc7vx485t_0]
refresh_hw_device [lindex [get_hw_devices xc7vx485t_0] 0]

close_hw_target
disconnect_hw_server
close_hw

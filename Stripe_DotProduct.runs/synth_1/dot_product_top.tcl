# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.cache/wt [current_project]
set_property parent.project_path C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/memfile.dat
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/BSI/conv1-o.dat
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/BSI/input-o.dat
}
read_verilog -library xil_defaultlib -sv {
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/new/DataPath.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/MUX4.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/combine.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/new/counter.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/dmem.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/dmemB.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/imports/datapath/dreg.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/new/transposer.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/new/dot_product_top.v
}
read_verilog -library xil_defaultlib {
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/new/AND.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/new/ControlUnit.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/InstructionMem.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/imports/datapath/adder.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/dreg.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/new/imem.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/imports/datapath/mux2.v
  C:/Users/phatle/Stripe_DotProduct/Stripe_DotProduct.srcs/sources_1/imports/sources_1/new/shifter.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top dot_product_top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef dot_product_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file dot_product_top_utilization_synth.rpt -pb dot_product_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
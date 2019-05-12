# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.cache/wt [current_project]
set_property parent.project_path P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/sources_1/new/FSM.vhd
  {//file/UsersD$/dgr74/Home/My Documents/My Pictures/clock_divider.vhd}
  P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/sources_1/new/reg_1_en.vhd
  P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/sources_1/imports/sources_1/new/tristbuf_8.vhd
  P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/sources_1/imports/new/red_8_en.vhd
  P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/sources_1/imports/new/my_ALU.vhd
  P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/sources_1/new/Project_File.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/constrs_1/imports/ALUProject/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files P:/Courses/Lab_A03_group_10/ENEL373/ALUProject.srcs/constrs_1/imports/ALUProject/Nexys4DDR_Master.xdc]


synth_design -top Project_File -part xc7a100tcsg324-3


write_checkpoint -force -noxdef Project_File.dcp

catch { report_utilization -file Project_File_utilization_synth.rpt -pb Project_File_utilization_synth.pb }

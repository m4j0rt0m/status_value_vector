# Automatically created by Makefile #
set project_name status_value_vector
if [catch {project_open status_value_vector}] {project_new status_value_vector}
set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name TOP_LEVEL_ENTITY status_value_vector
set_global_assignment -name DEVICE "EP4CE22F17C6"
set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
set_global_assignment -name SOURCE_FILE /home/m4j0rt0m/Projects/Homeland/rtl_modules/status_value_vector/rtl/status_value_vector.v
set_global_assignment -name SOURCE_FILE /home/m4j0rt0m/Projects/Homeland/rtl_modules/status_value_vector/rtl/status_value_logic.v
set_global_assignment -name SDC_FILE /home/m4j0rt0m/Projects/Homeland/rtl_modules/status_value_vector/scripts/status_value_vector.sdc
project_close
qexit -success

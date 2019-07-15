# Set the project name
set project_name "[lindex $argv 0]"
# Open the Project. If it does not already exist, create it
if [catch {project_open $project_name}] {project_new $project_name}

set_location_assignment PIN_R8 -to clk_i
set_location_assignment PIN_J15 -to rsn_i

set_location_assignment PIN_D3 -to push_i
set_location_assignment PIN_C3 -to pull_i
set_location_assignment PIN_B4 -to valid_o
set_location_assignment PIN_B5 -to full_o

set_location_assignment PIN_D5 -to value_i[0]
set_location_assignment PIN_A6 -to value_i[1]
set_location_assignment PIN_D6 -to value_i[2]
set_location_assignment PIN_C6 -to value_i[3]
set_location_assignment PIN_E6 -to value_i[4]
set_location_assignment PIN_D8 -to value_i[5]
set_location_assignment PIN_F8 -to value_i[6]
set_location_assignment PIN_E9 -to value_i[7]

set_location_assignment PIN_A5 -to value_o[0]
set_location_assignment PIN_B6 -to value_o[1]
set_location_assignment PIN_B7 -to value_o[2]
set_location_assignment PIN_A7 -to value_o[3]
set_location_assignment PIN_C8 -to value_o[4]
set_location_assignment PIN_E7 -to value_o[5]
set_location_assignment PIN_E8 -to value_o[6]
set_location_assignment PIN_F9 -to value_o[7]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk_i
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to rsn_i

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to push_i
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pull_i
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to valid_o
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to full_o

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_i[7]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to value_o[7]

set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"

project_close
qexit -success

###
#************************************************************************
#************************************************************************
# TEMPLATE
#************************************************************************
#************************************************************************

#set_global_assignment -name FAMILY "Cyclone IV E"
#set_global_assignment -name DEVICE EP4CE22F17C6
#set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
#set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85

# Pin & Location Assignments
# ==========================
#============================================================
# CLOCK
#============================================================
#set_location_assignment PIN_R8 -to CLOCK_50
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50

#============================================================
# LED
#============================================================
#set_location_assignment PIN_A15 -to LED[0]
#set_location_assignment PIN_A13 -to LED[1]
#set_location_assignment PIN_B13 -to LED[2]
#set_location_assignment PIN_A11 -to LED[3]
#set_location_assignment PIN_D1 -to LED[4]
#set_location_assignment PIN_F3 -to LED[5]
#set_location_assignment PIN_B1 -to LED[6]
#set_location_assignment PIN_L3 -to LED[7]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[7]

#============================================================
# KEY
#============================================================
#set_location_assignment PIN_J15 -to KEY[0]
#set_location_assignment PIN_E1 -to KEY[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[1]

#============================================================
# SW
#============================================================
#set_location_assignment PIN_M1 -to SW[0]
#set_location_assignment PIN_T8 -to SW[1]
#set_location_assignment PIN_B9 -to SW[2]
#set_location_assignment PIN_M15 -to SW[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]

#============================================================
# SDRAM
#============================================================
#set_location_assignment PIN_P2 -to DRAM_ADDR[0]
#set_location_assignment PIN_N5 -to DRAM_ADDR[1]
#set_location_assignment PIN_N6 -to DRAM_ADDR[2]
#set_location_assignment PIN_M8 -to DRAM_ADDR[3]
#set_location_assignment PIN_P8 -to DRAM_ADDR[4]
#set_location_assignment PIN_T7 -to DRAM_ADDR[5]
#set_location_assignment PIN_N8 -to DRAM_ADDR[6]
#set_location_assignment PIN_T6 -to DRAM_ADDR[7]
#set_location_assignment PIN_R1 -to DRAM_ADDR[8]
#set_location_assignment PIN_P1 -to DRAM_ADDR[9]
#set_location_assignment PIN_N2 -to DRAM_ADDR[10]
#set_location_assignment PIN_N1 -to DRAM_ADDR[11]
#set_location_assignment PIN_L4 -to DRAM_ADDR[12]
#set_location_assignment PIN_M7 -to DRAM_BA[0]
#set_location_assignment PIN_M6 -to DRAM_BA[1]
#set_location_assignment PIN_L7 -to DRAM_CKE
#set_location_assignment PIN_R4 -to DRAM_CLK
#set_location_assignment PIN_P6 -to DRAM_CS_N
#set_location_assignment PIN_G2 -to DRAM_DQ[0]
#set_location_assignment PIN_G1 -to DRAM_DQ[1]
#set_location_assignment PIN_L8 -to DRAM_DQ[2]
#set_location_assignment PIN_K5 -to DRAM_DQ[3]
#set_location_assignment PIN_K2 -to DRAM_DQ[4]
#set_location_assignment PIN_J2 -to DRAM_DQ[5]
#set_location_assignment PIN_J1 -to DRAM_DQ[6]
#set_location_assignment PIN_R7 -to DRAM_DQ[7]
#set_location_assignment PIN_T4 -to DRAM_DQ[8]
#set_location_assignment PIN_T2 -to DRAM_DQ[9]
#set_location_assignment PIN_T3 -to DRAM_DQ[10]
#set_location_assignment PIN_R3 -to DRAM_DQ[11]
#set_location_assignment PIN_R5 -to DRAM_DQ[12]
#set_location_assignment PIN_P3 -to DRAM_DQ[13]
#set_location_assignment PIN_N3 -to DRAM_DQ[14]
#set_location_assignment PIN_K1 -to DRAM_DQ[15]
#set_location_assignment PIN_R6 -to DRAM_DQM[0]
#set_location_assignment PIN_T5 -to DRAM_DQM[1]
#set_location_assignment PIN_L1 -to DRAM_CAS_N
#set_location_assignment PIN_L2 -to DRAM_RAS_N
#set_location_assignment PIN_C2 -to DRAM_WE_N

#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[7]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[8]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[9]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[10]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[11]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[12]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CKE
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CLK
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CS_N
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[7]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[8]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[9]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[10]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[11]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[12]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[13]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[14]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[15]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQM[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQM[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CAS_N
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_RAS_N
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_WE_N

#============================================================
# Accelerometer and EEPROM
#============================================================
#set_location_assignment PIN_F2 -to I2C_SCLK
#set_location_assignment PIN_F1 -to I2C_SDAT
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2C_SCLK
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2C_SDAT

#set_location_assignment PIN_G5 -to G_SENSOR_CS_N
#set_location_assignment PIN_M2 -to G_SENSOR_INT
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to G_SENSOR_CS_N
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to G_SENSOR_INT

#============================================================
# ADC
#============================================================
#set_location_assignment PIN_A10 -to ADC_CS_N
#set_location_assignment PIN_B10 -to ADC_SADDR
#set_location_assignment PIN_B14 -to ADC_SCLK
#set_location_assignment PIN_A9 -to ADC_SDAT
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_CS_N
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SADDR
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SCLK
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SDAT

#============================================================
# 2x13 GPIO Header
#============================================================
#set_location_assignment PIN_A14 -to GPIO_2[0]
#set_location_assignment PIN_B16 -to GPIO_2[1]
#set_location_assignment PIN_C14 -to GPIO_2[2]
#set_location_assignment PIN_C16 -to GPIO_2[3]
#set_location_assignment PIN_C15 -to GPIO_2[4]
#set_location_assignment PIN_D16 -to GPIO_2[5]
#set_location_assignment PIN_D15 -to GPIO_2[6]
#set_location_assignment PIN_D14 -to GPIO_2[7]
#set_location_assignment PIN_F15 -to GPIO_2[8]
#set_location_assignment PIN_F16 -to GPIO_2[9]
#set_location_assignment PIN_F14 -to GPIO_2[10]
#set_location_assignment PIN_G16 -to GPIO_2[11]
#set_location_assignment PIN_G15 -to GPIO_2[12]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[7]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[8]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[9]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[10]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[11]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2[12]

#set_location_assignment PIN_E15 -to GPIO_2_IN[0]
#set_location_assignment PIN_E16 -to GPIO_2_IN[1]
#set_location_assignment PIN_M16 -to GPIO_2_IN[2]

#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_IN[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_IN[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_IN[2]

#============================================================
# GPIO_0, GPIO_0 connect to GPIO Default
#============================================================
#set_location_assignment PIN_A8 -to GPIO_0_IN[0]
#set_location_assignment PIN_D3 -to GPIO_0[0]
#set_location_assignment PIN_B8 -to GPIO_0_IN[1]
#set_location_assignment PIN_C3 -to GPIO_0[1]
#set_location_assignment PIN_A2 -to GPIO_0[2]
#set_location_assignment PIN_A3 -to GPIO_0[3]
#set_location_assignment PIN_B3 -to GPIO_0[4]
#set_location_assignment PIN_B4 -to GPIO_0[5]
#set_location_assignment PIN_A4 -to GPIO_0[6]
#set_location_assignment PIN_B5 -to GPIO_0[7]
#set_location_assignment PIN_A5 -to GPIO_0[8]
#set_location_assignment PIN_D5 -to GPIO_0[9]
#set_location_assignment PIN_B6 -to GPIO_0[10]
#set_location_assignment PIN_A6 -to GPIO_0[11]
#set_location_assignment PIN_B7 -to GPIO_0[12]
#set_location_assignment PIN_D6 -to GPIO_0[13]
#set_location_assignment PIN_A7 -to GPIO_0[14]
#set_location_assignment PIN_C6 -to GPIO_0[15]
#set_location_assignment PIN_C8 -to GPIO_0[16]
#set_location_assignment PIN_E6 -to GPIO_0[17]
#set_location_assignment PIN_E7 -to GPIO_0[18]
#set_location_assignment PIN_D8 -to GPIO_0[19]
#set_location_assignment PIN_E8 -to GPIO_0[20]
#set_location_assignment PIN_F8 -to GPIO_0[21]
#set_location_assignment PIN_F9 -to GPIO_0[22]
#set_location_assignment PIN_E9 -to GPIO_0[23]
#set_location_assignment PIN_C9 -to GPIO_0[24]
#set_location_assignment PIN_D9 -to GPIO_0[25]
#set_location_assignment PIN_E11 -to GPIO_0[26]
#set_location_assignment PIN_E10 -to GPIO_0[27]
#set_location_assignment PIN_C11 -to GPIO_0[28]
#set_location_assignment PIN_B11 -to GPIO_0[29]
#set_location_assignment PIN_A12 -to GPIO_0[30]
#set_location_assignment PIN_D11 -to GPIO_0[31]
#set_location_assignment PIN_D12 -to GPIO_0[32]
#set_location_assignment PIN_B12 -to GPIO_0[33]

#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_IN[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_IN[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[7]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[8]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[9]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[10]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[11]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[12]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[13]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[14]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[15]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[16]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[17]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[18]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[19]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[20]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[21]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[22]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[23]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[24]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[25]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[26]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[27]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[28]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[29]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[30]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[31]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[32]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[33]

#============================================================
# GPIO_0, GPIO_1 connect to GPIO Default
#============================================================
#set_location_assignment PIN_T9 -to GPIO_1_IN[0]
#set_location_assignment PIN_F13 -to GPIO_1[0]
#set_location_assignment PIN_R9 -to GPIO_1_IN[1]
#set_location_assignment PIN_T15 -to GPIO_1[1]
#set_location_assignment PIN_T14 -to GPIO_1[2]
#set_location_assignment PIN_T13 -to GPIO_1[3]
#set_location_assignment PIN_R13 -to GPIO_1[4]
#set_location_assignment PIN_T12 -to GPIO_1[5]
#set_location_assignment PIN_R12 -to GPIO_1[6]
#set_location_assignment PIN_T11 -to GPIO_1[7]
#set_location_assignment PIN_T10 -to GPIO_1[8]
#set_location_assignment PIN_R11 -to GPIO_1[9]
#set_location_assignment PIN_P11 -to GPIO_1[10]
#set_location_assignment PIN_R10 -to GPIO_1[11]
#set_location_assignment PIN_N12 -to GPIO_1[12]
#set_location_assignment PIN_P9 -to GPIO_1[13]
#set_location_assignment PIN_N9 -to GPIO_1[14]
#set_location_assignment PIN_N11 -to GPIO_1[15]
#set_location_assignment PIN_L16 -to GPIO_1[16]
#set_location_assignment PIN_K16 -to GPIO_1[17]
#set_location_assignment PIN_R16 -to GPIO_1[18]
#set_location_assignment PIN_L15 -to GPIO_1[19]
#set_location_assignment PIN_P15 -to GPIO_1[20]
#set_location_assignment PIN_P16 -to GPIO_1[21]
#set_location_assignment PIN_R14 -to GPIO_1[22]
#set_location_assignment PIN_N16 -to GPIO_1[23]
#set_location_assignment PIN_N15 -to GPIO_1[24]
#set_location_assignment PIN_P14 -to GPIO_1[25]
#set_location_assignment PIN_L14 -to GPIO_1[26]
#set_location_assignment PIN_N14 -to GPIO_1[27]
#set_location_assignment PIN_M10 -to GPIO_1[28]
#set_location_assignment PIN_L13 -to GPIO_1[29]
#set_location_assignment PIN_J16 -to GPIO_1[30]
#set_location_assignment PIN_K15 -to GPIO_1[31]
#set_location_assignment PIN_J13 -to GPIO_1[32]
#set_location_assignment PIN_J14 -to GPIO_1[33]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_IN[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_IN[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[7]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[8]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[9]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[10]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[11]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[12]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[13]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[14]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[15]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[16]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[17]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[18]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[19]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[20]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[21]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[22]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[23]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[24]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[25]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[26]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[27]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[28]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[29]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[30]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[31]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[32]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[33]

#set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
#set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"

#set_global_assignment -name RESERVE_DCLK_AFTER_CONFIGURATION "USE AS REGULAR IO"
#set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

#set_instance_assignment -name FAST_INPUT_REGISTER ON -to *
#set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to *
#set_instance_assignment -name TSU_REQUIREMENT "10 ns" -from * -to *
#set_instance_assignment -name CURRENT_STRENGTH_NEW "MINIMUM CURRENT" -to *

#set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
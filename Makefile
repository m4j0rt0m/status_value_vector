#################################################################
# Author:       Abraham J. Ruiz R. (https://github.com/m4j0rt0m)
# Description:  Status Value Vector Project Makefile
#################################################################

MKFILE_PATH					=	$(abspath $(lastword $(MAKEFILE_LIST)))
TOP_DIR							=	$(shell dirname $(MKFILE_PATH))

### DIRECTORIES ###
SOURCE_DIR					=	$(TOP_DIR)/rtl
OUTPUT_DIR					=	$(TOP_DIR)/build
TESTBENCH_DIR				=	$(TOP_DIR)/test_bench

### RTL WILDCARDS ###
PRJ_SRC							=	$(wildcard $(shell find rtl -type f \( -iname \*.v -o -iname \*.sv -o -iname \*.vhdl \)))
PRJ_DIRS						=	$(wildcard $(shell find rtl -type d))
PRJ_HEADERS					=	$(wildcard $(shell find rtl -type f \( -iname \*.h \)))
TESTBENCH_SRC				=	$(wildcard $(shell find test_bench -type f \( -iname \*.v \)))
PRJ_INCLUDES				=	$(addprefix -I, $(PRJ_DIRS))

### PROJECT ###
PROJECT							=	status_value_vector
TOP_MODULE					=	status_value_vector

### LINTER ###
LINT								=	verilator
LINT_FLAGS					=	--lint-only --top-module $(TOP_MODULE) -Wall $(PRJ_INCLUDES)

### SIMULATION ###
TOP_MODULE_SIM			=	status_value_vector
NAME_MODULE_SIM			=	$(TOP_MODULE_SIM)_tb
SIM									=	iverilog
SIM_FLAGS						=	-o $(OUTPUT_DIR)/$(TOP_MODULE).tb -s $(NAME_MODULE_SIM) -DSIMULATION $(PRJ_INCLUDES) -v -Wall
RUN									=	vvp
RUN_FLAGS						=	-v

### FUNCTION DEFINES ###
define veritedium-command
emacs --batch $(1) -f verilog-auto -f save-buffer;
endef

all: veritedium lint sim

veritedium:
	$(foreach SRC,$(PRJ_SRC),$(call veritedium-command,$(SRC)))

lint: $(PRJ_SRC)
	$(LINT) $(LINT_FLAGS) $^

sim-all: $(OUTPUT_DIR)/$(TOP_MODULE_SIM).vcd $(TESTBENCH_SRC)
	@(gtkwave $< > /dev/null 2>&1 &)

sim: $(OUTPUT_DIR)/$(TOP_MODULE_SIM).vcd $(TESTBENCH_SRC)

del-bak:
	find ./* -name "*~" -delete
	find ./* -name "*.bak" -delete

clean:
	rm -rf ./build/*

clean-all: del-bak
	rm -rf ./build

$(OUTPUT_DIR)/$(TOP_MODULE_SIM).tb: $(TESTBENCH_SRC) $(PRJ_SRC) $(PRJ_HEADERS)
	mkdir -p $(OUTPUT_DIR)
	$(SIM) $(SIM_FLAGS) $^

$(OUTPUT_DIR)/$(TOP_MODULE_SIM).vcd: $(OUTPUT_DIR)/$(TOP_MODULE_SIM).tb $(PRJ_SRC) $(PRJ_HEADERS)
	$(RUN) $(RUN_FLAGS) $<
	mv $(TOP_MODULE_SIM).vcd $(OUTPUT_DIR)/$(TOP_MODULE_SIM).vcd

.PHONY: all veritedium lint sim clean clean-all

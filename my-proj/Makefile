SHELL := /bin/bash

# Use F4PGA (SymbiFlow) tools from conda
CONDA_ENV = cfu-symbiflow

# Files
TOP = vga
VERILOG = $(TOP).v
BIT = $(TOP).bit

# FPGA part
PART = xc7a100tcsg324-1

all: $(BIT)

install-sf:
	conda env create -f ../conf/environment-symbiflow.yml
	@echo "SymbiFlow environment created. Use: conda activate $(CONDA_ENV)"

$(BIT): $(VERILOG) $(TOP).pcf
	conda run -n $(CONDA_ENV) yosys -p "read_verilog $(VERILOG); synth_xilinx -family xc7 -top $(TOP); write_edif $(TOP).edif"
	conda run -n $(CONDA_ENV) nextpnr-xilinx --chipdb /opt/conda/envs/$(CONDA_ENV)/share/nextpnr/xilinx/xc7a100t.bba --edif $(TOP).edif --write $(TOP).fasm --part $(PART) --pcf $(TOP).pcf
	conda run -n $(CONDA_ENV) fasm2bels --part $(PART) --fasm $(TOP).fasm --bit $(BIT)

prog: $(BIT)
	openocd -f arty.cfg -c "init; pld load 0 $(BIT); shutdown"

clean:
	rm -f $(TOP).edif $(TOP).fasm $(BIT)

.PHONY: all install-sf prog clean

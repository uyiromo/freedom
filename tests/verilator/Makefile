#
# Makefile for Freedom U500 SoC + DramSim
#
PWD = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DRAMSIM2_DIR = ${PWD}DRAMSim2
SIMDRAM_DIR  = ${PWD}SimDRAM
VERILOG_DIR  = ${PWD}verilog
VSRC_DIR     = ${PWD}vsrc

VERILATOR  = verilator
TRACE_FLAG = --trace --trace-params --trace-structs --trace-underscore
AUX_FLAG   = --x-assign unique -Wno-WIDTHCONCAT
EXE_FLAG   = -O3 --cc --exe
CFLAGS     = -CFLAGS "-std=c++11 -I ${SIMDRAM_DIR}/ -I ${DRAMSIM2_DIR}/"
LDFLAGS    = -LDFLAGS "-Wl,-rpath,${DRAMSIM2_DIR} -L${DRAMSIM2_DIR} -ldramsim -lm"
VFLAGS     = ${TRACE_FLAG} ${AUX_FLAG} ${EXE_FLAG} ${CFLAGS} ${LDFLAGS}

OPT_CPP = ${SIMDRAM_DIR}/*.cc
DUT_TOP = VC707PCIeShell.v
DUT_TB  = tb_VC707PCIeShell.cpp

V=${PWD}/../../builds/vc707-u500devkit/sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.v
.PHONY: verilog clean


all: sim

sim: build
	cp -r dramsim2_ini obj_dir/
	time ./obj_dir/VVC707PCIeShell +verilator+rand+reset+1 +dramsim

# Generate libdramsim.so
dramsim2:
	make -C${DRAMSIM2_DIR} DEBUG=1 libdramsim.so

# Generate BootROM
hex: ../../bootrom/sdboot/sd.c
	touch ${V}
	make -C../../ -j`nproc` MODEL=VC707PCIeShell -f Makefile.vc707-u500devkit romgen

# Generate *.v & Parse it
verilog:
	make -C../../ -j`nproc` MODEL=VC707PCIeShell -f Makefile.vc707-u500devkit verilog
	python3 ./parse.py

# Build with Verilator
build: dramsim2 hex verilog
	cp ../../builds/vc707-u500devkit/sdboot.hex hex
	cp ${VERILOG_DIR}/*.v .
	cp ${VSRC_DIR}/*.v    .
	cp ${SIMDRAM_DIR}/*.v .
	time ${VERILATOR} ${VFLAGS} ${DUT_TOP} -exe ${DUT_TB} ${OPT_CPP}
	time make -j `nproc` -C obj_dir -f VVC707PCIeShell.mk CXXFLAGS="-Wformat=0"


clean:
	rm -rf obj_dir
	rm -rf verilog
	rm -f *.v
	rm -f simx.vcd dramsim.log hex

# EOF

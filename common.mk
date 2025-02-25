# See LICENSE for license details.

# Required variables:
# - MODEL
# - PROJECT
# - CONFIG_PROJECT
# - CONFIG
# - BUILD_DIR
# - FPGA_DIR

# Optional variables:
# - EXTRA_FPGA_VSRCS

# export to bootloader
export ROMCONF=$(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).rom.conf

# export to fpga-shells
export FPGA_TOP_SYSTEM=$(MODEL)
export FPGA_BUILD_DIR=$(BUILD_DIR)/$(FPGA_TOP_SYSTEM)
export fpga_common_script_dir=$(FPGA_DIR)/common/tcl
export fpga_board_script_dir=$(FPGA_DIR)/$(BOARD)/tcl

export BUILD_DIR

EXTRA_FPGA_VSRCS ?=
PATCHVERILOG ?= ""
BOOTROM_DIR ?= ""

base_dir := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
export rocketchip_dir := $(base_dir)/rocket-chip
SBT ?= java -jar $(rocketchip_dir)/sbt-launch.jar

# Build firrtl.jar and put it where chisel3 can find it.
ROCKET_CLASSES ?= "$(rocketchip_dir)/target/scala-2.12/classes:$(rocketchip_dir)/chisel3/target/scala-2.12/*"
FIRRTL_JAR ?= $(rocketchip_dir)/firrtl/utils/bin/firrtl.jar
FIRRTL ?= java -Xmx8G -Xss8M -XX:MaxPermSize=256M -cp $(FIRRTL_JAR):$(ROCKET_CLASSES) firrtl.Driver

$(FIRRTL_JAR): $(shell find $(rocketchip_dir)/firrtl/src/main/scala -iname "*.scala")
	$(MAKE) -C $(rocketchip_dir)/firrtl SBT="$(SBT)" root_dir=$(rocketchip_dir)/firrtl build-scala
	touch $(FIRRTL_JAR)
	mkdir -p $(rocketchip_dir)/lib
	cp -p $(FIRRTL_JAR) rocket-chip/lib
	mkdir -p $(rocketchip_dir)/chisel3/lib
	cp -p $(FIRRTL_JAR) $(rocketchip_dir)/chisel3/lib

# Build .fir
devkitconfigs := $(base_dir)/src/main/scala/unleashed/DevKitConfigs.scala
firrtl := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).fir
buildsbt := ${base_dir}/OpenMPE/build.sbt
$(firrtl): $(shell find $(base_dir)/src/main/scala -name '*.scala') $(FIRRTL_JAR)
ifneq (, $(shell readlink -e ${buildsbt}))
	unlink ${buildsbt}
endif
	mkdir -p $(dir $@)
	sed -i -re "s/new WithNBigCores\([0-9]\)/new WithNBigCores($(NUM_CORES))/" $(devkitconfigs)
	$(SBT) "runMain freechips.rocketchip.system.Generator $(BUILD_DIR) $(PROJECT) $(MODEL) $(CONFIG_PROJECT) $(CONFIG)"

.PHONY: firrtl
firrtl: $(firrtl)

# Build .v
verilog := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).v
anno    := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).anno.json
$(verilog): $(firrtl) $(FIRRTL_JAR)
	sed -i -re 's# MEM_INIT_TXT .*$\# MEM_INIT_TXT "${base_dir}/sim/mem_init.txt"#' ${base_dir}/sim/ddr3_model.sv
	$(FIRRTL) -i $(firrtl) -o $@ -X verilog -faf $(anno)
ifneq ($(PATCHVERILOG),"")
	$(PATCHVERILOG)
endif

.PHONY: verilog
verilog: $(verilog)

romgen := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).rom.v
$(romgen): $(verilog)
ifneq ($(BOOTROM_DIR),"")
	$(MAKE) -C $(BOOTROM_DIR) NUM_CORES=$(NUM_CORES) romgen
	mv $(BUILD_DIR)/rom.v $@
endif

.PHONY: romgen
romgen: $(romgen)

f := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).vsrcs.F
$(f): $(firrtl)
	echo $(VSRCS) > $@

bit := $(BUILD_DIR)/obj/$(MODEL).bit
$(bit): $(romgen) $(f)
	cd $(BUILD_DIR); vivado \
		-nojournal -mode batch \
		-source $(fpga_common_script_dir)/vivado.tcl \
		-tclargs \
		-top-module "$(MODEL)" \
		-F "$(f)" \
		-ip-vivado-tcls "$(shell find '$(BUILD_DIR)' -name '*.vivado.tcl')" \
		-board "$(BOARD)"


# Build .mcs
mcs := $(BUILD_DIR)/obj/$(MODEL).mcs
$(mcs): $(bit)
	cd $(BUILD_DIR); vivado -nojournal -mode batch -source $(fpga_common_script_dir)/write_cfgmem.tcl -tclargs $(BOARD) $@ $<

.PHONY: mcs
mcs: $(mcs)

# Build Libero project
prjx := $(BUILD_DIR)/libero/$(MODEL).prjx
$(prjx): $(verilog)
	cd $(BUILD_DIR); libero SCRIPT:$(fpga_common_script_dir)/libero.tcl SCRIPT_ARGS:"$(BUILD_DIR) $(MODEL) $(PROJECT) $(CONFIG) $(BOARD)"

.PHONY: prjx
prjx: $(prjx)

# Clean
.PHONY: clean
clean:
ifneq ($(BOOTROM_DIR),"")
	$(MAKE) -C $(BOOTROM_DIR) clean
endif
	$(MAKE) -C $(FPGA_DIR) clean
	rm -rf $(BUILD_DIR)
	rm -rf *.fir *.log *.jou *.anno.json *.v *.f

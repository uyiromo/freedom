#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import traceback
import re
import shutil
import os

def print_dbg(s):
    print(s, file=sys.stderr)

class Module:
    name          = None
    name_v        = None
    body          = ""
    start_line_no = -1
    end_line_no   = -1

    def __init__(self, name, start_line_no):
        self.name          = name
        self.name_v        = "verilog/{}.v".format(self.name)
        self.start_line_no = start_line_no

    def append_body(self, line):
        self.body = self.body + "\n" + line

    def output(self, end_line_no):
        self.end_line_no = end_line_no

        with open(self.name_v, 'w', encoding='utf-8') as f:
            print("// {} - {}".format(self.start_line_no, self.end_line_no), file=f, flush=True)
            print(self.body, file=f, flush=True)

    def __str__(self):
        return "{} [{} - {}]".format(self.name, self.start_line_no, self.end_line_no)





if __name__ == "__main__":
    builds_dir = "../builds/vc707-u500devkit/"
    org_v = builds_dir + "sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.v"
    rom_v = builds_dir + "sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.rom.v"

    if os.path.exists("verilog"):
        shutil.rmtree("verilog")
    os.mkdir("verilog")

    lines = []
    try:
        with open(org_v) as f:
            lines = f.readlines()
    except IOError as e:
        print_dbg('Error: Cannot open ' + org_v)
        print_dbg(traceback.format_exc())
        sys.exit(1)


    module = None
    depth  = 0

    for (line_no, line) in enumerate(lines[7:]):
        # ignore comments
        p = line.find(" // @")
        line = line[:p]

        if line.startswith("module") and depth == 0:
            depth = depth + 1

            # if new module found, set module_name
            name   = line[line.find(' ') + 1:line.find(')')]
            module = Module(name, line_no)
            print_dbg(module)
            #sys.exit(1)

        module.append_body(line)

        if line.startswith("endmodule"):
            depth = depth - 1

            if depth == 0:
                module.output(line_no)

    shutil.copyfile(rom_v, "BootROM.v")
    print_dbg("done")

#include <iostream>
#include <cmath>
#include <verilated.h>
#include "verilated_vcd_c.h"
#include "VVC707PCIeShell.h"


unsigned int tc, cc;   /* time counter, cycle counter */
VVC707PCIeShell *dut;  /* design under test */
VerilatedVcdC *tfp;    /* VCD config */

#define print(...) fprintf(stderr, __VA_ARGS__)

/*
 * maximum simulation time in [ns]
 * 2000000 [ns] = 200 [us]
 */
#define ns (1000L)
#define us (1000L*ns)
#define ms (1000L*us)

const long MAX_SIMULATION_NS = 6*ms;


/*
 * parameters for clock generation
 */
const int BASE_FREQ = 500;     /* base clock [MHz] */
const int CORE_FREQ = 100;     /* core & bus clock [MHz] */
const int MEMC_FREQ = 200;     /* memory controller clock [MHz] */

double CORE_RATIO = (double) BASE_FREQ / CORE_FREQ;
double MEMC_RATIO = (double) BASE_FREQ / MEMC_FREQ;

int CORE_PDUTY = (int)  ceil(CORE_RATIO);
int CORE_NDUTY = (int) floor(CORE_RATIO);
int MEMC_PDUTY = (int)  ceil(MEMC_RATIO);
int MEMC_NDUTY = (int) floor(MEMC_RATIO);

int core_duty;
int memc_duty;


/*
 * reset period from simulation reset in [ns]
 */
const int RESET_PERIOD = 200;

double
sc_time_stamp()
{
    return tc;
}


unsigned int t1 = 0;

bool
tick()
{
    if (core_duty == 0) {
        core_duty = dut->sys_clock_p ? CORE_NDUTY : CORE_PDUTY;
        dut->sys_clock_p = !dut->sys_clock_p;
    }

    if (memc_duty == 0) {
        memc_duty = dut->sys_clock_n ? MEMC_NDUTY : MEMC_PDUTY;
        dut->sys_clock_n = !dut->sys_clock_n;
    }


    dut->eval();
    tfp->dump(tc);
    tc++;
    core_duty--;
    memc_duty--;


    // check t1 (checkpoint register)
    unsigned int _t1 = dut->VC707PCIeShell__DOT__topDesign__DOT__topMod__DOT__tile__DOT__core__DOT___T_436[25];
    unsigned long act = dut->VC707PCIeShell__DOT__topDesign__DOT__topMod__DOT__nvmmctr___DOT__cnt_act;
    unsigned int read = dut->VC707PCIeShell__DOT__topDesign__DOT__topMod__DOT__nvmmctr___DOT__cnt_read;


    if (t1 != _t1) {
        std::cout << std::dec << tc
                  << ": t1 = 0x" << std::hex << _t1 << ", "
                  << "read = " << std::dec << read << ", "
                  << "act = " << std::dec << act
                  << std::endl;
        t1 = _t1;

        if (_t1 == 0xFFFFF000)
            return true;
    }

    return false;
}



int
main(int argc, char **argv)
{
    /* initialize Verilator */
    Verilated::commandArgs(argc, argv);
    dut = new VVC707PCIeShell();

    /* enable wave dump */
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC();
    dut->trace(tfp, 100); /* max depth hierarchy from top design? */
    tfp->open("simx.vcd");


    /* initialize */
    tc = cc = 0;
    dut->sys_clock_p = true;
    dut->sys_clock_n = true;
    core_duty = memc_duty = 0;

    /* reset  */
    dut->reset = true;
    while (tc < RESET_PERIOD) {
        tick();
    }
    dut->reset = false;

    /* simulation */
    while (tc < MAX_SIMULATION_NS) {
        if (tick())
            break;
    }

    tfp->close();
    dut->final();


    return 0;
}

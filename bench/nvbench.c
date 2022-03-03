// See LICENSE for license details.
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>


typedef unsigned char byte_t;
struct nvmmctr {
    size_t clear;       /* 0x00 */
    size_t nvmm_begin;  /* 0x08 */
    size_t lat_cr;      /* 0x10 */
    size_t lat_cw;      /* 0x18 */
    size_t lat_fr;      /* 0x20 */
    size_t lat_fw;      /* 0x28 */
    size_t lat_dr256;   /* 0x30 */
    size_t lat_dr4096;  /* 0x38 */
    size_t lat_dw256;   /* 0x40 */
    size_t lat_dw4096;  /* 0x48 */
    size_t cnt_read;    /* 0x50 */
    size_t cnt_write;   /* 0x58 */
    size_t cnt_act;     /* 0x60 */
    size_t cnt_pre;     /* 0x68 */
    size_t cnt_bdr;     /* 0x70 */
    size_t cnt_bdw;     /* 0x78 */
};

#define __fence() \
    __asm__ __volatile__ ("fence.i" : : : "memory");



void
bench(byte_t *base, struct nvmmctr *nc)
{
    struct nvmmctr buf[4];
    clock_t clk[4];
    size_t off;

    /* fill */
    buf[0].lat_cr    = nc->lat_cr;
    buf[0].lat_cw    = nc->lat_cw;
    buf[0].lat_fr    = nc->lat_fr;
    buf[0].lat_fw    = nc->lat_fw;
    buf[0].cnt_read  = nc->cnt_read;
    buf[0].cnt_write = nc->cnt_write;
    buf[0].cnt_act   = nc->cnt_act;
    clk[0]           = clock();
    for (off = 0; off < 4*1024; off += 64) {
        *((unsigned long *) (base + off)) = off;
    }
    clk[1]           = clock();
    buf[1].lat_cr    = nc->lat_cr;
    buf[1].lat_cw    = nc->lat_cw;
    buf[1].lat_fr    = nc->lat_fr;
    buf[1].lat_fw    = nc->lat_fw;
    buf[1].cnt_read  = nc->cnt_read;
    buf[1].cnt_write = nc->cnt_write;
    buf[1].cnt_act   = nc->cnt_act;

    /* flush */
    buf[2].lat_cr    = nc->lat_cr;
    buf[2].lat_cw    = nc->lat_cw;
    buf[2].lat_fr    = nc->lat_fr;
    buf[2].lat_fw    = nc->lat_fw;
    buf[2].cnt_read  = nc->cnt_read;
    buf[2].cnt_write = nc->cnt_write;
    buf[2].cnt_act   = nc->cnt_act;
    clk[2]           = clock();
    __asm__ __volatile__(".insn i 0x73, 0, x0, x0, -0x340 \n\t");
    clk[3]           = clock();
    buf[3].lat_cr    = nc->lat_cr;
    buf[3].lat_cw    = nc->lat_cw;
    buf[3].lat_fr    = nc->lat_fr;
    buf[3].lat_fw    = nc->lat_fw;
    buf[3].cnt_read  = nc->cnt_read;
    buf[3].cnt_write = nc->cnt_write;
    buf[3].cnt_act   = nc->cnt_act;


    /* print */
    printf("  write:\n");
    printf("    lat_cr    = %ld\n", buf[1].lat_cr);
    printf("    lat_cw    = %ld\n", buf[1].lat_cw);
    printf("    lat_fr    = %ld\n", buf[1].lat_fr);
    printf("    lat_fw    = %ld\n", buf[1].lat_fw);
    printf("    cnt_read  = %ld\n", buf[1].cnt_read  - buf[0].cnt_read);
    printf("    cnt_write = %ld\n", buf[1].cnt_write - buf[0].cnt_write);
    printf("    cnt_act   = %ld\n", buf[1].cnt_act   - buf[0].cnt_act);
    printf("    elapsed   = %.0f [ns]\n", (double)(clk[1] - clk[0]) * 1E9 / CLOCKS_PER_SEC);
    printf("  flush:\n");
    printf("    lat_cr    = %ld\n", buf[3].lat_cr);
    printf("    lat_cw    = %ld\n", buf[3].lat_cw);
    printf("    lat_fr    = %ld\n", buf[3].lat_fr);
    printf("    lat_fw    = %ld\n", buf[3].lat_fw);
    printf("    cnt_read  = %ld\n", buf[3].cnt_read  - buf[2].cnt_read);
    printf("    cnt_write = %ld\n", buf[3].cnt_write - buf[2].cnt_write);
    printf("    cnt_act   = %ld\n", buf[3].cnt_act   - buf[2].cnt_act);
    printf("    elapsed   = %.0f [ns]\n", (double)(clk[3] - clk[2]) * 1E9 / CLOCKS_PER_SEC);

    return;
}

int main(void)
{
    int fd;
    byte_t *base;
    struct nvmmctr *nc;

    fd = open("/dev/mem", O_RDWR);
    if (fd < 0) {
        perror("Failed to open /dev/mem");
        exit(1);
    }

    base = mmap(NULL, 4*1024, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0xC0000000UL);
    if (base == MAP_FAILED) {
        perror("Failed to mmap");
        exit(1);
    }

    nc = (struct nvmmctr *) mmap(NULL, 4*1024, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0x64003000UL);
    if (nc == MAP_FAILED) {
        perror("Failed to mmap");
        exit(1);
    }

    /* nvmm begin from 0xC000_0000 */
    nc->nvmm_begin = 2;

    nc->lat_cr = 0;
    nc->lat_cw = 0;
    nc->lat_fr = 0;
    nc->lat_fw = 0;
    printf("nolat\n");
    bench(base, nc);

    nc->lat_cr = 200;
    nc->lat_cw = 200;
    nc->lat_fr = 0;
    nc->lat_fw = 0;
    printf("coarse\n");
    bench(base, nc);

    nc->lat_cr = 0;
    nc->lat_cw = 0;
    nc->lat_fr = 200;
    nc->lat_fw = 200;
    printf("fine\n");
    bench(base, nc);


    munmap((void *) base);
    munmap((void *) nc);
    close(fd);

	return 0;
}

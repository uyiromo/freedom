// See LICENSE for license details.
#include <stdint.h>
#include <stddef.h>

#include <platform.h>

#include "common.h"

#define DEBUG
#include "kprintf.h"

#define MAX_CORES 8

#define PAYLOAD_SIZE	(26 << 11)

#ifndef TL_CLK
#error Must define TL_CLK
#endif

#define F_CLK TL_CLK

static volatile uint32_t * const spi = (void *)(SPI_CTRL_ADDR);

static inline uint8_t spi_xfer(uint8_t d)
{
	int32_t r;

	REG32(spi, SPI_REG_TXFIFO) = d;
	do {
		r = REG32(spi, SPI_REG_RXFIFO);
	} while (r < 0);
	return r;
}

static inline uint8_t sd_dummy(void)
{
	return spi_xfer(0xFF);
}

static uint8_t sd_cmd(uint8_t cmd, uint32_t arg, uint8_t crc)
{
	unsigned long n;
	uint8_t r;

	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;
	sd_dummy();
	spi_xfer(cmd);
	spi_xfer(arg >> 24);
	spi_xfer(arg >> 16);
	spi_xfer(arg >> 8);
	spi_xfer(arg);
	spi_xfer(crc);

	n = 1000;
	do {
		r = sd_dummy();
		if (!(r & 0x80)) {
//			dprintf("sd:cmd: %hx\r\n", r);
			goto done;
		}
	} while (--n > 0);
	kputs("sd_cmd: timeout");
done:
	return r;
}

static inline void sd_cmd_end(void)
{
	sd_dummy();
	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;
}


static void sd_poweron(void)
{
	long i;
	REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 300000UL);
	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_OFF;
	for (i = 10; i > 0; i--) {
		sd_dummy();
	}
	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;
}

static int sd_cmd0(void)
{
	int rc;
	dputs("CMD0");
	rc = (sd_cmd(0x40, 0, 0x95) != 0x01);
	sd_cmd_end();
	return rc;
}

static int sd_cmd8(void)
{
	int rc;
	dputs("CMD8");
	rc = (sd_cmd(0x48, 0x000001AA, 0x87) != 0x01);
	sd_dummy(); /* command version; reserved */
	sd_dummy(); /* reserved */
	rc |= ((sd_dummy() & 0xF) != 0x1); /* voltage */
	rc |= (sd_dummy() != 0xAA); /* check pattern */
	sd_cmd_end();
	return rc;
}

static void sd_cmd55(void)
{
	sd_cmd(0x77, 0, 0x65);
	sd_cmd_end();
}

static int sd_acmd41(void)
{
	uint8_t r;
	dputs("ACMD41");
	do {
		sd_cmd55();
		r = sd_cmd(0x69, 0x40000000, 0x77); /* HCS = 1 */
	} while (r == 0x01);
	return (r != 0x00);
}

static int sd_cmd58(void)
{
	int rc;
	dputs("CMD58");
	rc = (sd_cmd(0x7A, 0, 0xFD) != 0x00);
	rc |= ((sd_dummy() & 0x80) != 0x80); /* Power up status */
	sd_dummy();
	sd_dummy();
	sd_dummy();
	sd_cmd_end();
	return rc;
}

static int sd_cmd16(void)
{
	int rc;
	dputs("CMD16");
	rc = (sd_cmd(0x50, 0x200, 0x15) != 0x00);
	sd_cmd_end();
	return rc;
}

static uint16_t crc16_round(uint16_t crc, uint8_t data) {
	crc = (uint8_t)(crc >> 8) | (crc << 8);
	crc ^= data;
	crc ^= (uint8_t)(crc >> 4) & 0xf;
	crc ^= crc << 12;
	crc ^= (crc & 0xff) << 5;
	return crc;
}

#define SPIN_SHIFT	6
#define SPIN_UPDATE(i)	(!((i) & ((1 << SPIN_SHIFT)-1)))
#define SPIN_INDEX(i)	(((i) >> SPIN_SHIFT) & 0x3)

static const char spinner[] = { '-', '/', '|', '\\' };

static int copy(void)
{
	volatile uint8_t *p = (void *)(PAYLOAD_DEST);
	long i = PAYLOAD_SIZE;
	int rc = 0;

	dputs("CMD18");
	kprintf("LOADING  ");

	REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 16666666UL);
	if (sd_cmd(0x52, 0, 0xE1) != 0x00) {
		sd_cmd_end();
		return 1;
	}
	do {
		uint16_t crc, crc_exp;
		long n;

		crc = 0;
		n = 512;
		while (sd_dummy() != 0xFE);
		do {
			uint8_t x = sd_dummy();
			*p++ = x;
			crc = crc16_round(crc, x);
		} while (--n > 0);

		crc_exp = ((uint16_t)sd_dummy() << 8);
		crc_exp |= sd_dummy();

		if (crc != crc_exp) {
			kputs("\b- CRC mismatch ");
			rc = 1;
			break;
		}

		if (SPIN_UPDATE(i)) {
			kputc('\b');
			kputc(spinner[SPIN_INDEX(i)]);
		}
	} while (--i > 0);
	sd_cmd_end();

	sd_cmd(0x4C, 0, 0x01);
	sd_cmd_end();
	kputs("\b ");
	return rc;
}

typedef unsigned char byte_t;

struct nvmmctr {
    size_t clear;       /* 0x00 */
    size_t nvmm_begin;  /* 0x08 */
    size_t lat_cr;      /* 0x10 */
    size_t lat_cw;      /* 0x18 */
    size_t lat_tRCD2;   /* 0x20 */
    size_t lat_tRP2;    /* 0x28 */
    size_t lat_tRAS2;   /* 0x30 */
    size_t lat_dr256;   /* 0x38 */
    size_t lat_dr4096;  /* 0x40 */
    size_t lat_dw256;   /* 0x48 */
    size_t lat_dw4096;  /* 0x50 */
    size_t cnt_read;    /* 0x58 */
    size_t cnt_write;   /* 0x60 */
    size_t cnt_act;     /* 0x68 */
    size_t cnt_pre;     /* 0x70 */
    size_t cnt_bdr;     /* 0x78 */
    size_t cnt_bdw;     /* 0x80 */
};

#define CHECKPOINT(NUM)                                                 \
    __asm__ __volatile__ ("fence rw,rw\n");                             \
    __asm__ __volatile__ ("fence.i" : : : "memory");                    \
    __asm__ __volatile__ ("rdcycle t1\n" ::: "t1");                     \
    __asm__ __volatile__ ("lui t1, " #NUM  ::: "t1");


void
init_metadata(unsigned long *addr, unsigned long tag)
{
    unsigned char *cacheline = (unsigned char *) addr;
    *((volatile unsigned long *) (cacheline + 0x00000000UL)) = (1UL << 0) | (1UL << 56);  // 0, 56
    *((volatile unsigned long *) (cacheline + 0x00000008UL)) = (1UL << 48);               // 112
    *((volatile unsigned long *) (cacheline + 0x00000010UL)) = (1UL << 40);               // 168
    *((volatile unsigned long *) (cacheline + 0x00000018UL)) = (1UL << 32);               // 224
    *((volatile unsigned long *) (cacheline + 0x00000020UL)) = (1UL << 24);               // 280
    *((volatile unsigned long *) (cacheline + 0x00000028UL)) = (1UL << 16);               // 336
    *((volatile unsigned long *) (cacheline + 0x00000030UL)) = (1UL <<  8);               // 392
    *((volatile unsigned long *) (cacheline + 0x00000038UL)) = tag; //tag;

    return;
}




int main(void)
{
    struct nvmmctr *nc = (struct nvmmctr *) (0x64003000UL);
    volatile unsigned char *dram_base = (unsigned char *) (0x80000000UL);
    volatile unsigned char *nvmm_base = (unsigned char *) (0xC0000000UL);
    volatile unsigned char *flush64 = (unsigned char *) (0x02010000UL + 0x200UL);

    const unsigned int KiB = 1024;
    const unsigned int MiB = 1024 * 1024;
    const unsigned int GiB = 1024 * 1024 * 1024;


    /* nvmm begin from 0xC000_0000 */
/*
    nc->nvmm_begin = 2;
    nc->lat_cr     = 100;
    nc->lat_cw     = 110;
    nc->lat_tRCD2  = 0;
    nc->lat_tRP2   = 0;
    nc->lat_tRAS2  = 0;
    CHECKPOINT(0x00000);
    for (unsigned long off = 0; off < 4096; off += 64) {
        *((volatile unsigned long *) (nvmm_base + off)) = off;
    }
    for (unsigned long off = 0; off < 4096; off += 64) {
        *((volatile unsigned long *) flush64) = (unsigned long)(nvmm_base + off);
    }
    CHECKPOINT(0x11111);
*/
/*
    nc->nvmm_begin = 2;
    nc->lat_cr     = 0;
    nc->lat_cw     = 0;
    nc->lat_tRCD2  = 120;
    nc->lat_tRP2   = 130;
    nc->lat_tRAS2  = 140;
    CHECKPOINT(0x22222);
    for (unsigned long off = 4096; off < 4096 + 4096; off += 64) {
        *((volatile unsigned long *) (nvmm_base + off)) = off;
    }
    for (unsigned long off = 4096; off < 4096 + 4096; off += 64) {
        *((volatile unsigned long *) flush64) = (unsigned long)(nvmm_base + off);
    }
    CHECKPOINT(0x33333);
*/


#if 1
    volatile unsigned long initroot    = 0xC0000000UL + 0x07FFF000UL;
    //volatile unsigned long disableTree = 0xC0000000UL + 0x07FFF040UL;
    //volatile unsigned long enableTree  = 0xC0000000UL + 0x07FFF080UL;

    // Initialize root
    *((volatile unsigned long *) (initroot)) = 0xFUL;
    __asm__ __volatile__ (".insn i 0x73, 0, x0, %0, -0x340 \n\t" :: "r"(initroot));
    *((volatile unsigned long *) flush64) = (unsigned long)(initroot);
    __asm__ __volatile__ ("fence rw,rw\n");
    __asm__ __volatile__ ("fence.i" : : : "memory");


    unsigned int range, stride;
#if 0
    stride = 256*KiB;
    range  = stride * 32;
    CHECKPOINT(0x11111);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) (dram_base + off)) = off;
    }
    CHECKPOINT(0x22222);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) flush64) = (unsigned long)(dram_base + off);
    }
    CHECKPOINT(0x33333);

    stride = 4*KiB;
    range  = stride * 8;
    CHECKPOINT(0x11111);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) (nvmm_base + off)) = off;
    }
    CHECKPOINT(0x22222);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) flush64) = (unsigned long)(nvmm_base + off);
    }
    CHECKPOINT(0x33333);


    stride = 256*KiB;
    range  = stride * 8;
    CHECKPOINT(0x44444);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) (nvmm_base + off)) = off;
    }
    CHECKPOINT(0x55555);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) flush64) = (unsigned long)(nvmm_base + off);
    }
    CHECKPOINT(0x66666);
#endif

    /*
    for (int block = 2; block <= 16; block *= 2) {
        unsigned long acc = 0;

        // warm up TLB
        for (int i = 0; i < block; ++i)
            acc += *((volatile unsigned long *) (nvmm_base + i*512*KiB + 0*64));
        for (int i = 0; i < block; ++i)
            *((volatile unsigned long *) flush64) = 0xC0000000UL + i*512*KiB + 0*64;

        CHECKPOINT(0x11111);
        for (int i = 0; i < block; ++i)
            *((volatile unsigned long *) (nvmm_base + i*512*KiB + 0*64)) = i;
        CHECKPOINT(0x22222);
        for (int i = 0; i < block; ++i)
            *((volatile unsigned long *) flush64) = 0xC0000000UL + i*512*KiB + 0*64;
        CHECKPOINT(0x33333);
    }
    */



    /*
    // crash Tag
    volatile unsigned long tag = 0xC0000000UL + 0x06000000UL;
    *((volatile unsigned long *) (tag)) = 0xFUL;
    __asm__ __volatile__ (".insn i 0x73, 0, x0, %0, -0x340 \n\t" :: "r"(tag));
    *((volatile unsigned long *) flush64) = (unsigned long)(tag);
    __asm__ __volatile__ ("fence rw,rw\n");
    __asm__ __volatile__ ("fence.i" : : : "memory");
    CHECKPOINT(0x77777);
    */


    stride = 64;
    range  = stride * 4;
    CHECKPOINT(0x88888);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) (nvmm_base + off)) = off;
    }
    CHECKPOINT(0x99999);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) flush64) = (unsigned long)(nvmm_base + off);
    }
    CHECKPOINT(0xAAAAA);

    CHECKPOINT(0x88888);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) (dram_base + off)) = off;
    }
    CHECKPOINT(0x99999);
    for (unsigned long off = 0; off < range; off += stride) {
        *((volatile unsigned long *) flush64) = (unsigned long)(dram_base + off);
    }
    CHECKPOINT(0xAAAAA);


    CHECKPOINT(0xFFFFF);
    /*
     * -END-: MPE sequential test (range: 4 KiB, stride: 64 B)
     */
#endif













/*
	REG32(uart, UART_REG_TXCTRL) = UART_TXEN;

    kputs("INIT");
	sd_poweron();
	if (sd_cmd0() ||
	    sd_cmd8() ||
	    sd_acmd41() ||
	    sd_cmd58() ||
	    sd_cmd16() ||
	    copy()) {
		kputs("ERROR");
		return 1;
	}

	kputs("BOOT");
*/
	__asm__ __volatile__ ("fence.i" : : : "memory");
	return 0;
}

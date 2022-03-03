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


#define KiB (1024UL)
#define MiB (1024*KiB)

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

#define __fence() \
    __asm__ __volatile__ ("fence.i" : : : "memory");

void cflush(int64_t vaddr)
{
    __asm__ __volatile__(".insn i 0x73, 0, x0, %0, -0x340 \n\t"  :: "r"(vaddr));
    return;
}

void cflush_all()
{
    __asm__ __volatile__(".insn i 0x73, 0, x0, x0, -0x340 \n\t");
    return;

}

inline
int64_t rdcycle()
{
    int64_t t;
    __asm__ __volatile__ ("rdcycle %0\n" : "=r"(t) ::);
    return t;
}

#define BENCH_SIZE (96*MiB)

void
read_bench(byte_t *bank[8])
{
    int b, acc, iteration;
    int64_t offset;
    clock_t s, e;
    double elapse_ns[8];

    for (b = 2; b < 8; b += 1) {
        s = clock();
        for (offset = 0; offset < BENCH_SIZE; offset += 64) {
            acc += *((volatile unsigned long *) (bank[b] + offset));
        }
        e = clock();
        elapse_ns[b] = (double) (e - s) * 1000*1000*1000 / CLOCKS_PER_SEC;
    }

    printf("read bench\n");
    for (b = 2; b < 8; b += 1) {
        iteration = BENCH_SIZE / 64;
        printf("  bank #%d: elapsed: %.0f ns, ave = %.0f ns\n",
               b, elapse_ns[b], elapse_ns[b] / iteration);

    }
    return;
}

void
write_bench(byte_t *bank[8], int64_t *flush64lines)
{
    int b, iteration;
    int64_t offset;
    clock_t s, e;
    double elapse_ns[8], elapse_ns2[8];
    int64_t flushed[8];

    for (b = 2; b < 8; b += 1) {
        s = clock();
        for (offset = 0; offset < BENCH_SIZE; offset += 64) {
            *((volatile unsigned long *) (bank[b] + offset)) = offset;
        }
        e = clock();
        elapse_ns[b] = (double) (e - s) * 1000*1000*1000 / CLOCKS_PER_SEC;

        int64_t flushed0 = *flush64lines;
        s = clock();
        cflush_all();
        e = clock();
        flushed[b] = *flush64lines - flushed0;
        elapse_ns2[b] = (double) (e - s) * 1000*1000*1000 / CLOCKS_PER_SEC;
    }

    printf("write bench\n");
    for (b = 2; b < 8; b += 1) {
        iteration = BENCH_SIZE / 64;
        printf("  bank #%d: elapsed: %.0f ns, ave: %.0f ns, cflush: %.0f ns, ave: %.0f ns, flushed: %lu\n",
               b,
               elapse_ns[b], elapse_ns[b] / iteration,
               elapse_ns2[b], elapse_ns2[b] / flushed[b], flushed[b]
            );

    }
    return;
}

int comp(const void *a, const void *b)
{
    return *(int64_t *)a - *(int64_t *)b;
}

int64_t buf[128*MiB/64];

void
read_average(byte_t *base, int64_t phys_base, int64_t *flush64)
{
    int acc;
    int64_t stride, offset, t0, t1;
    int64_t medians[10];

    for (stride = 64; stride <= 1*MiB; stride *= 2) {
        for (int i = 0; i < 10; ++i) {
            for (offset = 0; offset < 128*MiB; offset += stride) {
                acc += *((volatile unsigned long *) (base + offset));
            }
            for (offset = 0; offset < 128*MiB; offset += stride) {
                *((volatile int64_t *) flush64) = (phys_base + offset);
            }

            int index = 0;
            for (offset = 0; offset < 128*MiB; offset += stride) {
                t0 = rdcycle();
                acc += *((volatile unsigned long *) (base + offset));
                t1 = rdcycle();
                buf[index++] = (t1 -t0);
            }
            qsort(buf, index, sizeof(int64_t), comp);
            //medians[i] = buf[index/2];
            medians[i] = buf[index/2];
            //for (int p = 0; p < index; p++) {
            //    printf("%lu\n", buf[p]);
            //}

            for (offset = 0; offset < 128*MiB; offset += stride) {
                *((volatile int64_t *) flush64) = (phys_base + offset);
            }
        }
        qsort(medians, 10, sizeof(int64_t), comp);
        printf("%lu %lu cycle\n", stride, medians[4]);
    }

    printf("\n");
    return;
}

void
write_average(byte_t *base, int64_t phys_base, int64_t *flush64)
{
    int acc;
    int64_t stride, offset, t0, t1;
    int64_t medians[10];

    for (stride = 64; stride <= 1*MiB; stride *= 2) {
        for (int i = 0; i < 10; ++i) {
            for (offset = 0; offset < 128*MiB; offset += stride) {
                acc += *((volatile unsigned long *) (base + offset));
            }
            for (offset = 0; offset < 128*MiB; offset += stride) {
                *((volatile int64_t *) flush64) = (phys_base + offset);
            }

            int index = 0;
            for (offset = 0; offset < 32*KiB; offset += stride) {
                *((volatile unsigned long *) (base + offset)) = offset;
            }
            for (offset = 0; offset < 32*KiB; offset += stride) {
                t0 = rdcycle();
                *((volatile int64_t *) flush64) = (phys_base + offset);
                t1 = rdcycle();
                int64_t tt = t1 - t0;
                buf[index++] = tt;
                /*if ((30 < tt) & (tt < 2000)) {
                   buf[index++] = tt;
                    printf("%lu\n", tt);
                    }*/
            }
            for (int j = 0; j < index; ++j) {
                printf("%lu\n", buf[index]);
            }
            qsort(buf, index, sizeof(int64_t), comp);
            medians[i] = buf[index/2];
        }
        qsort(medians, 10, sizeof(int64_t), comp);
        printf("%lu %lu cycle\n", stride, medians[4]);
    }

    printf("\n");
    return;
}



int main(void)
{
    int fd;
    byte_t *bank[8];
    struct nvmmctr *nc;
    byte_t *l2ctrl;
    int64_t *flush64lines, *flush64;

    fd = open("/dev/mem", O_RDWR);
    if (fd < 0) {
        perror("Failed to open /dev/mem");
        exit(1);
    }

    for (unsigned long b = 2; b < 8; ++b) {
        size_t paddr = 0x80000000UL + b * 512*MiB;
        byte_t *vaddr = mmap(NULL, 128*MiB, PROT_READ|PROT_WRITE, MAP_SHARED, fd, paddr);
        if (vaddr == MAP_FAILED) {
            perror("Failed to mmap");
            exit(1);
        }
        fprintf(stderr, "vaddr(%016lX) ---> paddr(%016lX)\n", vaddr, paddr);
        bank[b] = vaddr;
    }

    nc = (struct nvmmctr *) mmap(NULL, 4*KiB, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0x64003000UL);
    if (nc == MAP_FAILED) {
        perror("Failed to mmap");
        exit(1);
    }

    l2ctrl = mmap(NULL, 4*KiB, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0x02010000UL);
    if (l2ctrl == MAP_FAILED) {
        perror("Failed to mmap");
        exit(1);
    }
    flush64      = (int64_t *) (l2ctrl + 0x200UL);
    flush64lines = (int64_t *) (l2ctrl + 0x280UL);

#if 1
    // Initialize Tree
    //init_metadata(bank[2]);

    // Initialize root by writing some at nvmm_base + 0x07FFF000
    *((volatile int64_t *) (bank[2] + 0x07FFF000)) = 0xFUL;
    cflush((int64_t) (bank[2] + 0x07FFF000UL));
    fprintf(stderr, "Initialized root\n");
#endif

    /* nvmm begin from Bank #4 */
    nc->nvmm_begin = 2;

    nc->lat_cr    = 0;
    nc->lat_cw    = 0;
    nc->lat_tRCD2 = 0;
    nc->lat_tRP2  = 0;
    nc->lat_tRAS2 = 0;
    nc->lat_dr256  = 176;  // 0.25 cpu clock per 1
    nc->lat_dr4096 = 240;  // 0.25 cpu clock per 1
    nc->lat_dw256  = 128;  // 0.25 cpu clock per 1
    nc->lat_dw4096 = 324;  // 0.25 cpu clock per 1

#if 1
    //read_average(bank[3], 0x80000000UL + 3*512*MiB, flush64);
    write_average(bank[3], 0x80000000UL + 3*512*MiB, flush64);
    //read_average(bank[4], 0x80000000UL + 4*512*MiB, flush64);
    //write_average(bank[4], 0x80000000UL + 4*512*MiB, flush64);
    return 0;
#endif

    write_bench(bank, flush64lines);
    //read_bench(bank);
    //write_bench(bank, flush64lines);
    //read_bench(bank);

#if 0
    byte_t *tag_base = bank[2] + 0x06000000UL;
    byte_t *cr_base  = bank[2] + 0x06C00000UL;
    byte_t *l0_base  = bank[2] + 0x07E00000UL;
    byte_t *l1_base  = bank[2] + 0x07FC0000UL;
    byte_t *l2_base  = bank[2] + 0x07FF8000UL;

    unsigned long offset;
    *((volatile unsigned long *) l1_base) = 0xFUL;
    cflush((int64_t) l1_base);

    for (offset = 0; offset < 32*KiB; offset += 1*KiB) {
        fprintf(stderr, "%016X = %lX\n", 0x80000000UL + offset,
                *((volatile unsigned long *) (bank[2] + offset)));
    }
    fprintf(stderr, "sleep...\n");
    sleep(10);
    for (offset = 32*KiB; offset < 64*KiB; offset += 1*KiB) {
        fprintf(stderr, "%016X = %lX\n", 0x80000000UL + offset,
                *((volatile unsigned long *) (bank[2] + offset)));
    }
#endif

    /* finalize */
    for (unsigned long b = 2; b < 8; ++b) {
        munmap((void *) (bank[b]), 128*MiB);
    }
    munmap((void *) nc, 4*KiB);
    munmap((void *) l2ctrl, 4*KiB);
    close(fd);

	return 0;
}

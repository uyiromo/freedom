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


int64_t rdcycle(void)
{
    unsigned long cycles;
    asm volatile ("rdcycle %0" : "=r"(cycles));
    return cycles;
}


int main(void)
{
    int fd;
    unsigned char *base, *l2ctrl;
    int64_t *flush64, *flush64lines;
    int64_t t0, t1;
    int64_t line0, line1;

    fd = open("/dev/mem", O_RDWR);
    if (fd < 0) {
        perror("Failed to open /dev/mem");
        exit(1);
    }

    base = mmap(NULL, 32*1024, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0xCA000000UL);
    if (base == MAP_FAILED) {
        perror("Failed to mmap");
        exit(1);
    }

    l2ctrl = mmap(NULL, 4*1024, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0x02010000UL);
    if (l2ctrl == MAP_FAILED) {
        perror("Failed to mmap");
        exit(1);
    }
    flush64 = (int64_t *) (l2ctrl + 0x200UL);
    flush64lines = (int64_t *) (l2ctrl + 0x280UL);

    t0 = rdcycle();
    for (int i = 0; i < 32*1024; i += 32) {
        *((unsigned int *)(base + i)) = 0xF;
    }
    t1 = rdcycle();
    fprintf(stderr, "Store 32KiB / t1 - t0 = %ld\n", t1 - t0);

    t0 = rdcycle();
    for (int i = 0; i < 32*1024; i += 32) {
        *((unsigned int *)(base + i)) = 0xF;
    }
    t1 = rdcycle();
    fprintf(stderr, "Store 32KiB / t1 - t0 = %ld\n", t1 - t0);

    line0 = *flush64lines;
    t0 = rdcycle();
    __asm__ __volatile__(".insn i 0x73, 0, x0, x0, -0x340 \n\t");
    t1 = rdcycle();
    line1 = *flush64lines;
    fprintf(stderr, "CFLUSH.D.L1 / t1 - t0 = %ld, lines = %ld\n", t1 - t0, line1 - line0);

    t0 = rdcycle();
    for (int i = 0; i < 32*1024; i += 32) {
        *((unsigned int *)(base + i)) = 0xF;
    }
    t1 = rdcycle();
    fprintf(stderr, "Store 32KiB / t1 - t0 = %ld\n", t1 - t0);

    __asm__ __volatile__(".insn i 0x73, 0, x0, x0, -0x340 \n\t");

    t0 = rdcycle();
    for (int i = 0; i < 32*1024; i += 32) {
        *((unsigned int *)(base + i)) = 0xF;
    }
    t1 = rdcycle();
    fprintf(stderr, "Store 32KiB / t1 - t0 = %ld\n", t1 - t0);

    t0 = rdcycle();
    for (int i = 0; i < 32*1024; i += 32) {
        *((unsigned int *)(base + i)) = 0xF;
    }
    t1 = rdcycle();
    fprintf(stderr, "Store 32KiB / t1 - t0 = %ld\n", t1 - t0);

    line0 = *flush64lines;
    t0 = rdcycle();
    for (int i = 0; i < 32*1024/64; ++i) {
       *flush64 = 0xCA000000UL + i;
    }
    t1 = rdcycle();
    line1 = *flush64lines;
    fprintf(stderr, "L2flush / t1 - t0 = %ld, lines = %ld\n", t1 - t0, line1 - line0);


    t0 = rdcycle();
    for (int i = 0; i < 32*1024; i += 32) {
        *((unsigned int *)(base + i)) = 0xF;
    }
    t1 = rdcycle();
    fprintf(stderr, "Store 32KiB / t1 - t0 = %ld\n", t1 - t0);



    munmap((void *) base, 32*1024);
    munmap((void *) l2ctrl, 4*1024);
    close(fd);

	return 0;
}


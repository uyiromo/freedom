#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include <sys/mman.h>

const unsigned long KiB = 1024;
const unsigned long MiB = 1024*1024;
const unsigned long GiB = 1024*1024*1024;

static inline
void
memory_barrier()
{
    //__asm__ __volatile__ (".insn i 0x73, 0, x0, x0, -0x340 \n");
    __asm__ __volatile__ ("fence rw,rw\n");
    __asm__ __volatile__ ("fence.i" : : : "memory");
    return;
}


static inline
void
flush_line(void *flush64, int64_t paddr) {
    *((volatile int64_t *) flush64) = paddr;
    memory_barrier();

    return;
}

static inline
void
flush_lines(void *flush64, int64_t paddr_begin, int64_t paddr_end, int64_t stride) {

    int64_t paddr;
    int64_t rc0, rc1, rt0, rt1;
    clock_t c0, c1;

    for (paddr = paddr_begin; paddr < paddr_end; paddr += stride) {
        *((volatile int64_t *) flush64) = paddr;
    }
    //memory_barrier();

    return;
}




void
read_metadata(int64_t *addr)
{
    unsigned char *cacheline = (unsigned char *) addr;
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000000UL)));
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000008UL)));
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000010UL)));
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000018UL)));
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000020UL)));
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000028UL)));
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000030UL)));
    printf("cacheline: %016lX\n", *((volatile int64_t *) (cacheline + 0x00000038UL)));
    printf("\n");

    return;
}


void
init_metadata(void *nvmm_base, void *flush64)
{
    FILE *fp;
    clock_t c0, c1;

    // open mem_init.txt
    fp = fopen("mem_init.txt", "r");
    if (fp == NULL) {
        perror("Failed to open mem_init.txt");
        exit(1);
    }

    //////////////////////////////////////////////////////////
    //                    fill metagata                     //
    //////////////////////////////////////////////////////////
    fprintf(stderr, "Initializing Metadata...\n");
    c0 = clock();
    while(1) {
        unsigned int addr;
        int64_t cl[8];
        char buf[20];

        // addr
        fgets(buf, 9, fp);
        sscanf(buf, "%08x", &addr);
        addr -= 0x40000000UL;

        if (feof(fp)) {
            break;
        }

        // skip space
        fgets(buf, 2, fp);

        // cachelines
        for (int i = 7; i >= 0; --i) {
            fgets(buf, 17, fp);
            sscanf(buf, "%016lx", &cl[i]);
        }

        // skip newline
        fgets(buf, 2, fp);

        for (int64_t i = 0; i < 8; ++i) {
            *((volatile int64_t *) (nvmm_base + addr + 8 * i)) = cl[i];
        }
        flush_line(flush64, 0xC0000000UL + addr);

        if ((addr % (MiB)) == 0) {
            fprintf(stderr, "addr: %3ld MiB\n", addr / MiB);
        }

    }
    c1 = clock();
    fprintf(stderr, "Initialized Metadata: elapsed: %.0f [sec]\n",
            (double) (c1 - c0) / CLOCKS_PER_SEC);

    fclose(fp);

    return;
}




int
main()
{
    int fd;
    void *base, *base2;
    unsigned char *nvmm_base;
    int64_t *flush64;

    int64_t mem_offset;

    // map memory
    fd = open("/dev/mem", O_RDWR);
    if (fd == -1) {
        perror("Failed to open /dev/mem");
        exit(1);
    }

    base = mmap(NULL, 256*MiB, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0xC0000000UL);
    if (base == NULL) {
        perror("Failed to mmap base");
        exit(1);
    }
    nvmm_base = ((unsigned char *) base);

    base2 = mmap(NULL, 4*KiB, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0x02010000UL);
    if (base2 == NULL) {
        perror("Failed to mmap base2");
        exit(1);
    }
    flush64 = (int64_t *) (((unsigned char *)base2) + 0x200UL);


    init_metadata(nvmm_base, flush64);

    // Initialize root by writing some at nvmm_base + 0x47FFF000
    *((volatile int64_t *) (nvmm_base + 0x07FFF000)) = 0xFUL;
    flush_line(flush64, 0xC7FFF000UL);
    fprintf(stderr, "Initialized root\n");

    read_metadata(nvmm_base + 0x06000000UL);
    read_metadata(nvmm_base + 0x06C00000UL);
    read_metadata(nvmm_base + 0x07E00000UL);
    read_metadata(nvmm_base + 0x07FC0000UL);
    read_metadata(nvmm_base + 0x07FF8000UL);


    for (mem_offset = 0x00000000UL; mem_offset < 0x06000000UL; mem_offset += 64) {
        int64_t acc = *((volatile int64_t *) (nvmm_base + mem_offset));
        if (acc == 0xFFFFFFFFFFFFFFFFUL) {
            fprintf(stderr, "%08lX has error\n", mem_offset);
        }
    }


    munmap(base2, 4*KiB);
    munmap(base,  256*MiB);
    close(fd);

    return 0;
}

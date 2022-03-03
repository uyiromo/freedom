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
int64_t
rdcycle()
{
    int64_t t;
    __asm__ __volatile__ ("rdcycle %0\n" : "=r"(t) ::);
    return t;
}

static inline
int64_t
rdtime()
{
    int64_t t;
    __asm__ __volatile__ ("rdtime %0\n" : "=r"(t) ::);
    return t;
}


static inline
void
memory_barrier()
{
    //__asm__ __volatile__ (".insn i 0x73, 0, x0, x0, -0x340 \n");
    __asm__ __volatile__ ("fence iorw,iorw\n");
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

    c0  = clock();
    rt0 = rdtime();
    rc0 = rdcycle();
    for (paddr = paddr_begin; paddr < paddr_end; paddr += stride) {
        *((volatile int64_t *) flush64) = paddr;
    }
    memory_barrier();
    rc1 = rdcycle();
    rt1 = rdtime();
    c1  = clock();

    //fprintf(stderr, "Flush: %8ld [cyc], %8ld [ns], %8ld [ns]\n",
    //        (rc1 - rc0), (rt1 - rt0)*1000, (c1 - c0)*1000*1000*1000/CLOCKS_PER_SEC);

    return;
}




void
read_metadata(int64_t *addr)
{
    unsigned char *cacheline = (unsigned char *) addr;
    fprintf(stderr, "addr = %X\n", (int64_t) addr);
    fprintf(stderr, "cacheline = %X\n", (int64_t) cacheline);
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


void
read_test(void *nvmm_base, int64_t begin, int64_t end, int64_t stride)
{
    unsigned acc, nlines, mem_offset;
    int64_t rc0, rc1, rt0, rt1;
    clock_t c0, c1;

    acc = 0;
    c0  = clock();
    rt0 = rdtime();
    rc0 = rdcycle();
    for (mem_offset = begin; mem_offset < end; mem_offset += stride) {
        acc += *((volatile int64_t *) (nvmm_base + mem_offset));
    }
    rc1 = rdcycle();
    rt1 = rdtime();
    c1  = clock();

    nlines = (end - begin)/stride;
    fprintf(stderr, " Read: acc = %08ld, %5ld [cyc], %5ld [ns], %5ld [ns]\n",
            acc, (rc1 - rc0)/nlines, (rt1 - rt0)*1000/nlines,
            (c1 - c0)*1000*1000*1000/nlines/CLOCKS_PER_SEC);

    return;
}

void
write_test(void *nvmm_base, int64_t begin, int64_t end, int64_t stride, void *flush64)
{
    unsigned acc, nlines, mem_offset;
    int64_t rc0, rc1, rt0, rt1;
    clock_t c0, c1;

    acc = 0;
    memory_barrier();
    c0  = clock();
    rt0 = rdtime();
    rc0 = rdcycle();
    for (mem_offset = begin; mem_offset < end; mem_offset += stride) {
        *((volatile int64_t *) (nvmm_base + mem_offset)) = 0xFUL;
    }
    memory_barrier();
    rc1 = rdcycle();
    rt1 = rdtime();
    c1  = clock();

    nlines = (end - begin)/stride;
    fprintf(stderr, "Write: acc = %08ld, %5ld [cyc], %5ld [ns], %5ld [ns]\n",
            acc, (rc1 - rc0)/nlines, (rt1 - rt0)*1000/nlines,
            (c1 - c0)*1000*1000*1000/nlines/CLOCKS_PER_SEC);


    flush_lines(flush64, 0xC0000000UL + begin, 0xC0000000UL + end, stride);

    return;
}


#define TLB_COLD (0)
#define TLB_HOT  (1)
#define NO_FLUSH (0)
#define DO_FLUSH (1)
const int N = 524288;

int cmp(const void *a, const void *b) {
  return *(int16_t *)a - *(int16_t *)b;
}


int64_t
get_median(int16_t data[N]) {
    // sort
    qsort(data, N, sizeof(int16_t), cmp);

    // get first index of NON-zero
    int idx0;
    for (idx0 = 0; idx0 < N; ++idx0) {
        if (data[idx0] != 0)
            break;
    }

    // get median [idx0:N]
    return data[(idx0 + N)/2];
}


void
read_test1(void *base, int64_t begin, int64_t end, int64_t stride, int64_t block,
            int tlb, int flush, void *flush64)
{
    unsigned acc, nlines;
    unsigned long in_stride, in_range;
    int64_t rc, rc1;
    int64_t rcyc, wcyc, cyc;

    acc = rcyc = wcyc = cyc = 0;
    for (in_stride = 0; in_stride < stride; in_stride += 64) {
        for (in_range = begin; in_range < end; in_range += stride * block) {
            // warm up TLB
            if (tlb == TLB_HOT) {
                for (int j = 0; j < block; ++j) {
                    acc += *((volatile int64_t *) (base + in_range + j*stride + in_stride));
                }
                for (int j = 0; j < block; ++j) {
                    *((volatile int64_t *) flush64) =
                        (0xC0000000UL + in_range + j*stride + in_stride);
                }
            }

            // measure loop
            memory_barrier();
            rc1 = rdcycle();
            rc = rdcycle();
            for (int j = 0; j < block; ++j) {
                acc += *((volatile int64_t *) (base + in_range + j*stride + in_stride));
            }
            memory_barrier();
            rcyc += rdcycle() - rc;

            memory_barrier();
            rc = rdcycle();
            memory_barrier();
            wcyc += rdcycle() - rc;
            cyc += rdcycle() - rc1;
            memory_barrier();
        }
    }
    nlines = ((end - begin)/stride) * (stride / 64);
    fprintf(stderr, "%s %s %2d %3ld %5ld %5ld %5ld\n",
            tlb == TLB_HOT ? "TLB_HOT" : "TLB_COLD",
            flush == DO_FLUSH ? "DO_FLUSH" : "NO_FLUSH",
            block, stride/KiB, cyc/nlines, rcyc/nlines, wcyc/nlines);

    flush_lines(flush64, 0xC0000000UL + begin, 0xC0000000UL + end, stride);

    return;
}

void
write_test1(void *base, int64_t begin, int64_t end, int64_t stride, int64_t block,
            int tlb, int flush, void *flush64)
{
    unsigned acc;
    unsigned long in_stride, in_range;

    int cycidx;
    int16_t rcyc[N], wcyc[N];
    int64_t cyc1, cyc2;

    // fill buffer with zero
    for (int i = 0; i < N; ++i) {
        rcyc[i] = wcyc[i] = 0;
    }
    cycidx = 0;

    for (in_stride = 0; in_stride < stride; in_stride += 64) {
        for (in_range = begin; in_range < end; in_range += stride * block) {
            // warm up TLB
            if (tlb == TLB_HOT) {
                for (int j = 0; j < block; ++j) {
                    acc += *((volatile int64_t *) (base + in_range + j*stride + j*64 + in_stride));
                }
                for (int j = 0; j < block; ++j) {
                    *((volatile int64_t *) flush64) =
                        (0xC0000000UL + in_range + j*stride + j*64 + in_stride);
                }
            }

            //fprintf(stderr, "wait\n");
            //sleep(10);

            // measure loop
            memory_barrier();
            cyc1 = rdcycle();
            for (int j = 0; j < block; ++j) {
                *((volatile int64_t *) (base + in_range + j*stride + j*64 + in_stride)) = 0xFL;
            }
            memory_barrier();
            cyc2 = rdcycle();
            rcyc[cycidx] = (cyc2 - cyc1)/block;
            //printf("%ld\n", cyc2 - cyc1);

            memory_barrier();
            cyc1 = rdcycle();
            if (flush == DO_FLUSH) {
                for (int j = 0; j < block; ++j) {
                    *((volatile int64_t *) flush64) =
                        (0xC0000000UL + in_range + j*stride + j*64 + in_stride);
                }
            }
            memory_barrier();
            cyc2 = rdcycle();
            wcyc[cycidx] = (cyc2 - cyc1)/block;

            cycidx += 1;
            memory_barrier();
        }
    }
    //exit(1);

    // get median of rcyc and wcyc
    int16_t rcyc_m = get_median(rcyc);
    int16_t wcyc_m = get_median(wcyc);

    fprintf(stderr, "%s %s %2d %4ld %5ld %5ld %5ld\n",
            tlb == TLB_HOT ? "TLB_HOT" : "TLB_COLD",
            flush == DO_FLUSH ? "DO_FLUSH" : "NO_FLUSH",
            block, stride/KiB, rcyc_m + wcyc_m, rcyc_m, wcyc_m);

    flush_lines(flush64, 0xC0000000UL + begin, 0xC0000000UL + end, stride);

    return;
}

void
write_test2(void *base, int64_t begin, int64_t end, int64_t stride, int64_t block,
            int tlb, int flush, void *flush64)
{
    unsigned acc;
    unsigned long in_stride, in_range;

    int cycidx;
    int16_t rcyc[N], wcyc[N];
    int64_t cyc1, cyc2;

    // fill buffer with zero
    for (int i = 0; i < N; ++i) {
        rcyc[i] = wcyc[i] = 0;
    }
    cycidx = 0;

    for (in_stride = 0; in_stride < stride; in_stride += 64) {
        for (in_range = begin; in_range < end; in_range += stride * block) {
            // warm up TLB
            if (tlb == TLB_HOT) {
                for (int j = 0; j < block; ++j) {
                    acc += *((volatile int64_t *) (base + in_range + j*stride + 0*64 + in_stride));
                }
                for (int j = 0; j < block; ++j) {
                    *((volatile int64_t *) flush64) =
                        (0xC0000000UL + in_range + j*stride + 0*64 + in_stride);
                }
            }

            fprintf(stderr, "wait\n");
            sleep(10);

            // measure loop
            memory_barrier();
            cyc1 = rdcycle();
            for (int j = 0; j < block; ++j) {
                *((volatile int64_t *) (base + in_range + j*stride + 0*64 + in_stride)) = 0xFL;
            }
            memory_barrier();
            cyc2 = rdcycle();
            rcyc[cycidx] = (cyc2 - cyc1)/block;
            //printf("%ld\n", cyc2 - cyc1);

            memory_barrier();
            cyc1 = rdcycle();
            if (flush == DO_FLUSH) {
                for (int j = 0; j < block; ++j) {
                    *((volatile int64_t *) flush64) =
                        (0xC0000000UL + in_range + j*stride + 0*64 + in_stride);
                }
            }
            memory_barrier();
            cyc2 = rdcycle();
            wcyc[cycidx] = (cyc2 - cyc1)/block;

            cycidx += 1;
            memory_barrier();
        }
    }
    //exit(1);

    // get median of rcyc and wcyc
    int16_t rcyc_m = get_median(rcyc);
    int16_t wcyc_m = get_median(wcyc);

    fprintf(stderr, "%s %s %2d %4ld %5ld %5ld %5ld\n",
            tlb == TLB_HOT ? "TLB_HOT" : "TLB_COLD",
            flush == DO_FLUSH ? "DO_FLUSH" : "NO_FLUSH",
            block, stride/KiB, rcyc_m + wcyc_m, rcyc_m, wcyc_m);

    flush_lines(flush64, 0xC0000000UL + begin, 0xC0000000UL + end, stride);

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
    int64_t t0, t1, tt0, tt1;
    int64_t acc;
    clock_t c0, c1;
    int64_t begin, end;

    // map memory
    fd = open("/dev/mem", O_RDWR);
    if (fd == -1) {
        perror("Failed to open /dev/mem");
        exit(1);
    }

    base = mmap(NULL, 128*MiB, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0xC0000000UL);
    //base = malloc(128*MiB);
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

///*
    init_metadata(nvmm_base, flush64);

    // Initialize root by writing some at nvmm_base + 0x07FFF000
    *((volatile int64_t *) (nvmm_base + 0x07FFF000)) = 0xFUL;
    flush_line(flush64, 0xC7FFF000UL);
    fprintf(stderr, "Initialized root\n");
//*/


#if 0
    // Measure raw NVMM performance
    fprintf(stderr, "*** RAW PERFORMANCE ***\n");
    begin = 0x08000000UL;
    end   = 0x0E000000UL;

    read_test(nvmm_base, begin, end, 64);
    write_test(nvmm_base, begin, end, 64, flush64);
#endif


    // Measure raw NVMM performance
    fprintf(stderr, "*** TREE PERFORMANCE ***\n");
    begin = 0x00000000UL;
    end   = 0x06000000UL;
/*
    fprintf(stderr, "  TLB    FLUSH  block stride cyc rcyc wcyc\n");
    for (int tlb = TLB_COLD; tlb <= TLB_HOT; tlb++) {
        for (int block = 2; block <= 8*16; block *= 2) {
            for (int64_t stride = 4*KiB; stride <= 512*KiB; stride *= 2) {
                read_test1(nvmm_base, begin, 64*MiB, stride, block, tlb, NO_FLUSH, flush64);
            }
        }
    }

    fprintf(stderr, "  TLB    FLUSH  block stride cyc rcyc wcyc\n");
    for (int tlb = TLB_COLD; tlb <= TLB_HOT; tlb++) {
        for (int block = 2; block <= 8*16; block *= 2) {
            for (int64_t stride = 4*KiB; stride <= 512*KiB; stride *= 2) {
                read_test2(nvmm_base, begin, 64*MiB, stride, block, tlb, NO_FLUSH, flush64);
            }
        }
    }
*/
/*    for (int block = 2; block <= 4; block *= 2) {
        for (int64_t stride = 4*KiB; stride <= 8*512*KiB; stride *= 2) {
            write_test2(nvmm_base, begin, 64*MiB, stride, block, TLB_HOT, NO_FLUSH, flush64);
        }
        }*/
    //write_test2(nvmm_base, begin, 64*MiB, 64*KiB, 2, TLB_HOT, NO_FLUSH, flush64);
    //exit(1);
    //write_test1(nvmm_base, begin, 64*MiB, 512*KiB,  2, TLB_HOT, DO_FLUSH, flush64);
    //write_test1(nvmm_base, begin, 64*MiB, 512*KiB,  4, TLB_HOT, DO_FLUSH, flush64);
    //write_test1(nvmm_base, begin, 64*MiB, 512*KiB,  8, TLB_HOT, DO_FLUSH, flush64);
    //write_test1(nvmm_base, begin, 64*MiB, 512*KiB, 16, TLB_HOT, DO_FLUSH, flush64);
    //exit(1);

    clock_t s, e;
    int64_t ss, ee;
    int64_t off;
    volatile int64_t tmp;

#pragma omp parallel for private(off, tmp)
    for (off = 0; off < 256*KiB; off += 64) {
        tmp = *((volatile int64_t *) (nvmm_base + off));
    }
    flush_lines(flush64, 0xC0000000UL, 0xC0000000UL + 256*KiB, 64);
    s  = clock();
    ss = rdcycle();
#pragma omp parallel for private(off, tmp)
    for (off = 0; off < 256*KiB; off += 64) {
        tmp = *((volatile int64_t *) (nvmm_base + off));
    }
    memory_barrier();
    ee = rdcycle();
    e  = clock();
    fprintf(stderr, "diff = %ld [clk]\n", (ee - ss) / (256*KiB/64));
    fprintf(stderr, "diff = %.0f [ns]\n", ((double) (e - s)) / CLOCKS_PER_SEC * 1e9);


#pragma omp parallel for private(off, tmp)
    for (off = 0; off < 4*256*KiB; off += 64) {
        tmp = *((volatile int64_t *) (nvmm_base + off));
    }
    flush_lines(flush64, 0xC0000000UL, 0xC0000000UL + 4*256*KiB, 64);
    s = clock();
    ss = rdcycle();
#pragma omp parallel for private(off, tmp)
    for (off = 0; off < 4*256*KiB; off += 64) {
        tmp = *((volatile int64_t *) (nvmm_base + off));
    }
    memory_barrier();
    ee = rdcycle();
    e = clock();
    fprintf(stderr, "diff = %ld [clk]\n", (ee - ss) / (4*256*1024/64));
    fprintf(stderr, "diff = %.0f [ns]\n", ((double) (e - s)) / CLOCKS_PER_SEC * 1e9);

    exit(1);








    fprintf(stderr, "  TLB    FLUSH  block stride cyc rcyc wcyc\n");
    for (int flush = NO_FLUSH; flush <= DO_FLUSH; flush++) {
        for (int block = 2; block <= 16; block *= 2) {
            for (int64_t stride = 4*KiB; stride <= 8*512*KiB; stride *= 2) {
                write_test1(nvmm_base, begin, 64*MiB, stride, block, TLB_HOT, flush, flush64);
            }
        }
    }

    fprintf(stderr, "  TLB    FLUSH  block stride cyc rcyc wcyc\n");
    for (int flush = NO_FLUSH; flush <= DO_FLUSH; flush++) {
        for (int block = 2; block <= 16; block *= 2) {
            for (int64_t stride = 4*KiB; stride <= 8*512*KiB; stride *= 2) {
                write_test2(nvmm_base, begin, 64*MiB, stride, block, TLB_HOT, flush, flush64);
            }
        }
    }



#if 0
    // flush before crash test
    for (mem_offset = begin; mem_offset < end; mem_offset += 64) {
        flush_line(flush64, 0xC0000000UL + mem_offset);
    }
    memory_barrier();


    fprintf(stderr, "*** CRASH TREE ***\n");
    *((volatile int64_t *) (nvmm_base + 0x06000000)) = 0x0UL;  // tag
    flush_line(flush64, 0xC6000000UL);
    fprintf(stderr, "0xC0000000 = %lX\n",
            *((volatile int64_t *) (nvmm_base + 0x00000000)));
#endif

    munmap(base2, 4*KiB);
    munmap(base,  256*MiB);
    close(fd);

    return 0;
}

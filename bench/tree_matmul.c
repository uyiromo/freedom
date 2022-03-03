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

    for (paddr = paddr_begin; paddr < paddr_end; paddr += stride) {
        *((volatile int64_t *) flush64) = paddr;
    }
    memory_barrier();

    return;
}




int
main()
{
    int fd;
    void *base, *base2;
    unsigned char *nvmm_base;
    int64_t *flush64;

    const int N = 512;
    int i, j, k;
    double *a, *b, *c;
    int64_t rc0, rc1;

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


    // Initialize
    a = (double *) (nvmm_base + 0*32*MiB);
    b = (double *) (nvmm_base + 1*32*MiB);
    c = (double *) (nvmm_base + 2*32*MiB);

    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j) {
            a[i*N+j] = b[i*N+j] = (i+j);
            c[i*N+j] = 0;
        }
    }

    rc0 = rdcycle();
    for (i = 0; i < N; ++i) {
        for (k = 0; k < N; ++k) {
            for (j = 0; j < N; ++j) {
                c[i*N+j] += a[i*N+k] * b[k*N+j];
            }
            *((volatile int64_t *)flush64) = (0xC0000000UL + 2*32*MiB + i*8*N + j*8);
        }
    }
    rc1 = rdcycle();
    fprintf(stderr, "c[0][0] = %.0f, cycle = %ld\n", c[0*N+0], rc1 - rc0);


    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j) {
            a[i*N+j] = b[i*N+j] = (i+j);
            c[i*N+j] = 0;
        }
    }

    rc0 = rdcycle();
    for (i = 0; i < N; ++i) {
        for (k = 0; k < N; ++k) {
            for (j = 0; j < N; ++j) {
                c[i*N+j] += a[i*N+k] * b[k*N+j];
            }
        }
    }
    rc1 = rdcycle();
    fprintf(stderr, "c[0][0] = %.0f, cycle = %ld\n", c[0*N+0], rc1 - rc0);




    munmap(base2, 4*KiB);
    munmap(base,  256*MiB);
    close(fd);

    return 0;
}

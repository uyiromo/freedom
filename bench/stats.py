#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

def stats(data):
    N = len(data)  # the number of data

    # sort data to make calculation simple
    data.sort()

    # 1. Calculate simple average and median
    ave = sum(data)/N
    med = data[int(N/2)]

    # 2. Calculate upper/lower limit to exclude lower/upper 5% values
    ul = int(N * 0.95) + 1
    ll = int(N * 0.05)

    # 3. Re-calculate average and median
    data2 = data[ll:ul]
    N2    = len(data2)
    ave2  = sum(data2)/N2
    med2  = data2[int(N2/2)]

    # 4. Count the number of UPPER outliers that is bigger than median by 20%
    b = med2 * 1.20
    nuo = sum([x > b for x in data])

    # 5. Count the number of LOWER outliers that is smaller than median by 20%
    b = med2 * 0.80
    nlo = sum([x < b for x in data])

    # Print stats
    print("# of data: {}".format(N))
    print("  Ave : {}".format(ave))
    print("  Med : {}".format(med))
    print("  Ave2: {}".format(ave2))
    print("  Med2: {}".format(med2))
    print("# of upper outliers: {}({:.0f}%)".format(nuo, nuo/N*100))
    print("# of lower outliers: {}({:.0f}%)".format(nlo, nlo/N*100))

if __name__ == "__main__":
    for s in sys.argv[1:]:
        with open(s) as f:
            stats([int(x) for x in f.readlines()])


# EOF

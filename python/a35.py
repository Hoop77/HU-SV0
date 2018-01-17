#!/usr/bin/env python

from math import *

def dft(u, v):
    return 0.5 * cos(pi / 2.0 * u * v) - 0.5 * 1j * sin(pi / 2.0  * u * v)

for u in range(0, 4):
    for v in range(0, 4):
        print(dft(u, v), end='  ')
    print("")

from math import *

K = int(raw_input("K: "))

f = "f(t) = "
for k in range(1, K):
    a_k = 2.0 * ((sin(2 * pi * k * 0.2) / (2 * pi* k)) - (sin( 2 * pi * k * 0) / (2 * pi * k)))
    b_k = 2.0 * ((-1.0 * cos(2 * pi * k * 0.2) / (2 * pi *k ) - (-1.0 * cos(2 * pi * k * 0) / (2 * pi * k))))
    f += str(a_k) + " * cos(" + str(k) + " * 2 * pi * t) + " +  str(b_k) + " * sin(" + str(k) + " * 2 * pi * t)"
    if k < K - 1:
        f += " + "
print f 

from math import *

K = int(raw_input("K: "))

# tastgrad 40%
for k in range(1, K):
    a_k = 2.0 * ((sin(2 * pi * k * 0.2) / (2 * pi* k)) - (sin( 2 * pi * k * 0) / (2 * pi * k)))
    b_k = 2.0 * ((-1.0 * cos(2 * pi * k * 0.2) / (2 * pi *k ) - (-1.0 * cos(2 * pi * k * 0) / (2 * pi * k))))
    c_kR = a_k / 2.0
    c_kI = -1.0 * b_k / 2.0
    c_kabs = sqrt(c_kR * c_kR + c_kI * c_kI)
    print str(k) + " " + str(c_kabs)

# tastgrad 95%
for k in range(1, K):
    a_k = 2.0 * ((sin(2 * pi * k * 0.75) / (2 * pi* k)) - (sin( 2 * pi * k * 0) / (2 * pi * k)))
    b_k = 2.0 * ((-1.0 * cos(2 * pi * k * 0.75) / (2 * pi *k ) - (-1.0 * cos(2 * pi * k * 0) / (2 * pi * k))))
    c_kR = a_k / 2.0
    c_kI = -1.0 * b_k / 2.0
    c_kabs = sqrt(c_kR * c_kR + c_kI * c_kI)
    print str(k) + " " + str(c_kabs)

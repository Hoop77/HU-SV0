#!/usr/bin/env python3

t = [0, 1, 2, 3, 4, 5]
f = [2, 4, 3, 3.5, 5, 4]

if len(t) != len(f):
    print("the t and f list must have the same length")

# how many degrees?
M = 3
N = len(t)

print("\\begin{bmatrix}")
for i in range(M):
    for j in range(M - 1):
        print("\\sum_{n=0}^{" + str(N - 1) + "}", end=' ')
        print("t_n^{" + str(i) + "} t_n^{" + str(j) + "} &")
    # last column
    print("\\sum_{n=0}^{" + str(N - 1) + "}", end=' ')
    print("t_n^{" + str(i) + "} t_n^{" + str(M - 1) + "} \\\\") 
print("\\end{bmatrix}")
# c vector
print("\\begin{bmatrix}")
for i in range(M):
    print("c_{" + str(i) + "} \\\\")
print("\\end{bmatrix}")

print("&=")

# f vector
print("\\begin{bmatrix}")
for i in range(M):
    print("\\sum_{n=0}^{" + str(N - 1) + "} f_n t_n^{" + str(i) + "}\\\\")
print("\\end{bmatrix}")

print("\\\\")
# insert values

for i in range(M):
    for j in range(M - 1):
        coeff = 0
        for tn in t:
            coeff += tn**i * tn**j
        print(str(coeff) + " c_{" + str(j) + "} +")
    # last column
    coeff = 0
    for tn in t:
        coeff += tn**i * tn**(M - 1)
    print(str(coeff) + " c_{" + str(M - 1) + "} &=")
    s = 0
    for j in range(M):
        s += f[j] * t[j]**i
    print(str(s) + "\\\\")


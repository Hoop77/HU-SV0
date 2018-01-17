import numpy as np
from utils import matrix2tex

def bit(z, v):
    return np.mod(np.trunc(v / np.power(2, z)), 2)

def swalsh(N, u, v):
    n = int(np.log2(N))
    s = 0
    for z in range(n):
        s += bit(n-1-z, v) * (bit(z+1, u) + bit(z, u))
    return (1.0 / np.sqrt(N)) * np.power(-1, s)

def dwt_mat(N):
    dwt = np.zeros((N, N))
    for u in range(N):
        for v in range(N):
            dwt[u][v] = swalsh(N, u, v)
    return dwt

if __name__ == "__main__":
    dwt = dwt_mat(8)
    sig0 = np.array([1, 2, 3, 1, -1, -1, -1, 0])
    sig1 = np.dot(dwt, sig0)
    sig2 = np.dot(dwt, sig1)
    sig3 = np.dot(dwt.T, sig1)
    sig4 = np.dot(np.conjugate(dwt), sig1)
    sig5 = np.dot(np.linalg.inv(dwt), sig1)

    print("$")
    print("DWT = ")
    print(matrix2tex(dwt))
    print("$ \\\\ $")
    print("s' =")
    print(matrix2tex(sig1))
    print("^T $ \\\\ $")
    print("s = DWT \\cdot s' =")
    print(matrix2tex(sig2))
    print("^T $ \\\\ $")
    print("s = DWT^T \\cdot s' =")
    print(matrix2tex(sig3))
    print("^T $ \\\\ $")
    print("s = DWT^* \\cdot s'* =")
    print(matrix2tex(sig4))
    print("^T $ \\\\ $")
    print("s = DWT^{-1} \\cdot s' =")
    print(matrix2tex(sig5))
    print("^T $ \\\\")

    print("$")
    #print("rang(DWT) = " + np.linalg.matrix_rank(dwt) + "\\\\")
    print("det(DWT) = " + str(round(np.linalg.det(dwt), 2)) + "\\\\")
    print("$ \\\\")
    print("symmetrisch: ja \\\\")
    print("orthogonal: ja")
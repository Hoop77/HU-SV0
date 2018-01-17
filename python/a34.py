import numpy as np
from utils import matrix2tex

def dst_uv(N, u, v):
    return np.sqrt(2/(N+1)) * np.sin(((u+1)*(v+1)*np.pi)/(N+1))

def dst_mat(N):
    dst = np.zeros((N, N))
    for u in range(N):
        for v in range(N):
            dst[u][v] = dst_uv(N, u, v)
    return dst

if __name__ == "__main__":
    dst = dst_mat(8)
    sig0 = np.array([1, 2, 3, 1, -1, -1, -1, 0])
    sig1 = np.dot(dst, sig0)
    sig2 = np.dot(dst, sig1)

    print("$")
    print("DST = ")
    print(matrix2tex(dst))
    print("$ \\\\ $")
    print("s' =")
    print(matrix2tex(sig1))
    print("^T $ \\\\ $")
    print("s = DST \\cdot s' =")
    print(matrix2tex(sig2))
    print("^T $")
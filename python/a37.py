import numpy as np
from utils import matrix2tex

def dht_mat(Rg):
    val = 1
    seed = 1
    v = 0
    N = Rg
    dht = np.zeros((N, N))
    step = 2*N
    for u in range(N):
        counter = 0
        while counter < (step / 2):
            dht[u][np.mod(v, N)] = val
            counter = counter + 1
            v = v + 1
        
        while counter < step and counter < N:
            dht[u][np.mod(v, N)] = -val
            counter = counter + 1
            v = v + 1

        if np.mod(v, N) == 0:
            if u != 0:
                seed = 2*seed
                val = np.sqrt(seed)
                step = step / 2
    return dht * (1/np.sqrt(N))

if __name__ == "__main__":
    dht = dht_mat(8)
    sig0 = np.array([1, 2, 3, 1, -1, -1, -1, 0])
    sig1 = np.dot(dht, sig0)
    sig2 = np.dot(dht.T, sig1)

    print("$")
    print("DHT = ")
    print(matrix2tex(dht))
    print("$ \\\\ $")
    print("s' =")
    print(matrix2tex(sig1))
    print("^T $ \\\\ $")
    print("s = DHT \\cdot s' =")
    print(matrix2tex(sig2))
    print("^T $")
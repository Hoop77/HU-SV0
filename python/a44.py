import scipy
from scipy import linalg
import numpy as np
from sig import Signal
from datetime import datetime

def dft(u, v, N):
    return (1./np.sqrt(N)) * np.power(np.exp(-1.j * (2.*np.pi/N)), u*v)

def dft_mat_slow(N):
    mat = np.array([])
    for u in range(N):
        row = np.array([])
        for v in range(N):
            row = np.append(row, dft(u, v, N))
        mat = np.append(mat, row)
    return mat.reshape(N, N)

def dft_mat_fast(N):
    mat = np.zeros((N, N), dtype=np.complex_)
    for u in range(N):
        for v in range(N):
            mat[u][v] = dft(u, v, N)
    return mat

if __name__ == "__main__":
    s = Signal()
    s.load_from_file("data/a44.txt")
    s0 = np.array(s.measurements)
    N = len(s0)
    print("SLOW")
    start_slow = datetime.now()
    mat = dft_mat_slow(N)
    s1 = np.dot(mat, s0)
    time_slow = datetime.now() - start_slow
    print("FAST")
    start_fast = datetime.now()
    mat = dft_mat_fast(N)
    s1 = np.dot(mat, s0)
    time_fast = datetime.now() - start_fast
    print("FFT")
    start_fft = datetime.now()
    s1 = (1./np.sqrt(N)) * np.fft.fft(s0)
    time_fft = datetime.now() - start_fft
    print("RESULTS")
    seconds_slow = time_slow.seconds + (time_slow.microseconds / 1000000.)
    seconds_fast = time_fast.seconds + (time_fast.microseconds / 1000000.)
    seconds_fft = time_fft.seconds + (time_fft.microseconds / 1000000.)
    rate_slow = seconds_slow / seconds_fft
    rate_fast = seconds_fast / seconds_fft
    print("DFT ohne Zuteilung: {}s | {:.2f}x".format(seconds_slow, rate_slow))
    print("DFT mit Zuteilung: {}s | {:.2f}x".format(seconds_fast, rate_fast))
    print("FFT: {}s | {:.2f}x".format(seconds_fft, 1.))
import numpy as np
from matplotlib import pyplot as plt

def correlate(x1, x2, t):
    result = 0
    for i in range(len(x1)):
        idx = i + t
        if idx >= 0 and idx < len(x2):
            result += x1[i] * x2[idx]
    return result

if __name__ == "__main__":
    x1 = [0.5] * 7
    x2 = [1., 0.75, 0.5, 0.25]
    tau = [x for x in range(-6, 7)]
    c = [correlate(x1, x2, t) for t in tau]
    plt.title("Korrelation zwischen x1 und x2")
    plt.xlabel("Verschiebungsindex")
    plt.ylabel("Korrelationswert")
    plt.plot(tau, c, "o")
    plt.show()
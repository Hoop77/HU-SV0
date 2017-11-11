from sig import Signal
import matplotlib.pyplot as plt
import numpy as np


def plot(sig):
    ax = plt.subplot(2, 1, 1)
    plt.title("Signal")
    plt.xlabel("Zeit[s]")
    plt.ylabel("Signalamplitude[cm]")
    time = np.linspace(0, 80.0 * sig.num_measurements() / 1000.0, sig.num_measurements())
    ax.plot(time, sig.measurements, label="Signal")
    ax.axhline(y=sig.central_moment(k=3, normed=True), label="normierte Schiefe", color=(0.0, 1.0, 0.0, 1.0))
    legend = ax.legend(loc='upper right', shadow=True)

    ax = plt.subplot(2, 1, 2)
    plt.title("Normiertes Histogramm")
    plt.xlabel("Signalamplitude[cm]")
    plt.ylabel("Relative Häufigkeit")
    ax.bar(sig.x, sig.p, width=0.3)

    plt.show()


if __name__ == "__main__":
    sig = Signal()
    sig.load_from_file("data/a10.txt")
    plot(sig)
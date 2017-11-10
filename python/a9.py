import matplotlib.pyplot as plt
from sig import Signal
import numpy as np


def plot_all(sig):
    ax = plt.subplot(3, 1, 1)
    plt.title("Signal (Messwerteanzahl: 128)")
    plt.xlabel("Zeit[s]")
    plt.ylabel("Messwert[g]")
    ax.set_ylim([99.4, 100.6])
    time = np.linspace(0, 50.0 * sig.num_measurements() / 1000.0, num=sig.num_measurements())
    ax.plot(time, sig.measurements, label="Signal", color=(0, 0, 1.0, 1.0))
    ax.axhline(y=sig.raw_moment(k=1), label="1. gewöhnlliches Moment", color=(0, 1.0, 0, 1.0))
    ax.axhline(y=sig.raw_moment(k=2), label="2. gewöhnlliches Moment", color=(1.0, 0, 0, 1.0))
    ax.axhline(y=sig.square_mean(), label="quadrat. Mittelwert", color=(1.0, 1.0, 0, 1.0))
    ax.axhline(y=sig.geometric_mean(), label="geometrischer Mittelwert", color=(1.0, 0, 1.0, 1.0))
    ax.axhline(y=sig.harmonic_mean(), label="harmonischer Mittelwert", color=(0, 1.0, 1.0, 1.0))
    ax.axhline(y=sig.median(), label="Median", color=(0.2, 0.8, 0.5, 1.0))
    ax.axhline(y=sig.modal_value(), label="Modalwert", color=(0.8, 0.2, 0.5, 1.0))
    ax.axhline(y=sig.min_value(), label="Minimum", color=(1.0, 0.5, 0.5, 1.0))
    ax.axhline(y=sig.max_value(), label="Maximum", color=(0.5, 0.8, 0.8, 1.0))
    legend = ax.legend(loc='upper right', shadow=True)
    # Set the fontsize
    for label in legend.get_texts():
        label.set_fontsize('small')

    ax = plt.subplot(3, 1, 2)
    plt.title("Weitere Werte")
    ax.axhline(y=sig.central_moment(k=1), label="1. zentrales Moment", color=(0, 0, 1.0, 1.0))
    ax.axhline(y=sig.central_moment(k=2), label="2. zentrales Moment", color=(0, 1.0, 0, 1.0))
    ax.axhline(y=sig.central_moment(k=3), label="3. zentrales Moment", color=(1.0, 0, 0, 1.0))
    ax.axhline(y=sig.central_moment(k=4), label="4. zentrales Moment", color=(1.0, 1.0, 0, 1.0))
    ax.axhline(y=sig.standard_deviation(), label="Standardabweichung", color=(1.0, 0, 1.0, 1.0))
    ax.axhline(y=sig.central_moment(k=2, normed=True), label="2. normierte Varianz", color=(0, 1.0, 1.0, 1.0))
    ax.axhline(y=sig.central_moment(k=3, normed=True), label="3. normierte Schiefe", color=(0.2, 0.8, 0.5, 1.0))
    ax.axhline(y=sig.central_moment(k=4, normed=True), label="4. normierte Wölbung", color=(0.8, 0.2, 0.5, 1.0))
    ax.axhline(y=sig.max_entropy(), label="max. Entropy", color=(1.0, 0.5, 0.5, 1.0))
    ax.axhline(y=sig.entropy(), label="Entropy", color=(0.5, 0.8, 0.8, 1.0))
    legend = ax.legend(loc='upper right', shadow=True)
    # Set the fontsize
    for label in legend.get_texts():
        label.set_fontsize('small')

    plt.subplot(3, 1, 3)
    plt.title("Normiertes Histogramm")
    plt.xlabel("Messwert[g]")
    plt.ylabel("Relative Häufigkeit")
    plt.bar(sig.x, sig.p, width=0.005)
    plt.show()


if __name__ == "__main__":
    sig = Signal()
    sig.load_from_file("data/waage128.txt")
    plot_all(sig)
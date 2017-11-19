from sig import Signal
import matplotlib.pyplot as plt

if __name__ == "__main__":
    sig1 = Signal()
    sig2 = Signal()
    sig3 = Signal()

    m1 = [[],[],[]]
    z2 = [[],[],[]]

    for i in range(10):
        sig1.load_from_file("data/a13.txt", column=1, start_measurement_idx=i*100, num_measurements=i*100+100)
        sig2.load_from_file("data/a13.txt", column=2, start_measurement_idx=i*100, num_measurements=i*100+100)
        sig3.load_from_file("data/a13.txt", column=3, start_measurement_idx=i*100, num_measurements=i*100+100)

        m1[0].append(sig1.raw_moment(k=1))
        m1[1].append(sig2.raw_moment(k=1))
        m1[2].append(sig3.raw_moment(k=1))

        z2[0].append(sig1.central_moment(k=2))
        z2[1].append(sig2.central_moment(k=2))
        z2[2].append(sig3.central_moment(k=2))

    sections = list(range(1, 11))
    ax = plt.subplot(2, 1, 1)
    plt.title("m1")
    plt.xlabel("Signalabschnitt")
    plt.ylabel("m1")
    ax.plot(sections, m1[0], color=(1, 0, 0, 1), label="Signal 1")
    ax.plot(sections, m1[1], color=(0, 1, 0, 1), label="Signal 2")
    ax.plot(sections, m1[2], color=(0, 0, 1, 1), label="Signal 3")
    ax.legend()

    ax = plt.subplot(2, 1, 2)
    plt.title("z2")
    plt.xlabel("Signalabschnitt")
    plt.ylabel("z2")
    ax.plot(sections, z2[0], color=(1, 0, 0, 1), label="Signal 1")
    ax.plot(sections, z2[1], color=(0, 1, 0, 1), label="Signal 2")
    ax.plot(sections, z2[2], color=(0, 0, 1, 1), label="Signal 3")
    ax.legend()

    plt.show()
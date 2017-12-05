import numpy as np
import matplotlib.pyplot as plt

def print_row(start, arr, end, f):
    row = "" + start
    for i in len(range(len(arr))):
        row += "& " + str(arr[i])
    row += str(end) + "\\\\"
    print(row, f)

if __name__ == "__main__":
    t = np.array([-3, -2, 0, 1, 2, 3])
    f = t^2
    print("f:")
    print(f)
    print("sum cos(0):")
    print(np.sum(np.cos(0*t)))
    print("sum cos(t):")
    print(np.sum(np.cos(t)))
    print("sum cos(2t):")
    print(np.sum(np.cos(2*t)))
    print("sum cos(t)*cos(2t):")
    print(np.sum(np.cos(t)*np.cos(2*t)))
    print("sum cos(t)^2:")
    print(np.sum(np.square(np.cos(t))))
    print("sum cos(2t)^2:")
    print(np.sum(np.square(np.cos(2*t))))
    print()
    print("right side:")
    print(np.sum(f))
    print(np.sum(f*np.cos(t)))
    print(np.sum(f*np.cos(2*t)))

    print("Solution of equation system:")
    a = [
        [6, -1.27, 1.2],
        [-1.27, 3.6, -0.58],
        [1.2, -0.58, 3.87]
    ]
    b = [1, 5.29, 3.37]
    coeffs = np.linalg.solve(a, b);
    print(coeffs)

    print("E^2:")
    f_app = coeffs[0] * np.cos(0*t) + coeffs[1] * np.cos(t) + coeffs[2] * np.cos(2*t)
    print(np.sum(np.square(f - f_app)))

    x = np.linspace(min(t) - 1, max(t) + 1, 1000)
    y = coeffs[0] * np.cos(0*x) + coeffs[1] * np.cos(x) + coeffs[2] * np.cos(2*x)

    plt.ylim(min(y) -0.5, max(y) + 0.5)
    plt.title("Signalapproximation - Aufgabe 19a")
    plt.xlabel("t")
    plt.ylabel("f(t)")
    plt.plot(x, y, label="f(t)=f_app(t)")
    plt.plot(t, f, "ro", label="Diskrete Messwerte")
    plt.legend();
    plt.show()

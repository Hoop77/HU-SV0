import numpy as np
import matplotlib.pyplot as plt

def approx_matrix(t, f, funs):
    a = []
    b = []
    latex = "\\begin{align*}\n"
    latex += "\\left(\\begin{matrix}c_0\\\\c_1\\\\c_2\end{matrix}\\right) = \n"
    latex += "\\left(\\begin{matrix}\n"
    for fi in funs:
        latex += "\t"
        row = []
        for fj in funs:
            s = np.sum(fi(t)*fj(t))
            latex += "{:.2f}".format(s) + " & "
            row.append(s)
        latex += "\\\\\n"
        a.append(row)
    latex += "\\end{matrix}\\right)^{-1} \\cdot\n"
    latex += "\\left(\\begin{matrix}\n"
    for fun in funs:
        s = np.sum(fun(t)*f)
        latex += "\t{:.2f}\\\\\n".format(s)
        b.append(s)
    latex += "\\end{matrix}\\right) \\approx\n"
    latex += "\\left(\\begin{matrix}\n"
    coeffs = np.linalg.solve(a, b)
    for coeff in coeffs:
        latex += "\t{:.2f}\\\\\n".format(coeff)
    latex += "\\end{matrix}\\right)\n"
    latex += "\\end{align*}\n"
    f_app = 0.0*t
    for i, fun in enumerate(funs):
        f_app += coeffs[i] * fun(t)
    err = np.sum(np.square(f - f_app))
    latex += "$f_{app}(t) = "
    latex += "{:.2f} \\cdot {} ".format(coeffs[0], sfuns[0])
    for i, sfun in enumerate(sfuns[1:]):
        latex += "+ {:.2f} \\cdot {} ".format(coeffs[i+1], sfun)
    latex += "$\n"
    latex += "\\begin{align*}\n"
    latex += "\tE^2(c) = \\sum_{i=0}^5 \\left[ f(t_n) - f_{app}(t_n)\\right]^2 = "
    latex += "{:.02f}\n".format(err)
    latex += "\\end{align*}\n"
    return latex, coeffs, err


if __name__ == "__main__":
    t = np.array([-1, 0, 1, 2])
    f = np.abs(t)
    # funs = [
    #     (lambda t: np.cos(0*t)),
    #     (lambda t: np.cos(t)),
    #     (lambda t: np.cos(2*t))
    # ]
    # sfuns = [
    #     "cos(0)",
    #     "cos(t)",
    #     "cos(2t)"
    # ]
    # funs = [
    #     (lambda t: np.sin(0*t + np.pi/2.0)),
    #     (lambda t: np.sin(t)),
    #     (lambda t: np.sin(2*t))
    # ]
    # sfuns = [
    #     "sin(\\frac{\\pi}{2}",
    #     "sin(t)",
    #     "sin(2t)"
    # ]
    funs = [
        (lambda t: np.exp(t*0)),
        (lambda t: np.exp(t)),
        (lambda t: np.exp(t*(-1)))
    ]
    sfuns = [
        "e^0",
        "e^t",
        "e^{-t}"
    ]
    latex, coeffs, err = approx_matrix(t, f, funs)
    print(latex)

    x = np.linspace(min(t) - 1, max(t) + 1, 1000)
    y = 0*x
    for i, fun in enumerate(funs):
        y += coeffs[i] * fun(x)

    min_y = min(y)
    max_y = max(y)
    min_f = min(f)
    max_f = max(f)
    plt.ylim(min(min_y, min_f) -0.5, max(max_y, max_f) + 0.5)
    plt.title("Signalapproximation - Aufgabe 19c")
    plt.xlabel("t")
    plt.ylabel("f(t)")
    plt.plot(x, y, label="f(t)=f_app(t)")
    plt.plot(t, f, "ro", label="Diskrete Messwerte")
    plt.legend();
    plt.tight_layout()
    #plt.savefig("../Uebungsaufgaben/A19c2.png")
    plt.show()

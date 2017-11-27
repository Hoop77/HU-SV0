import numpy as np
import matplotlib.pyplot as plt

if __name__ == "__main__":
    times = []
    times += [30] * (431 - 1 + 1)
    times += [33] * (509 - 432 + 1)
    times += [43] * (555 - 510 + 1)
    times += [53] * (588 - 556 + 1)
    times += [63] * (619 - 589 + 1)
    times.append(80)

    nums = list(range(1, 619 + 1))
    nums.append(941)

    p1 = np.polyfit(nums, times, deg=1)
    p3 = np.polyfit(nums, times, deg=3)
    p4 = np.polyfit(nums, times, deg=4)
    p5 = np.polyfit(nums, times, deg=5)

    nums1000 = range(1, 1000)

    f1 = np.polyval(p1, nums1000)
    f3 = np.polyval(p3, nums1000)
    f4 = np.polyval(p4, nums1000)
    f5 = np.polyval(p5, nums1000)

    plt.xlabel("Ticketnummer")
    plt.ylabel("Wartezeit [min]")
    plt.plot(nums, times, "o", label="Tabellenwerte")
    plt.plot(nums1000, f1, label="Polynom 1. Grades")
    plt.plot(nums1000, f3, label="Polynom 3. Grades")
    plt.plot(nums1000, f4, label="Polynom 4. Grades")
    plt.plot(nums1000, f5, label="Polynom 5. Grades")

    plt.legend()

    plt.show()

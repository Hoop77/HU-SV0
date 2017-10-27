import matplotlib.pyplot as plt
from scipy.interpolate import spline
import numpy as np

time = np.array([
    0.000,
    0.100,
    0.200,
    0.300,
    0.400,
    0.500,
    0.600,
    0.700,
    0.800,
    0.900,
    1.000,
    1.100,
    1.200,
    1.300,
    1.400,
    1.500,
    1.600,
    1.700,
    1.800,
    1.900,
    2.000,
    2.100,
    2.200,
    2.300,
    2.400,
    2.500,
    2.600,
    2.700,
    2.800,
    2.900,
    3.000
])

sig = np.array([
    0.480,
    0.463,
    0.384,
    0.439,
    0.329,
    0.474,
    0.433,
    0.433,
    0.344,
    0.512,
    0.304,
    0.488,
    0.466,
    0.362,
    0.481,
    0.431,
    0.512,
    0.352,
    0.454,
    0.334,
    0.496,
    0.395,
    0.385,
    0.395,
    0.512,
    0.511,
    0.333,
    0.429,
    0.316,
    0.380,
    0.494
])

time_new = np.linspace(time.min(), time.max(), 300)
sig_smooth = spline(time, sig, time_new)

plt.plot(time, sig)
plt.xlabel("Zeit[s]")
plt.ylabel("Beleuchtungsstärke[lx]")
plt.show()
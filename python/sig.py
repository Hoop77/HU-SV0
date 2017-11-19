import numpy as np


class Signal:
    def __init__(self):
        self.measurements = []
        self.values = set()
        self.relative_frequencies = {}
        self.x = np.array([])   # sorted numpy array of values
        self.p = np.array([])   # corresponding relative frequencies to values x

    def load_from_file(self, filename, column=0, start_measurement_idx=0, num_measurements=-1):
        with open(filename, "r") as f:
            measurements = []
            measurement_idx = -1
            for line in f:
                if not line.strip():
                    continue
                measurement_idx += 1
                if measurement_idx < start_measurement_idx:
                    continue
                if num_measurements > 0 and len(measurements) >= num_measurements:
                    break
                measurements.append(float(line.split()[column]))
            self.set_measurements(measurements)

    def set_measurements(self, measurements):
        self.measurements = measurements
        self.values = set(measurements)
        self.relative_frequencies = {value: measurements.count(value) / len(self.measurements) for value in self.values}
        self.x = np.array(sorted(self.values))
        self.p = [self.relative_frequencies[v] for v in self.x]
            
    def num_measurements(self):
        return len(self.measurements)

    def num_different_measurements(self):
        return len(self.values)

    def raw_moment(self, k=1):
        """ aka "gewöhnliches Moment" """
        return np.sum((self.x**k) * self.p)

    def central_moment(self, k=1, normed=False):
        """ aka "zentrales Moment" """
        m1 = self.raw_moment(1)
        cm_k = np.sum(((self.x - m1)**k) * self.p)
        if normed:
            cm_2 = self.central_moment(k=2, normed=False)
            return cm_k / np.sqrt(cm_2**k)
        return cm_k

    def arithmetic_mean(self):
        """ aka "arithmetischer Mittelwert" """
        return self.raw_moment(1)

    def square_mean(self):
        """ aka "quadratischer Mittelwert" """
        return np.sqrt(self.raw_moment(k=2))

    def geometric_mean(self):
        """ aka "geometrischer Mittelwert" """
        return np.prod(self.x**self.p)

    def harmonic_mean(self):
        """ aka "harmonischer Mittelwert" """
        return np.sum(self.p) / np.sum(self.p / self.x)

    def is_chauchys_mean_inequality_satisfied(self):
        # aka "Cauchys Mittelungleichung"
        return  self.harmonic_mean() <= self.geometric_mean() and \
                self.geometric_mean() <= self.arithmetic_mean()

    def median(self):
        return np.median(self.measurements)

    def modal_value(self):
        k = 0
        for i, p_i in enumerate(self.p):
            if p_i > self.p[k]:
                k = i
        return self.x[k]

    def min_value(self):
        return min(self.x)

    def max_value(self):
        return max(self.x)

    def variance(self):
        return self.central_moment(k=2)

    def standard_deviation(self):
        return np.sqrt(self.variance())

    def entropy(self):
        return np.sum(self.p * np.log2(np.reciprocal(self.p)))

    def max_entropy(self):
        return np.log2(len(self.x))
    
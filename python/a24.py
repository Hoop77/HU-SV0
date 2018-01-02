import math
import matplotlib
matplotlib.use('TkAgg')
from matplotlib import pyplot as plt

stream = open("U24.txt", "r")
vec = []
for line in stream:
    line = line.replace('\n','')
    x = line.split(' ')
    vec.append([float(x[0]), float(x[1])])
stream.close()

X = []
Y = []
TA = 0.004

for t in vec:
    X.append(t[0]*TA)
    Y.append(t[1])

X960 = []
Y960 = []
for t in range(0, 960):
    X960.append(X[t])
    Y960.append(Y[t])

plt.plot(X, Y)
plt.title('Messwerte - Aufgabe 24')
plt.xlabel('Zeit [s]')
plt.ylabel('Messwert [V]')
#plt.show()

plt.plot(X960, Y960)
plt.title('Messwerte - Aufgabe 24 - Eine Periode')
plt.xlabel('Zeit [s]')
plt.ylabel('Messwert [V]')
#plt.show()

ck = []
N = 960
ak = []
bk = []
for k in range(0, 16):
    print(k)
    val = 0
    for n in range(0, 960):
        val = val + Y960[n] * math.cos(2*math.pi*k*n/N)
    ak.append(2*val/N)
    val = 0
    for n in range(0, 960):
        val = val + Y960[n] * math.sin(2*math.pi*k*n/N)
    bk.append(2*val/N)
    ck.append(((ak[k]/2)+0j)+(1j*(bk[k]/2)))
    print(ck[k])
print(bk[0])

test = []
for n in range(0, 960):
    val = ak[0]/2
    for k in range(1,16):
        val = val + ak[k]*math.cos(2*math.pi*(k*n/N))+bk[k]*math.sin(2*math.pi*(k*n/N))
    test.append(val)
plt.plot(X960, test)
plt.show()

for k in range(0,16):
    plt.plot([k*0.26, k*0.26],[abs(ck[k]),0], 'b-')
plt.title('Linienspektrum - Aufgabe 24')
plt.xlabel('Frequenz [Hz]')
plt.ylabel('Koeffizient [ ]')
plt.show()

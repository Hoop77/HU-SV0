import matplotlib
matplotlib.use('TkAgg')
from matplotlib import pyplot as plt
from math import *

xf = []
yf = []
xF = []
yFr = []
yFi = []

min_xf = -2.0
max_xf = 4.0

min_xF = -9.0
max_xF = 9.0

tf = min_xf
tF = min_xF
for i in range(0, 1000):
    xf.append(tf)
    xF.append(tF)

    yf.append(exp(-tf))
    yFr.append((complex(1,0)/ complex(1,tF)).real)
    yFi.append((complex(1,0)/ complex(1,tF)).imag)

    tf = tf + (max_xf - min_xf)/1000
    tF = tF + (max_xF - min_xF)/1000

plt.subplot(121)
plt.plot(xf, yf, label = 'f(t) = exp(-t)')
plt.xlabel = 't'
plt.ylabel = 'f(t)'
plt.legend()

plt.subplot(122)
plt.plot(xF, yFr, 'b', label='f(t) = Re(1/(1+jt))')
plt.plot(xF, yFi, 'r', label='f(t) = Im(1/(1+jt))')
plt.xlabel = 't'
plt.ylabel = 'f(t)'
plt.legend()

#plt.savefig('plottedPic.png')
plt.savefig('plottedPic.png', bbox_inches='tight')

plt.show()


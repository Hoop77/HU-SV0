import matplotlib
matplotlib.use('TkAgg')
from matplotlib import pyplot as plt
from numpy import *

xf = []
yf = []
xF = []
yFr = []
yFi = []
yFb = []
yFw = []

min_xf = 0.0
max_xf = 4.0

min_xF = -4.0
max_xF = 4.0

tf = min_xf
tF = min_xF
for i in range(0, 1000):
    xf.append(tf)
    xF.append(tF)

    yf.append(3 * tf * exp(-2 * tf))
    yFr.append((complex(3,0)/ complex(1,tF)**2).real)
    yFi.append((complex(3,0)/ complex(1,tF)**2).imag)
    yFb.append(abs(complex(3,0)/ complex(1,tF)**2))
    yFw.append(angle(complex(3,0)/ complex(1,tF)**2)/pi)

    tf = tf + (max_xf - min_xf)/1000
    tF = tF + (max_xF - min_xF)/1000

plt.plot(xf, yf, 'b-', label = 'f(t) = 3t*exp(-2t)')
plt.xlabel('t')
plt.ylabel('f(t)')
plt.legend()
#plt.savefig('A29_graphPlot.png', bbox_inches='tight')
plt.show()

plt.plot(xF, yFr, 'b', label='F(w) = Re(3/(1+jw)**2)')
plt.plot(xF, yFi, 'r', label='F(w) = Im(3/(1+jw)**2)')
plt.xlabel('w')
plt.ylabel('F(w)')
plt.legend()
#plt.savefig('A29_plot-Real-Imag.png', bbox_inches='tight')
plt.show()

plt.plot(xF, yFb, 'b', label='F(w) = |3/(1+jw)**2|')
plt.plot(xF, yFw, 'r', label='F(w) = angle(3/(1+jw)**2)')
plt.xlabel('w')
plt.ylabel('F(w)')
plt.legend()
#plt.savefig('A29_plot-abs-angle.png', bbox_inches='tight')
plt.show()

plt.plot(yFr, yFi, 'b-', label='F(w)=3/(1+jw)**2)')
plt.xlabel('Re(F(w))')
plt.ylabel('Im(F(w))')
plt.legend()
plt.savefig('A29_niquest-plot.png', bbox_inches='tight')
plt.show()

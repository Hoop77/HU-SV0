#!/usr/bin/env/gnuplot

set term png
set output "sv0_7.png"
set xrange [0: 15]
set xlabel 'x'

l = 0.5
e = 2.7182818284 # euler
p(x) = l * e ** (-1 * l * x)
F(x) = -1 * e ** (-1 * l * x)

# median
F_half_x = -2 * log(0.5)
F_half_y = -0.5 # fuer C = 0

# E(X)
E_x = 2
E_y = p(E_x)

# Varianz 4

plot p(x) title 'p(x)' with lines linestyle 1, \
    F(x) title 'F(x), C = 0' with lines linestyle 2, \
    '+' using (F_half_x):(F_half_y) title 'Median', \
    '+' using (E_x):(E_y) title 'Erwartungswert 2', \
    [0:4] E_y title 'Varianz 4'

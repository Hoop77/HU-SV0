set term "png"
set output "a25_plot2.png"

plot ("a25_2_points.txt") with impulses title "Tastgrad 40%", \
     ("a25_2_points95.txt") with impulses title "Tastgrad 95%"

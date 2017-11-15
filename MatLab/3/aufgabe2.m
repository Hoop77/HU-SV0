x = [0 1 2 3 4];
y = [1 -1 3 1 2];

x1 = linspace(0, 4, 1000);

p1 = polyfit(x, y, 1);
p2 = polyfit(x, y, 2);
p3 = polyfit(x, y, 3);
p4 = polyfit(x, y, 4);

y1 = polyval(p1, x);
y2 = polyval(p2, x);
y3 = polyval(p3, x);
y4 = polyval(p4, x);

f1 = polyval(p1, x1);
f2 = polyval(p2, x1);
f3 = polyval(p3, x1);
f4 = polyval(p4, x1);

err1 = quaderror(y, y1);
err2 = quaderror(y, y2);
err3 = quaderror(y, y3);
err4 = quaderror(y, y4);

fprintf("quadratischer Fehler für 1. Polynom: %d\n", err1);
fprintf("quadratischer Fehler für 2. Polynom: %d\n", err2);
fprintf("quadratischer Fehler für 3. Polynom: %d\n", err3);
fprintf("quadratischer Fehler für 4. Polynom: %d\n", err4);

hold on;
xlabel('x');
ylabel('y');
title('Signalapproximation');
plot(x, y, 'o', 'Color', [1 0 0]);
plot(x1, f1, 'Color', [0 1 0]);
plot(x1, f2, 'Color', [0 0 1]);
plot(x1, f3, 'Color', [1 1 0]);
plot(x1, f4, 'Color', [0 1 1]);
legend('Diskrete Messwerte', '1. Polynom', '2. Polynom', '3. Polynom', '4. Polynom');
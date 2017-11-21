function aufgabenNummerX()
% Um ein MATLAB-Skript via SSH auszufuehren, dieses einfach in eine Function packen, auf der Konsole matlab starten und dort die Function aufrufen.
figureToSave = figure;
% Erzeugt die figure-Umgebung im Voraus und laesst sie zugaenglich ueber den Namen.

t = [-2 0 1];
f = [2 1 0];

x = linspace(-3, 2, 1000);
Bm3 = [];
Bm2 = [];
Bm1 = [];
L = [];

for i = 1:1000
	Bm3(i) = -1/6 *x(i)^2 - 5/6 * x(i) + 1;
	Bm2(i) = 11/14 - 9/14 * x(i);
	Bm1(i) = 1;
	L(i)   = -(x(i)^2 - 5 * x(i) +6)/6;
end

hold on;
xlabel('t');
ylabel('f(t)');
title('Signalapproximation - Aufgabe 14');
plot(t, f, 'o', 'Color', [1 0 0]);
plot(x, Bm3, 'Color', [0 1 0]);
plot(x, Bm2, 'Color', [0 0 1]);
plot(x, Bm1, 'Color', [1 1 0]);
plot(x, L, 'Color', [0 1 1]);
legend('Diskrete Messwerte', 'f(t) = Bm3(t)', 'f(t) = Bm2(t)', 'f(t) = Bm1(t)', 'f(t) = L(t)');

print(figureToSave, '-dpng', 'plottedPic.png');
% Schreibt die aktuelle figure-Umgebung in das 'plottedPic.png' aus
end

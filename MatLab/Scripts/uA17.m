function uA17()
% Um ein MATLAB-Skript via SSH auszufuehren, dieses einfach in eine Function packen, auf der Konsole matlab starten und dort die Function aufrufen.
figureToSave = figure;
% Erzeugt die figure-Umgebung im Voraus und laesst sie zugaenglich ueber den Namen.

x = linspace(0, 4, 1000);
Q = [];
L = [];

for i = 1:1000
	Q(i) = x(i)^2 - x(i) + 3;
	L(i) = 2 * x(i) + 3;
end

hold on;
xlabel('t');
ylabel('f(t)');
title('Signalapproximation - Aufgabe 17');
plot(x, Q, 'Color', [0 1 0]);
plot(x, L, 'Color', [0 0 1]);

legend('f(t) = t^2-t+3', 'f(t) = 2t + 3');

print(figureToSave, '-dpng', 'plottedPic.png');
% Schreibt die aktuelle figure-Umgebung in das 'plottedPic.png' aus
end

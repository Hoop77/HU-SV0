function uA18()
% Um ein MATLAB-Skript via SSH auszufuehren, dieses einfach in eine Function packen, auf der Konsole matlab starten und dort die Function aufrufen.
figureToSave = figure;
% Erzeugt die figure-Umgebung im Voraus und laesst sie zugaenglich ueber den Namen.

t = [-1 0 1 2];
f = [1 0 0 2];

x = linspace(-2, 3, 1000);
a = [];

for x = 1:1000
	a(x)   = -0.59*exp(-x) + 0.22 * exp(x) + 0.5;
end

hold on;
xlabel('t');
ylabel('f(t)');
title('Signalapproximation - Aufgabe 14');
plot(t, f, 'o', 'Color', [1 0 0]);
plot(x, a, 'Color', [1 0 0]);
legend('Diskrete Messwerte', 'f(t) = f_{app}(t)');

print(figureToSave, '-dpng', 'plottedPic.png');
% Schreibt die aktuelle figure-Umgebung in das 'plottedPic.png' aus
end

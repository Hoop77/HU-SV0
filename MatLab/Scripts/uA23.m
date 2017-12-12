function uA23()
% Um ein MATLAB-Skript via SSH auszufuehren, dieses einfach in eine Function packen, auf der Konsole matlab starten und dort die Function aufrufen.
figureToSave = figure;
% Erzeugt die figure-Umgebung im Voraus und laesst sie zugaenglich ueber den Namen.

t = [0, 1, 2];
f = [1, 0, 1];

x = linspace(-1, 3, 1000);
app = [];
for n = 1:1000
	app(n)   = 0.667 + 0.333*cos((2*pi* x(n))/3) - 0.577*sin((2*pi * x(n))/3);
end

hold on;
xlabel('t');
ylabel('f(t)');
title('Signalapproximation - Aufgabe 23');
plot(t, f, 'o', 'Color', [1 0 0]);
plot(t, f, '--', 'Color', [1 0 0]);
plot(x, app, 'Color', [0 1 0]);
legend('Diskrete Messwerte', 'lin. interpoliert', 'f(t) = f_{app}(t)');

print(figureToSave, '-dpng', 'plottedPic.png');
% Schreibt die aktuelle figure-Umgebung in das 'plottedPic.png' aus
end

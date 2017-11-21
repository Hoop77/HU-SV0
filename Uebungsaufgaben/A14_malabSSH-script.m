function aufgabenNummerX()
% Um ein MATLAB-Skript via SSH auszufuehren, dieses einfach in eine Function packen, auf der Konsole matlab starten und dort die Function aufrufen.
figureToSave = figure;
% Erzeugt die figure-Umgebung im Voraus und laesst sie zugaenglich ueber den Namen.

t = [-2 0 1];
f = [2 1 0];

%
% quadartischen Fehler als 'quaderror()' ../matlab/3/quaderror()
%

hold on;
xlabel('t');
ylabel('f(t)');
title('Signalapproximation')
plot(t, f, 'o', Color', [1 0 0]);
% plot a.
% plot b.
% plot c.
% plot d.
legend('Diskrete Messwerte', 'f(t) [M = 3]', 'f(t) [M = 2]', 'f(t) [M = 1]', 'f(t) = L(t)';

print(figureToSave, '-dpng', 'plottedPic.png');
% Schreibt die aktuelle figure-Umgebung in das 'plottedPic.png' aus
end

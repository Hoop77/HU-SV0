function [m1, m2, z2, z3, z4] = momente(daten)
if ~isreal(daten) || ischar(daten) || numel(daten) == 0
    error("Nur reele Zahlen bitte!\n");
end
daten = daten(:);
N = numel(daten);
m1 = sum(daten) / N;
m2 = sum(daten.^2) / N;
z2 = sum((daten - m1).^2) / N;
z3 = sum((daten - m1).^3) / N;
z4 = sum((daten - m1).^4) / N;
end
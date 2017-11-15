shake = fopen("shake.txt");
t = fread(shake, inf, 'uint8');
fclose(shake);

[c, p] = haeufigkeit(t);
H_max = log(length(c));
H = 0;
for i = 1:length(p)
    H = H + p(i) * log(1 / p(i));
end
R = H_max - H;

out1 = sprintf("Die Entropie ist: %f\n", H);
disp(out1);
out2 = sprintf("Die maximale Entropie ist: %f\n", H_max);
disp(out2);
out3 = sprintf("Die Redundanz beträgt: %f\n", R);
disp(out3);

function[wert, anzahl] = haeufigkeit(daten)
    daten = daten(:);
    wert = unique(daten);
    anzahl = hist(daten, wert);
    wert = transpose(wert);
end
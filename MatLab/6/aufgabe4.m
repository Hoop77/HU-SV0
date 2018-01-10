x = 0:(4000-1);
y = rechteckimpuls(10, 20, 4000);

freq = dct(y);
time = idct(freq);

subplot(4, 1, 1);
plot(x, y);
xlabel("Abtastnummer");
ylabel("Funktionswert");
title("Originalfunktion");
subplot(4, 1, 2);
stem(x, abs(freq), 'marker', 'none');
xlabel("Frequenz");
ylabel("Betrag des Frequenzspektrums");
title("Betragsdarstellung");
subplot(4, 1, 3);
stem(x, angle(freq), 'marker', 'none');
xlabel("Frequenz");
ylabel("Winkel des Frequenzspektrums");
title("Winkeldarstellung");
subplot(4, 1, 4);
plot(x, time);
xlabel("Abtastnummer");
ylabel("Funktionswert");
title("rekonstruierte Funktion");


y1 = wuerfelbecher(5, 666, 7);
y2 = wuerfelbecher(5, 66666, 7);
y3 = wuerfelbecher(5, 6666666, 7);

f = figure;
p1 = subplot(1, 3, 1);
histogram(y1);
xlabel("Ergebnis");
ylabel("Häufigkeit");
p2 = subplot(1, 3, 2);
histogram(y2);
xlabel("Ergebnis");
ylabel("Häufigkeit");
p3 = subplot(1, 3, 3);
histogram(y3);
xlabel("Ergebnis");
ylabel("Häufigkeit");

function [augensumme] = wuerfelbecher(wuerfel, wuerfe, max_augenzahl)
    R = 1 + (max_augenzahl - 1) * rand(wuerfel, wuerfe);    
    R = ceil(R);
    augensumme = sum(R, 1);
end

function [X,Y] = aufgabe8()
X = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1,0,1,2,3,4,5,6,7,8,9,10];
Y = [1,2,3,4,50,6,5,4,3,2,228,2,3,4,5,6,50,4,3,2,1];

nY = Y/388;
h = figure;
bar(X, nY)
hold on;

xlabel('Messwert');
ylabel('Relative Häufigkeit');

gX = -10:0.1:10;
mu = 0;
sig = 3.75;

pdfN = normpdf(gX,mu,sig);
plot(gX, pdfN, 'b')
legend('normiertes statistische Auftreten', 'Wert der Normalverteilung');
print(h, '-dpng','testbild.png');
end

clearvars;

x = [0,1,2,3,4,5];

y = [8,7,8,4,7,11];

f = {(@(x) cos(0.*x)), (@(x) cos(x)), (@(x) cos(2.*x)), (@(x) cos(3.*x))};

c = sigapp(x,y,f);

for zeile=1:numel(f)
    for stelle=-1:0.01:6
        spalte = int16((1+stelle)*100+1);
        fap_temp_plot(zeile,spalte) = c(zeile).*f{zeile}(stelle);
    end
    for spalte=1:numel(x)
        fap_temp(zeile,spalte) = c(zeile).*f{zeile}(x(spalte));
    end
end

fap_plot = sum(fap_temp_plot);
fap = sum(fap_temp);

hold;
axis([-0.2 5.2 3.6 11.2]);
plot(x,y,'ko');
plot(-1:0.01:6,fap_plot);
xlabel('x');
ylabel('f(x)');
legend('diskrete Messwerte', 'approximierte Funktion');
fprintf('Quadratischer Fehler: %f\n',quaderror(y,fap));
figH = figure('name', '');
set(figH, 'Position', get(0, 'ScreenSize'));

N = 4000

x = 0:(N-1);
M = 20
for K = 0:10:(N-M)
    y = rechteckimpuls(K, M, N);
    freq = fft(y);
    
    windowTitle = join(['K: ', num2str(K), ', M: ', num2str(M)]);
    set(figH, 'name', windowTitle);
    
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
    title("Winkeldarstellung")
    
    pause(0.01);
end
K = 0
for M = 0:10:(N-K)
    y = rechteckimpuls(K, M, N);
    freq = fft(y);
    
    windowTitle = join(['K: ', num2str(K), ', M: ', num2str(M)]);
    set(figH, 'name', windowTitle);

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
    title("Winkeldarstellung")
    
    pause(0.01);
end
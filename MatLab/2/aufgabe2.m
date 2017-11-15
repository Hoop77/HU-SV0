% y: sample data, 
% Fs: sample rate
[y, Fs] = audioread('gdur.wav');
N = numel(y);
time = (0:1:N-1) / Fs;
[mean,~,z2,~,~] = momente(y);
std = sqrt(z2);
hold on;
xlabel('Zeit[s]');
ylabel('Amplitude[unbekannt]');
xlim([0, time(end)]);
title('g-dur');
plot(time, y, 'Color', [0,0.7,0.9]);
plot([time(1), time(end)], [mean, mean], 'Color',[0,1.0,0]);
plot([time(1), time(end)], [std, std], 'Color',[1.0,0,0]);
plot([time(1), time(end)], [max(y), max(y)], 'Color',[1.0,1.0,0]);
plot([time(1), time(end)], [min(y), min(y)], 'Color',[0,1.0,1.0]);
legend('Audiospur', 'Mittelwert', 'Standardabweichung', 'Maximum', 'Minimum');
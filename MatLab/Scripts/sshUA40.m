function sshUA40()
s = dlmread("a40_sig.txt");
N = numel(s);
DWT = swalsys(N);
x = 1:N;

subplot(6, 1, 1);
plot(x, s);
title("Originales Signal");
xlabel("Signalwert Index");
ylabel("Signalwert");
S = DWT * s;
xlim([0,2048]);

subplot(6, 1, 2);
plot(x, S);
title("Transformiertes Signal im Walshspektrum");
xlabel("Walshkoeffizient");
ylabel("Wert des Walshkoeffizienten");
ylim([-5000, 5000]);
xlim([0,2048]);

K = 8;
S8 = [S(1:K); zeros(N-K, 1)];
s8 = DWT * S8;
subplot(6, 1, 3);
plot(x, s8);
title("Zurückgewonnes Signal (K=8)");
xlabel("Signalwert Index");
ylabel("Signalwert");
xlim([0,2048]);

K = 32;
S32 = [S(1:K); zeros(N-K, 1)];
s32 = DWT * S32;
subplot(6, 1, 4);
plot(x, s32);
title("Zurückgewonnes Signal (K=32)");
xlabel("Signalwert Index");
ylabel("Signalwert");
xlim([0,2048]);

K = 64;
S64 = [S(1:K); zeros(N-K, 1)];
s64 = DWT * S64;
subplot(6, 1, 5);
plot(x, s64);
title("Zurückgewonnes Signal (K=64)");
xlabel("Signalwert Index");
ylabel("Signalwert");
xlim([0,2048]);

K = 128;
S128 = [S(1:K); zeros(N-K, 1)];
s128 = DWT * S128;
subplot(6, 1, 6);
plot(x, s128);
title("Zurückgewonnes Signal (K=128)");
xlabel("Signalwert Index");
ylabel("Signalwert");
xlim([0,2048]);
end

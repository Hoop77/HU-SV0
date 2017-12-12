s = swalsys(16);
disp(s);

figure;
n = 1;

while n <= length(s)
    subplot(length(s), 1, n);
    stairs(s(n,:));
    n = n + 1;
end

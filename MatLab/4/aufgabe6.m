s = swalsys(16);

figure;
n = 1;
hold on;
X = 0:16;
while n <= length(s)
    stairs(X, [s(n,:), s(n, numel(s(n,:)))] -3*n, 'b-');
    n = n + 1;
end
set(gca,'XTick',[])
set(gca,'YTick',[])
matrix = nan(30, 20);
for n = 0:1:29
    for k = 0:1:19
        matrix (n+1, k+1) = binomial(n, k);
    end
end
surf(matrix)
xlabel('k')
ylabel('n')
zlabel('binomal(n,k)')
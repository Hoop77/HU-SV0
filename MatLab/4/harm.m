function y = harm(k,t)
y = zeros(numel(k), numel(t));
for r = 1:numel(k)
    for c = 1:numel(t)
        y(r, c) = exp(1i*k(r)*2*pi*t(c));
    end
end
end
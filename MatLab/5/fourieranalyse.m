function [a,b] = fourieranalyse(fn, K)
if ~isvector(fn) || abs(round(K)) ~= K
   error("Invalid arguments!"); 
end
N = numel(fn);
if 2*K + 1 > N
   error("2K+1 > N"); 
end
fn = transpose(fn(:));  % zeilenvektor
n = transpose(0:(N-1)); % spaltenvektor
kv = 0:K;
a = zeros(1, K+1);
b = zeros(1, K+1);
for k = kv
    a(k+1) = (2/N) * (fn * cos(k*2*pi*n/N));
    if k == 0
        b(k+1) = 0;
    else
        b(k+1) = (2/N) * (fn * sin(k*2*pi*n/N));
    end
end 
end
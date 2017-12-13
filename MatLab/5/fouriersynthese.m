function y = fouriersynthese(N, ak, bk)
if abs(round(N)) ~= N || ~isequal(size(ak), size(bk))
   error("Invalid arguments!"); 
end
K = numel(ak)-1;
if 2*K + 1 > N
   error("2K+1 > N"); 
end

k = transpose(1:K);
a0 = ak(1);
nv = 0:(N-1);
y = zeros(N, 1);

for n = nv    
    y(n+1) = (a0/2) + ((ak(2:end) * cos(k*2*pi*n/N)) + (bk(2:end) * sin(k*2*pi*n/N)));
end

end
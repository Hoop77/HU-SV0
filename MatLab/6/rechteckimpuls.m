function y = rechteckimpuls(K,M,N)

if ~isreal(K) || K ~= abs(round(K)) || ~isreal(M) || M ~= abs(round(M)) || ~isreal(K) || N ~= abs(round(N))
    error("Invalid args, numbers must be natural!");
end

K = min(K, N);
M = min(M, N-K);

y = [zeros(1, K) ones(1, M) zeros(1, N-M-K)];
 
end
function H = Haar(Rg)
    v1 = [1 1];
    v2 = [1 - 1];
    H = [v1; v2];
    i = 2;
    while i < Rg
        H = [kron(H, v1); kron(2^(log2(i)/2) * eye(size(H)), v2)];
        i = i * 2;
    end;
    H = H / sqrt(i);
return

s = [1; 2; 3; 1; -1; -1; -1; 0]
DHT = Haar(8)
s1 = DHT * s
s2 = transpose(DHT) * s
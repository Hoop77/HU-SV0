tn = 0:(1/512):(1-1/512);
O = zeros(10, 10);
isortho = true;
for k = 0:9
    for m = 0:9
        y = harm(k, tn) * transpose(harm(-m, tn));
        if k ~= m
            if ~iszero(y)
               isortho = false; 
            end
        end
        O(k + 1, m + 1) = y;
    end
end

disp(O);
if isortho == true
    disp("Funktionen sind orthogonal.");
else
    disp("Funktionen sind nicht orthogonal.");
end

function res = iszero(x)
if abs(x) <= 0.000000001
    res = true;
else
    res = false;
end
end
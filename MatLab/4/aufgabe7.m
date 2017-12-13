O = zeros(16, 16);
isortho = true;
for k = 0:15
    for m = 0:15
        y = swal(k, 4) * transpose(swal(m,4));
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
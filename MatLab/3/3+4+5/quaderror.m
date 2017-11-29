function e2 = quaderror(f,fap)

if (isvector(f) && isvector(fap))
    if (size(f) == size(fap))
        summe = 0;
        for i=1:1:numel(fap)
            x=(f(i)-fap(i))^2;
            summe = summe + x;
        end
        e2 = summe;
    else
        error('Falsch dimensioniert.')
    end
else
    error('Eingabe keine Vektoren')
end
 



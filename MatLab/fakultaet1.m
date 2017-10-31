function[y] = fakultaet1(x)
    inputCheck(x);
    if (x==0)
        y = 1;
    else
        i = 2;
        y = 1;
        while (i <= x)
            y = y * i;
            i = i + 1;
        end
    end 
end

function [] = inputCheck(x)
    if (~isscalar(x))
        error('Ihre Eingabe ist kein Sklar')
    end
    if (x ~= floor(x))
        error('Ihre Eingabe muss eine natuerliche Zahl sein')
    end
    if (x < 0)
        error('Ihre Eingabe muss positiv sein!')
    end
end
function[y] = fakultaet2(x)
    inputCheck(x);
    if (x == 0)
        y = 1;
    else
        y = fakultaet2(x-1) * x;
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
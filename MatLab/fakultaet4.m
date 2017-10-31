function[y] = fakultaet4(x)
    inputCheck(x);
    y = factorial(x);
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
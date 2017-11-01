function [y] = binomial(n,k)
    if (nargin < 2)
        error('Ihre Eingabe hat zu wenig Parameter!')
    elseif (nargin > 2)
        error('Ihre Eingabe hat zu viele Parmeter!')
    else
        inputCheck(n,k)
    end
    if (k == 0)
        y = 1;
    else
        b1 = n;
        b2 = factorial(k);
        k = k - 1;
        while (k > 0)
            b1 = b1 * (n - k);
            k = k - 1;
        end
        y = b1 / b2;
    end
        
end

function [] = inputCheck(n, k)
    if (~isscalar(n))
        error('Ihre Eingabe "n"(1. Parameter) ist kein Sklar')
    end
    if (~isreal(n))
        error('Ihre Eingabe "n"(1. Parameter) muss eine reelle Zahl sein')
    end
    if (~isscalar(k))
        error('Ihre Eingabe "k"(2. Parameter) ist kein Sklar')
    end
    if (k ~= floor(k))
        error('Ihre Eingabe "k"(2. Parameter) muss eine natuerliche Zahl sein')
    end
    if (k < 0)
        error('Ihre Eingabe "k"(2. Parameter) muss positiv sein!')
    end
end
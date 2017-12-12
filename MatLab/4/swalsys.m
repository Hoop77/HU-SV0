function y = swalsys(k)
    if floor(log2(k)) ~= log2(k)
        error('my:sawlsys', 'k is not a power of 2');
    end
    n = 0;
    y = [];
    while n < k
        s = swal(n);
        while length(s) < k
            s = [s s(length(s))];
        end
        y = [y;s];
        n = n + 1;
    end
end
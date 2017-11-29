function c = sigapp(x,y,f)
 
if nargin ~= 3 
    error('Keine Approximationsfunktion angegeben')
end

num = numel(f);

for zeile=1:num
    yvec(zeile,1) = sum(f{zeile}(x).*y);
end

for zeile=1:num
    for spalte=1:num
        matrix(zeile,spalte) = sum(f{zeile}(x).*f{spalte}(x));
    end
end

c = matrix \ yvec;
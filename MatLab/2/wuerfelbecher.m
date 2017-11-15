<<<<<<< HEAD
function e2 = quaderror(f, fap)
if ~isvector(f) || ~isvector(fap)
    error("f und fap müssen Vektoren sein!");
end
if any(size(f) ~= size(fap))
    error("f und fap müssen die gleiche Dimension haben!");
end
if numel(f) == 0
    error("f und fap haben Dimension 0!");
end
e2 = sum((f-fap).^2);
=======
function [augensumme] = wuerfelbecher(wuerfel, wuerfe, max_augenzahl)
R = 1 + (max_augenzahl - 1) * rand(wuerfel, wuerfe);
R = ceil(R);
augensumme = sum(R, 1);
>>>>>>> 5cc028f12ecdf6e2a22c9f87e007a47db6e6c77c
end
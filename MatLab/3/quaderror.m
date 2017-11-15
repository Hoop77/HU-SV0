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
end
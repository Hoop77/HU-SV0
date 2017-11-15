function[wert, anzahl] = haeufigkeit(daten)
    daten = daten(:);
    wert = unique(daten);
    anzahl = hist(daten, wert);
    wert = transpose(wert);
end
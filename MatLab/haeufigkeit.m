function[wert, anzahl] = haeufigkeit(daten)
    wert = unique(daten);
    hist(daten, wert);
    [anzahl, wert] = histc(daten, wert);
end
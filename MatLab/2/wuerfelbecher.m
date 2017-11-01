function [augensumme] = wuerfelbecher(wuerfel, wuerfe, max_augenzahl)
R = 1 + (max_augenzahl - 1) * rand(wuerfel, wuerfe);
R = ceil(R);
augensumme = sum(R, 1);
end
function y = swal(k)
    % 1 stelle k als binaerzahl dar
    b = dec2bin(k);
    v = [1];
    for i = b
        if i == '0'
            % symmetrische erweiterung
            vtmp = fliplr(v);
            v = [v vtmp];
        elseif i == '1'
            % zentralsymmetrische erweiterung
            vtmp = -1 * fliplr(v);
            v = [v vtmp];
        end
    end
    y = v;
end
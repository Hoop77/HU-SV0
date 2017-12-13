function y = swal(k, varargin)
    % 1 stelle k als binaerzahl dar mit n Stellen
    b = [];
    if nargin > 1
        n = varargin{1};
        b = dec2bin(k, n);
    else
        b = dec2bin(k);
    end
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
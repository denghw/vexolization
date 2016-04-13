function offobj = offLoader(filename)

offobj = struct();
fid = fopen(filename, 'rb');
OFF_sign = fscanf(fid, '%c', 3);
assert(strcmp(OFF_sign, 'OFF') == 1);

words = fscanf(fid, '%d', 3);
nV = words(1); nF = words(2); nE = words(3);
offobj.vmat = reshape(fscanf(fid, '%f', nV*3), 3, nV);
offobj.vmat = offobj.vmat'
fstr = textscan(fid, '%s', nF, 'delimiter', '\n', 'MultipleDelimsAsOne', 1);
tfmat = zeros(nF*2,4);
nf3 = 0;
for i=1:nF
    words = sscanf(fstr{1}{i}, '%d');
    if words(1) == 3
        nf3 = nf3 + 1;
        tfmat(nf3, :) = words([4,2,3,4]);
    elseif words(1) == 4
        nf3 = nf3 + 1;
        tfmat(nf3, :) = words([4,2,3,4]);
        nf3 = nf3 + 1;
        tfmat(nf3, :) = words([5,2,4,5]);
    else
        error('size of face is not 3 or 4');
    end
end
offobj.fmat = tfmat(1:nf3, 2:end) + 1;
fclose(fid);
end
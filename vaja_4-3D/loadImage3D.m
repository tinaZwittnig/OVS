function oImage = loadImage3D(iPath, iSize, iType)
% funkcija zapiše raw sliko v obliki matirke
% vhodni podatki :
%   iPath - vhodna datoteka
%   iSize - velikost slike
%   iType - tip podatkov, v katerem je zapisana datoteka
% izhodni podatek:
%   oImage - slika zapisana v matriki 

% nalozi 3D sliko
fid = fopen(iPath, 'r');
all = fread(fid, prod(iSize), iType);
oImage = reshape(all, iSize(2), iSize(1),iSize(3));
fclose(fid);
end


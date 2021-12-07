function oImage = loadImage(iPath, iSize, iType)
    % funkcija zapiše raw sliko v obliki matirke
    % vhodni podatki :
    %   iPath - vhodna datoteka
    %   iSize - velikost slike
    %   iType - tip podatkov, v katerem je zapisana datoteka
    % izhodni podatek:
    %   oImage - slika zapisana v matriki 
    
    % preberi podatke
    fid = fopen(iPath, 'r');
    fdata = fread(fid, Inf, iType);
    fclose(fid);
    
    
    % nalozi 2D sliko
    fid = fopen(iPath, 'r');
    if length(fdata) == prod(iSize)
        oImage = fread(fid,[iSize(2) iSize(1)], iType);
    else
        %nalozi 2D barvno sliko (z 3D matriko)
        for i = 1:3
            oImage(:, :, i) = fread(fid, [iSize(2) iSize(1)], iType);
        end
    end
    fclose(fid);
end


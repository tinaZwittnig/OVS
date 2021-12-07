% nalozi sliko
function oImage = loadImage(iPath, iSize, iType)
    
    fid = fopen(iPath, 'r');
    oImage = fread(fid, [iSize(2) iSize(1)], iType);
    fclose(fid);

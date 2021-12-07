% nalozi sliko
function oImage = loadImage(iPath, iDim, iType)

    iStream = fopen(iPath, 'r');
    oImage = fread(iStream, [iDim(2) iDim(1)], iType);
    fclose(iStream);

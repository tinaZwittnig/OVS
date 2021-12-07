% iskanje robov
function oImage = findEdges(iImage, iThreshold, iStdDev)

    try
        % poisci robove na sliki s Cannyjevim detektorjem
        oImage = findEdgesCanny(iImage, iThreshold, iStdDev);
    catch
        % poisci robove na sliki z alternativnim detektorjem
        disp('Uporabljen je bil alternativni nacin iskanja robov!');
        oImage = findEdgesAlter(iImage, iThreshold);        
    end
        
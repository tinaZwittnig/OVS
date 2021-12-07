% iskanje robov s Cannyjevim detektorjem
function oImage = findEdgesCanny(iImage, iThreshold, iStdDev)

    % poisci robove na sliki
    oImage = edge(iImage, 'canny', iThreshold, iStdDev);
function oFilter = gaussianFilter(iM, iN, iStd)
%funkcija vrne gausov filter velikosti iMx iN, zračunan s standardnim
%odklonom iStd

oFilter = zeros(iM,iN);
polx = round(iN/2);
poly= round(iM/2);
for x= 1: iN
    for y = 1: iM
        i = abs(polx-x);
        j = abs(poly-y);
        vrednost = exp(-(i^2+j^2)/(2*iStd^2));
        oFilter(y,x) = vrednost;
    end

end
oFilter = oFilter./sum(sum(oFilter));

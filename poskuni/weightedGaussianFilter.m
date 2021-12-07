function [oK, oStd] = weightedGaussianFilter(iS, iWR, iStdR, iW)
% iS - [M N] - velikost filtra
% iWR = [w1 w2] - vektor mejnih vrednosti
% iStdR - [sigma1 simga2] - vektor mejnih standardnih odklonov
% iW - w - podana utež.
%izhodni:
%   oK - matrika jedra
%   oStd - sigma - standardni odklon

oK = zeros(iS);
center = [mean(1:iS(1)), mean(1:iS(2))]; %središče filtrra [x y]
kk = (iStdR(2) - iStdR(1))/(iWR(2) - iWR(1));
nn = iStdR(1) - kk*iWR(1);
oStd = kk*iW+nn;
for y = 1:iS(2)
    for x = 1:iS(1)
        d = norm([x,y]-center);
        oK(x,y) = 1/(2*pi*oStd^2)* exp(-(d^2)/(2*oStd^2));
    end
end

oK = oK/sum(oK(:));

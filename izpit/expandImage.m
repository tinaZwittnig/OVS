function oImage = expandImage(iImage)
%poveča sliko
[Y, X ] = size(iImage)
oImage = ones(2*Y, 2*X).*255

oImage(1:Y, X-round(X/2)+1: X+round(X/2)-1) = iImage;
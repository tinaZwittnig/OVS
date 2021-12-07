function oImage = thresholdImage(iImage, iT)
%trehsholdImage naredi upragovanje slike.
%vhodni parametri:
%   iImage  - slika podana v matrični obliki
%   iT - parameter upragovanja
%izhodni paramatri:
%   oImage - slika pridobljena z upragovanjem v matrični obliki.

    Lg = 2^8 -1;
    oImage = iImage;
    oImage(iImage<=iT) = 0;
    oImage(iImage>iT) = Lg;
end
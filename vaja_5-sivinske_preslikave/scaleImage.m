function oImage = scaleImage(iImage, iA, iB)
%scaleImage spreme sliko in jo linearno preslika z funkcijo iAx +iB 
%vhodni:
%   iImage
%   iB
%izhodni:

oImage = iImage .*iA + iB;
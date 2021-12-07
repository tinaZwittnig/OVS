function [oCS, oH, oV] = getPlanarCrossSection(iImage, iDim, iNormVec, iLoc)
%getPlanarCrossSection vrne prečni prerez 3D slike in vektorja položajev 
% slikovnih elementov
%vhodni elementi: 
%   iImage - slika predstavljena z matriko
%   iDim - dimenzije vokslov slike
%   iNormVec - normala na željeno ravnino
%   iLoc - položaj željene ravnine
%izhodni elementi:
%   oCS - prečni prerez v obliki matrike
%   oH - vektor položaja slikovnih elementov v x smeri
%   oV - vektor položaja slikovnih elementov v y smeri

oCS = [];
oH = [];
oV = [];

%stranski prerez (nx = [1 0 0])
if all(iNormVec == [1 0 0])
    oCS = squeeze(iImage(:, iLoc,:))';
    oV = (1:size(oCS,1))*iDim(3);
    oH = (1:size(oCS,2))*iDim(2);
elseif all(iNormVec == [0 1 0])
     oCS = squeeze(iImage(iLoc, :,:))';
     oV = (1:size(oCS,1))*iDim(3);
     oH = (1:size(oCS,2))*iDim(1);
elseif all(iNormVec == [0 0 1])
     oCS = squeeze(iImage(:,:,  iLoc));
     oV = (1:size(oCS,1))*iDim(2);
     oH = (1:size(oCS,2))*iDim(1);
end
  
end

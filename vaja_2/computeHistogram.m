function [oHist, oProb, oCDF, oLevels] = computeHistogram(iImage)
%computeHistogram izračuna histogram, normaliziran histogram, komulativno
% porazdelitev verjetnosti sivinskih vrednosti slike in vektor dinamičnega
% območja sivinskih vrednosti
% vhodni podatki:
%   iImage - slika v matrični obliki
% izhodni podatki: 
%   oHist - histogram slike
%   oProb - normaliziran histogram
%   oCDF - komulativna porazdelitev
%   oLevels - vektor dinamičnega območja sivinskih vrednosti
nBits = floor(log2(max(iImage(:)))) +1;
oLevels = linspace(0,1, 2^nBits);
oHist = zeros(1, length(oLevels));

%histogram
for i = 1:size(iImage,1)
    for j = 1:size(iImage,2)
        indeks = iImage(i,j);
        oHist(indeks+1) = oHist(indeks +1) +1;
    end
end

% normaliziran histogram
oProb = oHist ./ length(iImage(:));

% komulativna porazdelitev
oCDF = zeros(1,length(oProb));

for i = 1:length(oCDF)
    oCDF(i) = sum(oProb(1:i));
end

end


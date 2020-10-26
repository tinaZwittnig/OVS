function oImage = equalizeHistogram(iImage)
%equalizeHistogram izračuna sliko z izravnanim histogramom
% vhodni podatki:
%   iImage - slika v matrični obliki
% izhodni podatki: 
%   oImage - slika z normaliziranim histogramom v matrični obliki
[~,~, cdf, levels] = computeHistogram(iImage);
oImage = zeros(size(iImage));
nBits = floor(log2(max(iImage(:)))) +1;
maxS = 2^nBits -1;
T = floor(cdf * maxS);

for x = 1:size(iImage,1)
    for y = 1:size(iImage,2)
        oImage(x,y) = T(iImage(x,y) +1);
    end
end
        

end
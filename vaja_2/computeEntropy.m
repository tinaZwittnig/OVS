function oEntropy = computeEntropy(iImage)
%computeEntropy vrne koliko je entropija dane slike
% vhodni podatki:
%   iImage - slika podana v matrični obliki
% izhodni podatki:
%   oEntropy - entropija dane slike v skalarju
oEntropy = 0;
[hist, norHist, cdf, levels] = computeHistogram(iImage);
for i = 1:length(norHist)
    vrednost = norHist(i);
    if (vrednost ~=0)
        pristej = vrednost * log2(vrednost);
        oEntropy = oEntropy - vrednost * log2(vrednost);
    end

end


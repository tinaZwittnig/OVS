addpath('../vaja_1/')
slika = loadImage('valley-1024x683-08bit.raw', [1024 683], 'uint8');
displayImage(slika, 'Slika')
[hist, norHist, cdf, levels] = computeHistogram(slika);
displayHistogram(hist,levels,'histogram')
displayHistogram(norHist,levels, 'normaliziran histogram')
displayHistogram(cdf, levels, 'komulativna porazdelitev sivinskih vrednosti')

nova_slika = equalizeHistogram(slika);
displayImage(nova_slika, 'Nova_Slika')
[hist_nov, norHist_nov, cdf_nov, levels_nov] = computeHistogram(nova_slika);
displayHistogram(hist_nov, levels_nov, 'histogram nove slike')
displayHistogram(norHist_nov,levels_nov, 'normaliziran histogram nove slike')
displayHistogram(cdf_nov, levels_nov, 'komulativna porazdelitev sivinskih vrednosti nove slike')
computeEntropy(slika)
computeEntropy(nova_slika)
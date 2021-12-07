slika = loadImage('image-512x512-16bit.raw',[512,512], 'int16');
linearna = scaleImage(slika, -0.125, 256);
oknjenje = windowImage(linearna, 1000,500);
prikaz = displayImage(oknjenje, 'oknjenje');

sivniske = linspace(0,1, 256);
stevilo_nicel = zeros(1,256)
for prag = 0:255
    upragovana = thresholdImage(oknjenje, prag);
    indeksi = upragovana <= 0;
    stevilo_nicel(prag+1) = sum(indeksi(:));
end
displayHistogram(stevilo_nicel,sivniske,'Histogram, ki prikazuje število črnih elementov v sliki')
[hist, ~, cdf, levels] = computeHistogram(prikaz.CData)
displayHistogram(cdf,levels, 'komulativna ferkvenca');
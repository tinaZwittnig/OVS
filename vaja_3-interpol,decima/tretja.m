addpath('../vaja_1/')
addpath( '../vaja_2')
slika = loadImage('pumpkin-200x152-08bit.raw',[200 152],'uint8');


%interpolacijsko območje
interpolacijska_slika = slika( 30:30+50-1,75:75+65-1);
velikost_obmocja = size(interpolacijska_slika);
prikaz_obmocja = displayImage(interpolacijska_slika, 'interpolacijska slika',[0 velikost_obmocja(2)], [0 velikost_obmocja(1)]);
%saveas(prikaz_obmocja, 'prikaz_obmocja.png')

[hist, norHist, cdf, levels] = computeHistogram(interpolacijska_slika);
histo_obmocja = displayHistogram(hist,levels,'histogram');
saveas(histo_obmocja, 'pictures/histogram_obmocja.png')

maximalna_vrednost = max(interpolacijska_slika(:))
minimalna = min(interpolacijska_slika(:))
povprecna = mean(interpolacijska_slika(:))

%interpolacija ničtega reda
velikost = [600 300];
interpoliraj_nictega = interpolateImage(interpolacijska_slika, velikost , 0);

prikaz_nictega = displayImage(interpoliraj_nictega, 'Interpolacija dela slike ničtega reda',[0 velikost(1)],[0 velikost(2)]);
saveas(prikaz_nictega, 'pictures/prikaz_nictega.png')

[hist_nictega, norHist_nictega, cdf_nictega, levels_nictega] = computeHistogram(interpoliraj_nictega);
prikaz_histo_nictega = displayHistogram(hist_nictega,levels_nictega,'histogram interpolacije ničtega reda');
saveas(prikaz_histo_nictega, 'pictures/histogram_nictega.png')

maximalna_vrednost_nictega = max(interpoliraj_nictega(:))
minimalna_nictega = min(interpoliraj_nictega(:))
povprecna_nictega = mean(interpoliraj_nictega(:))


% interpolacija prvega reda
interpoliraj_prvega = interpolateImage(interpolacijska_slika, velikost , 1);
prikaz_prvega = displayImage(interpoliraj_prvega, 'Interpolacija dela slike prvega reda',[0 velikost(1)],[0 velikost(2)]);
saveas(prikaz_prvega, 'pictures/prikaz_prvega.png')

[hist_prvega, norHist_prvega, cdf_prvega, levels_prvega] = computeHistogram(interpoliraj_prvega);
prikaz_histo_prvega = displayHistogram(hist_prvega,levels_prvega,'histogram interpolacije prvega reda');
saveas(prikaz_histo_prvega, 'pictures/histogram_prvega.png')

maximalna_vrednost_prvega = max(interpoliraj_prvega(:))
minimalna_prvega = min(interpoliraj_prvega(:))
povprecna_prvega = mean(interpoliraj_prvega(:))


pravilni_prikaz_nictega = displayImage(interpoliraj_nictega, 'interpolirana slika ničtega reda', [0 65], [0 50]);
pravilni_prikaz_prvega = displayImage(interpoliraj_prvega, 'interpolirana slika prvega reda', [0 65], [0 50]);
saveas(pravilni_prikaz_nictega, 'pictures/popravljen_prikaz_nictega.png')
saveas(pravilni_prikaz_prvega, 'pictures/popravljen_prikaz_prvega.png')



imSize = [512 58 907];
vxDim = [0.597656 3 0.597656];

slika = loadImage3D("spine-512x058x907-08bit.raw", imSize, 'uint8');


%stranska 
[strCS, strH, strV] = getPlanarCrossSection(slika, vxDim, [ 1 0 0], 256);
stranski_prikaz = displayImage(strCS,'stranski',strH,strV);
%saveas(stranski_prikaz, 'pictures/stranski_prikaz.png')
   
[celCS, celH, celV] = getPlanarCrossSection(slika, vxDim, [ 0 1 0], 35);
celni_prikaz = displayImage(celCS,'celni_pikaz',celH,celV);
%saveas(celni_prikaz, 'pictures/celni_prikaz.png')

%prečna
[axCS, axH, axV] = getPlanarCrossSection(slika, vxDim, [ 0 0 1], 467);
precni_prikaz = displayImage(axCS,'pečni',axH,axV);
%saveas(precni_prikaz, 'pictures/precni_prikaz.png')

[cel_maks, cel_PH_maks, cel_PV_maks ]= getPlanarProjection(slika, vxDim,[0 1 0],'max');
celni_maks = displayImage(cel_maks, 'projekcija maks', cel_PH_maks, cel_PV_maks);
%saveas(celni_maks, 'pictures/celni_maks.png')

[cel_mean, cel_PH_mean, cel_PV_mean ]= getPlanarProjection(slika, vxDim,[0 1 0],'mean');
celni_mean = displayImage(cel_mean, 'projekcija mean', cel_PH_mean, cel_PV_mean);
%saveas(celni_mean, 'pictures/celni_mean.png')

[stran_maks, stran_PH_maks, stran_PV_maks ]= getPlanarProjection(slika, vxDim,[1 0 0],'max');
stranski_maks = displayImage(stran_maks, 'projekcija maks', stran_PH_maks, stran_PV_maks);
%saveas(stranski_maks, 'pictures/stran_maks.png')

[stran_mean, stran_PH_mean, stran_PV_mean ]= getPlanarProjection(slika, vxDim,[1 0 0],'mean');
stranski_mean = displayImage(stran_mean, 'projekcija mean', stran_PH_mean, stran_PV_mean);
%saveas(stranski_mean, 'pictures/stran_mean.png')

[prec_maks, prec_PH_maks, prec_PV_maks ]= getPlanarProjection(slika, vxDim,[0 0 1],'max');
precni_maks = displayImage(prec_maks, 'projekcija maks', prec_PH_maks, prec_PV_maks);
%saveas(precni_maks, 'pictures/precni_maks.png')

[prec_mean, prec_PH_mean, prec_PV_mean ]= getPlanarProjection(slika, vxDim,[0 0 1],'mean');
precni_mean = displayImage(prec_mean, 'projekcija mean', prec_PH_mean, prec_PV_mean);
%saveas(precni_mean, 'pictures/precni_mean.png')


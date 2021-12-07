[prec_maks, prec_PH_maks, prec_PV_maks ]= getPlanarProjection(slika, vxDim,[0 0 1],'min');
precni_maks = displayImage(prec_maks, 'projekcija min', prec_PH_maks, prec_PV_maks);
[prec_maks, prec_PH_maks, prec_PV_maks ]= getPlanarProjection(slika, vxDim,[0  0 1],'median');
precni_maks = displayImage(prec_maks, 'projekcija median', prec_PH_maks, prec_PV_maks);
[prec_maks, prec_PH_maks, prec_PV_maks ]= getPlanarProjection(slika, vxDim,[0 0 1],'var');
precni_maks = displayImage(prec_maks, 'projekcija varjanca', prec_PH_maks, prec_PV_maks);
[prec_maks, prec_PH_maks, prec_PV_maks ]= getPlanarProjection(slika, vxDim,[0 0 1],'std');
precni_maks = displayImage(prec_maks, 'projekcija standardni_odklon', prec_PH_maks, prec_PV_maks);
[prec_maks, prec_PH_maks, prec_PV_maks ]= getPlanarProjection(slika, vxDim,[0 0 1],'max');
precni_maks = displayImage(prec_maks, 'projekcija maks', prec_PH_maks, prec_PV_maks);


function oImage = createRotatedPattern(iImage, iAngle)
oImage = iImage;
[Y, X] = size(iImage);
for i = 0:iAngle:359
    rotacijapremik = getParameters('affine',[1,1] , [-round(X/2) , -round(Y/2)], i, [0 0]);
    premik = getParameters('affine', [1,1], [round(X/2) , round(Y/2)],0,[0,0]);
    RT= premik*rotacijapremik;
    transf = transformImage('affine',iImage , [1 1], inv(RT),255,1);
    oImage = oImage +transf;
    
end
oImage = oImage./max(oImage)*255;
displayImage(oImage, 'slika')

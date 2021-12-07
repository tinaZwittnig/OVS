function [oMap, oTx, oTy] = exhaustiveRegistration(iImageA, iImageB, iTx, iTy)
%exhaustiveRegistration vrne matriko izračunanih metrik med referenčno
%sliko in transformirano vhodno sliko
%vhodni podatki:
%   iImageA - referenčna slika
%   iImageB - vhodna slika
%   iTx - vektor možnih premikov oblike [tx_min tx_max korak_x]
%   iTy - vektor možnih premikov oblike [ty_min ty_max korak_y]
%izhodni podatki: 
%   oMap - matrika izračunanih MSE
%   oTx - vektor vseh možnih premikov v x smeri
%   oTy - vektor vseh možnih premiklov v y smeri

%vektor premikov v x smeri
txmin = iTx(1);
txmax = iTx(2);
tx_step = iTx(3);
oTx = txmin:tx_step:txmax;

%vektor premikov v y smeri
tymin = iTy(1);
tymax = iTy(2);
ty_step = iTy(3);
oTy = tymin:ty_step:tymax;

%matrika MSE
oMap = zeros(length(oTy),length(oTx));
for x = 1:length(oTx)
    for y = 1:length(oTy)
        X = oTx(x);
        Y = oTy(y);
        %izračunamo parametre transformacije
        paramet = getParameters('affine', [1 1], [X Y], 0, [0, 0]);
        
        %izračunao tranformirano sliko
        premik = transformImage('affine', iImageB, [1,1],inv(paramet) , 0, 1 );
        
        %zapišemo vrednost MSE
        oMap(y,x) = mean(mean(abs(iImageA-premik)));
    end
end


end

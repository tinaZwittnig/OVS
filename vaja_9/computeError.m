function [R2, MSE] = computeError(rCP, iCP, oCP, rImage, iImage, oImage, iArea)
%computeError izračuna izračuna povprečno kvadratno razdaljo med vsemi pari
%kontrolnih točk in srednjo napako sivinjskih vrednosti slike. 

T = rCP - iCP;
R11 = mean(T(1).^2+T(2).^2);
T2 = oCP - rCP;
R22 = mean(T2(1).^2+T2(2).^2);
R2 = [R11 R22];
x0 = iArea(1);
y0 = iArea(2);
w = iArea(3);
h = iArea(4);
if x0>0 && y0>0
    MSE1 = mean(mean((rImage(y0:y0+h,x0:x0+w)-iImage(y0:y0+h,x0:x0+w)).^2));
    MSE2 = mean(mean((oImage(y0:y0+h,x0:x0+w)-rImage(y0:y0+h,x0:x0+w)).^2));
    MSE = [MSE1 MSE2];
end
end

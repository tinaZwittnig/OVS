function [oImage, oVal] = imitateMiniature(iImage, iS, iStdR, iL, iD0)
% iImage - vhodna slika
% iS - [M N] - velikost filtra
% iStdR - [sigma1 simga2] - vektor mejnih standardnih odklonov
% iL = [k,n] - premica k- strmina premice n- začetna točka
% iD ... razdalja od premice, ki je nočemo filtrirat.
%izhodni:
%   oImage - izhodna slika
%   oVal - [d(x, y), σ(x, y)] - razdalja in standardni odklon za vsak
%   piksel - Matrika 

[Y,X] = size(iImage);
d1 =distancePoint2Line([0.22,100], [X,1]);
d2 = distancePoint2Line([0.22,100], [1,Y]);
d3 = distancePoint2Line([0.22,100], [X,Y]);
d4 = distancePoint2Line([0.22,100], [1,1]);

dmax = max([d1,d2,d3,d4]);

%podatki o filtru
m = (iS(1)-1)/2;
n = (iS(2)-1)/2;

iImage = changeSpatialDomain('enlarge', iImage, m , n,'extrapolation');
[Yn,Xn] = size(iImage);

oImage = zeros(Yn,Xn);
oVal = zeros(X*Y,2);
enum = 1;
for y = 1+n:Yn-n
    for x = 1+m:Xn-m
        d = distancePoint2Line(iL, [x,y]);
        if abs(d) > iD0
            %filter
            [gK, gStD] = weightedGaussianFilter(iS,[iD0, dmax],iStdR,d);
            oImage(y,x) = sum(sum(gK.*iImage(y-n:y+n, x-m:x+m)));
            
            
        else
            oImage(y,x) = iImage(y,x);
            gStD = 0;
        end
        oVal(enum,1 ) = d;
        oVal(enum,2 ) = gStD;
        enum = enum +1;
    end
end


function [oCenter, oAcc] = getCenterPoint(iImage, iRadius)
% getCenterPoint poišče središče krožnice s pomočjo akumulatorja
%vhodni argumenti:
%iImage - vhodna slika
% iRadius - Radij kroga
%izhodni argumenit:
% oAcc - akumulator
% oCenter - center 

%velikost slike
[Y,X] = size(iImage);

%doloci vektorja 'r' in 'fi' glede na korak

rangeF = 0:stepF:359;

%inicalizacija:
oAcc = zeros(Y,X);
R = iRadius;
%zanka cez vse slikovne elemente
for yo = 1:Y
    for xo = 1:X
        %preverimo ali je (y,x) robna točka
        if iImage(yo,xo) ~=0
            for fidx = 1:length(rangeF)
                fi= rangeF(fidx);
                x = round(xo + R * cosd(fi));
                y = round(yo + R * sind(fi));
                if (y>0 && x>0 && y<=Y && x<=X)
                    %diffR = abs(rangeR-r);
                    %[~ , Im] = min(diffR);
                    oAcc(y, x) = oAcc(y, x)+1; %zapisemo v akumulator

                end
            end
        end 
    end
end
[Maks,Ind] = max(oAcc(:))
[Cx, Cy] = ind2sub(size(oAcc),Ind);
oCenter = [Cx Cy];


end
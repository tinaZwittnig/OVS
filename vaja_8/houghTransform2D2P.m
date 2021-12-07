% Houghova preslikava v 2 dimenzijah za 2 parametra
function [oAcc, rangeR, rangeF] = houghTransform2D2P(iImage, stepR, stepF)
% houghTransform2D2P izvede hughovo preslikavo za 2 parametra
%vhodni argumenti:

%velikost slike
[Y,X] = size(iImage);

%doloci vektorja 'r' in 'fi' glede na korak
rangeR = 1:stepR:sqrt(Y^2+X^2);
rangeF = -90:stepF:(180-10^(-5));

%inicalizacija:
oAcc = zeros(size(rangeR,2), size(rangeF,2));

%zanka cez vse slikovne elemente
for y = 1:Y
    for x = 1:X
        %preverimo ali je (y,x) robna točka
        if iImage(y,x) ~=0
            for fidx = 1:length(rangeF)
                fi= rangeF(fidx);
                r = (x-1)*cosd(fi) + (y-1)* sind(fi);
                if and(r>=rangeR(1), r <= rangeR(end))
                    diffR = abs(rangeR-r);
                    [~ , Im] = min(diffR);
                    oAcc(Im, fidx) = oAcc(Im, fidx)+1; %zapisemo v akumulator

                end
            end
        end 
    end
end

end
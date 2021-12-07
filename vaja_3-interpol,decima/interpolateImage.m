function oImage = interpolateImage(iImage, iSize, iOrder)
%interpolateImage funkcija, ki vrne interpolirano sliko
%
% vhodni podatki
%   iImage - slika zapisana v matrični obliki
%   iSize - velikost željene slike, podano v vektorju [x y]
%   iOrder - red iterpolacije
% izhodni podatki
%   oImage - interpolirana slika v matrični obliki
oImage = zeros(iSize(2),iSize(1));
step  = [(size(iImage,2) -1)/(iSize(1)-1), (size(iImage,1) -1)/(iSize(2)-1)];
for i = 1:iSize(2)
    for j = 1:iSize(1)
        %inicilizacije sivinske vrednosti
        s = 0;
        pt  =[(j-1)* step(1)+1,  (i-1)*step(2) + 1];
        if iOrder == 0 %princip najbližjega slikovnega elementa
            px = round(pt); 
            s = iImage(px(2),px(1));
            
        elseif iOrder == 1
            px  = floor(pt);
            if px(1) < size(iImage,2) && px(2) < size(iImage,1)
                p1 = abs(pt(1)- px(1)) * abs(pt(2)-px(2));
                p2 = abs(pt(1) - (px(1)+1)) * abs(pt(2) -px(2));
                p3 = abs(pt(1) - px(1)) * abs(pt(2) - (px(2) +1));
                p4 = abs(pt(1) - (px(1)+1)) * abs(pt(2) - (px(2) +1));
                
                sa = iImage(px(2),px(1));
                sb = iImage(px(2),px(1)+1);
                sc = iImage(px(2)+1,px(1));
                sd = iImage(px(2)+1,px(1)+1);
                s = floor(p4 * sa + p3 * sb + p2 * sc +p1 * sd);
            end
                
        end
        oImage(i,j) = s;
    end
end
end
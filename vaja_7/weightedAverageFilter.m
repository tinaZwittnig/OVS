function oFilter = weightedAverageFilter(iM, iN, iValue)
% weightedAverageFilter vrne filter z urteženim povprečjem, z osnovo
% iValue, velikosti N x M
%vhodni parametri:
%   iM - velikost filtra v y osi
%   iN - velikost filtra v x osi
%izhodni parameter:
%   oFilter - filter uteženega povprečenja

oFilter = ones(iN, iM);
for x = 1:(iM/2)+1
    for y = 1:(iN/2)+1
        oFilter(y,x) = iValue^(x-1) *iValue^(y-1);
        oFilter(y,end-x+1) = iValue^(x-1) *iValue^(y-1);
        oFilter(end-y+1,x) = iValue^(x-1) *iValue^(y-1);
        oFilter(end-y+1,end-x+1) = iValue^(x-1) *iValue^(y-1);
    end
end
vsota = sum(sum(oFilter(:)))
oFilter = oFilter./vsota;
end

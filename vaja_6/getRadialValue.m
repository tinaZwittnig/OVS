function oValue = getRadialValue(iXY, iCP)
%getRadeiaValue izračuna vrednost funkcije U (U = -r^2*ln(r))
%vhodni parametri 
%   iXY - kontrolna točke, do katere računamo razdaljo
%   iCP - preslikane kontrolne točke - vse
%izhodni elementi :
%   oValue = vrednost funkcije 

K = size(iCP,1);
oValue = zeros(K,1);
%čez vse kontrolne točke
for k = 1:K
    %razdalja r
    r = norm(iXY - iCP(k,:),2);
    if r > 0
        oValue(k)= -r.^2 *log2(r);
    end
end 
end
    
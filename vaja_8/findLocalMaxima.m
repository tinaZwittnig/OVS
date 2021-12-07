% poisci lokalne maksimume akumulatorja
function [maxR, maxF] = findLocalMaxima(iAcc, rangeR, rangeF, iIntersect, maxIntersectFlag)

    % preveri vrednosti akumulatorja
    if (iAcc == 0)
        maxR = [];
        maxF = [];
        return;
    end
    
    % doloci privzete vrednosti
    if (iIntersect < 3)
        iIntersect = 3;
    end

    % inicializacija vrednosti
    maxR = [];
    maxF = [];    
    accFlag = zeros(size(iAcc));    
        
    % iskanje lokalnih maksimumov akumulatorja
    if (~maxIntersectFlag)
        % povecaj akumulator za izbrano okolico iskanja "n"
        n = 1;
        oAcc = zeros(size(iAcc)+2*n);        
        oAcc(n+1:n+size(iAcc,1), n+1:n+size(iAcc,2)) = iAcc;
        for y = 1:n
            oAcc(y,:) = oAcc((2*n+1)-y,:);
            oAcc((size(iAcc,1)+n)+y,:) = oAcc((size(iAcc,1)-n)+(2*n+1)-y,:);
        end
        for x = 1:n
            oAcc(:,x) = oAcc(:,(2*n+1)-x);
            oAcc(:,(size(iAcc,2)+n)+x) = oAcc(:,(size(iAcc,2)-n)+(2*n+1)-x);        
        end
        % iskanje lokalnih maksimumov
        cIdx = ((n*2+1)^2+1)/2;
        for rIdx = 1:length(rangeR)
            for fIdx = 1:length(rangeF)
                accArea = oAcc(rIdx:rIdx+2*n, fIdx:fIdx+2*n);
                maxArea = max(accArea(:));
                maxIdx = find(accArea == maxArea);            
                if (find(maxIdx == cIdx))
                    accFlag(rIdx,fIdx) = 1;
                end
            end
        end
    % iskanje globalnega maksimuma akumulatorja
    else
        maxV = max(iAcc(:));
        [rIdx, fIdx] = find(iAcc == maxV);
        accFlag(rIdx(1),fIdx(1)) = 1;
        iIntersect = -1;
    end
        
    % doloci akumulator z najmanj iIntersect premicami
    [rIdx, fIdx] = find(accFlag == 1);    
    for i = 1:length(rIdx)
        if (iAcc(rIdx(i), fIdx(i)) >= iIntersect)
            maxR = [maxR; rangeR(rIdx(i))];
            maxF = [maxF; rangeF(fIdx(i))];
        end
    end
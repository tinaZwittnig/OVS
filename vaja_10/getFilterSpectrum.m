function oMatrix = getFilterSpectrum(iMatrix, iD0, iType)
%vhodni:
%   iMatrix - matrika 2D spektra
%   iD0 - mejna mferkvenca filtra D0
%   iType : ILPF, BLPF, IHPF, BHPF
%izhodni:
%   oMAtix - matrika spektra iType

oMatrix = iMatrix;
[N, M] = size(iMatrix);

sredisce = [(N+1)/2, (M+1)/2];
if strcmp(iType, 'ILPF')
    for n = 1:N
        for m = 1:M
            D = norm([n,m]-sredisce);
            if D  <=iD0
                oMatrix(n,m) = 1;
            end
        end
    end
elseif strcmp(iType, 'BLPF')
    for n = 1:N
        for m = 1:M
            D = norm([n,m]-sredisce);
            oMatrix(n,m) = 1/(1+(D/iD0)^4);
        end
    end               
elseif strcmp(iType, 'IHPF')
    for n = 1:N
        for m = 1:M
            D = norm([n,m]-sredisce);
            if D  <=iD0
                oMatrix(n,m) = 1;
            end
        end
    end
    oMatrix = 1-oMatrix;
elseif strcmp(iType, 'BHPF')
    for n = 1:N
        for m = 1:M
            D = norm([n,m]-sredisce);
            oMatrix(n,m) = 1/(1+(iD0/D)^4);
        end
    end   
    
end
end
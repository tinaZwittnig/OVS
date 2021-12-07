function oMatrix = computeDFT2(iMatrix, iDir)
%computeDFT2 
%vhodni podatki
%   
%   
%izhodni podatki

[N, M] = size(iMatrix);
n = 0:1:N-1;
m = 0:1:M-1;
NN = n'*n;
MM  = m'*m;
%koeficienti
wN = (1/sqrt(N)).*(exp(-1j*2*pi/N).^NN);
wM = (1/sqrt(M)).*(exp(-1j*2*pi/M).^MM);

if strcmp(iDir, 'inverse')
    wN = conj(wN);
    wM = conj(wM);
end

%izračunaj DFT
oMatrix = wN*iMatrix*wM;
end
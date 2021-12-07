function [oMF, oCP] = blockMatching(iF1, iF2, iSize, iSearchSize)

%velikost posamezne slicice
[Y, X] = size(iF1);

%število blokov
M = floor(X/iSize(1));
N = floor(Y/iSize(2));

%vektor premika, središče blokov
oMF = zeros(N, M, 2);
oCP = zeros(N, M, 2);
Err = ones(N,M) *255;

P = (iSearchSize-1)/2;

PTS = [0 0;
       1 0;
       -1 0;
       0 1;
       0 -1;
       1 1;
       1 -1;
       -1 -1;]
%zanka čez bloke (navpično)
for n = 1:N
    %vrstice v trenutnem bloku
    y = (n-1)*iSize(2)+1: n*iSize(2);
    %zanka čez bloke (vodoravno)
    for m = 1:M
        x = (m-1)*iSize(1)+1: m*iSize(1);
        
        %trenurna vrednost središča v bloku
        oCP(n,m,:) = [mean(x), mean(y)];
        
        %Trenuten blok v sliki 1 in 2
            B1 = iF1(y,x);
            B2 = iF2(y,x);
          
            %logaritemsko iskanje vektorja premika
            for i = 1:3
                %določi področje iskanja
                Pi = (P+1)/(2^i);
                PTSi = PTS.*Pi;
                
                %kandidat za vektor premika
                d0 = [oMF(n,m,1), oMF(n,m,2)];
                
                %zanka čez področje iskanja
                for p = 1:size(PTSi, 1)
                    %trenutni vektor premika
                    d = d0 + PTSi(p,:);
                    %napoved bloka 2
                    pF2 = framePrediction(iF1, d);
                    pB2 = pF2(y,x);
                    idx = B2 >= 0 & pB2 >= 0;
                    bErr = sum(abs(B2(idx) - pB2(idx)))/sum(idx(:));
                    
                    %primerjaj napako napovedovanja
                    if bErr < Err(n,m)
                        Err(n,m) = bErr;
                        oMF(n,m,:) = d;
                        
                    end
                end
            end
        end
    end
end

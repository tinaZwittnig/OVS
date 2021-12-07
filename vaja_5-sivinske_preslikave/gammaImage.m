function oImage = gammaImage(iImage, iG)
%gammaImage preslika dano sliko z nelinearno gama preslikavo. 
%vhodni elementi;
%   iImage - vhodna slika  podana z matriko 
%   iG - gamma parameter preslikave
%izhodni elementi:
%   gImage - preslikana slika v matrični obliki
oImage = 255^(1-iG) .* (iImage) .^iG;
end
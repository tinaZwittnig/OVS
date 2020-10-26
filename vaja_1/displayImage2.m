function displayImage2(iImage, iTitle)
% prikaže sliko na zaslonu.
% vhodni elementi: 
%   iImage - matriko, ki predstvlja sliko
%   iTitle - naslov slike

slika = figure('Name', iTitle, 'Color', [1 1 1]);
% določi barvno lestvico
cmap = linspace(0,1, 256)';
cmap = [cmap cmap cmap];
colormap(cmap);
image(uint8(iImage));
axis image;
axis off;
end


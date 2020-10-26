function graph = displayImage(iImage, iTitle, iGridX, iGridY)
% prikaže sliko na zaslonu.
% vhodni elementi: 
%   iImage - matrika, ki predstvlja sliko
%   iTitle - naslov slike
%   iGridX - čez katere x vrednosti naj bo prikazana slika 
%       podan v vektorju [x1 x2] 
%   iGridY - čez katere y vrednosti naj bo prikazana slika
%       podan v vektorju [y1 y2]
% izhodni podatki:
%   graph - objekt tipa figure, ki predstavlja prikazoano sliko

slika = figure('Name', iTitle, 'Color', [1 1 1]);
% določi barvno lestvico
cmap = linspace(0,1, 256)';
cmap = [cmap cmap cmap];
colormap(cmap);
graph = image(iGridX, iGridY, uint8(iImage));
axis image;
axis off;
end


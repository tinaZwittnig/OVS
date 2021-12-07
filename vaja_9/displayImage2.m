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

slika = figure('Name', iTitle, 'Color', [1 1 1])
% določi barvno lestvico
cmap = linspace(0,1, 256)';
cmap = [cmap cmap cmap];
colormap(cmap);
if nargin ==2
    graph = image(uint8(iImage));
else
    graph = image(iGridX, iGridY, uint8(iImage))
end
axis image;
a = get(gca,'XTick')
[Y,X] = size(iImage)
b = linspace(0,X,6)
xticks(b)
xticklabels(linspace(-15,15,7))
end


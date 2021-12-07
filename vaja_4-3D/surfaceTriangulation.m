function pHandle = surfaceTriangulation(iImage, iDim, iIsoValue)
% izraˇcun in izris izo-povrˇsine
oPatch = isosurface(iImage, iIsoValue);
fName = sprintf('Triangulacija povrˇsine za izo-vrednost %.1d', iIsoValue);
figure('Name', fName, 'Color', [1 1 1]);
pHandle = patch(oPatch, 'FaceColor', 'red', 'EdgeColor', 'none');
% nastavitev koordinatnih osi, osvetlitve in pogleda
daspect(1./iDim);
axis tight;
set(gca, 'YDir', 'reverse', 'ZDir', 'reverse');
isonormals(iImage, pHandle); camlight; lighting gouraud;
view(217.5, 30);
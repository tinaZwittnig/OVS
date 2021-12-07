g = loadImage('pattern-236x330-08bit.raw', [236 330], 'uint8');
orig  = displayImage(g, 'originalna slika')
saveas(orig, 'porocilo/img1.png')

%four. transf.
G = computeDFT2(g, 'forward');
H0 = zeros(size(G));
%mejne ferkvence
d = min(size(H0));
d01 = 1/16 * d
d02 = 1/4 * d
d03 = 1/3 * d

%prva mejna ferkvenca
for ferk = [d01 d02 d03]
L = getFilterSpectrum(H0, ferk, 'ILPF');
analyzeDFT2(L, 'scale',append('ILPF ',num2str(ferk)), 'display');
GfL = G.*analyzeDFT2(L, 'center');
gfL = computeDFT2(GfL, 'inverse');
analyzeDFT2(gfL, 'amplitude', 'log','scale',  append('gfILPF ',num2str(ferk))', 'display');

H = getFilterSpectrum(H0, ferk, 'IHPF');
analyzeDFT2(H, 'scale', append('IHPF ',num2str(ferk)), 'display')
GfH = G.*analyzeDFT2(H, 'center');
gfH = computeDFT2(GfH, 'inverse');
analyzeDFT2(gfH, 'amplitude', 'scale', append('gfIHPF ',num2str(ferk))', 'display')


H2 = getFilterSpectrum(H0, ferk, 'BHPF')
analyzeDFT2(H2, 'scale', 'BHPF', 'display')
analyzeDFT2(H2, 'scale', 'center','BHPF', 'display')
%filtriraj sliko v ferkvenčni domeni
Gf2 = G.*analyzeDFT2(H2, 'center');
analyzeDFT2(Gf2, 'amplitude', 'log','scale', 'center', 'BHPF', 'display')
gf2 = computeDFT2(Gf2, 'inverse');
analyzeDFT2(gf2, 'amplitude', 'scale', append('gfBHPF ',num2str(ferk)), 'display')




BL = getFilterSpectrum(H0, ferk, 'BLPF');
analyzeDFT2(BL, 'scale',append('BLPF ',num2str(ferk))', 'display');
GfBL = G.*analyzeDFT2(BL);
gfBL = computeDFT2(GfBL, 'inverse');
analyzeDFT2(gfBL,  'amplitude', 'log','scale', append('gfBLPF ',num2str(ferk)), 'display');
end
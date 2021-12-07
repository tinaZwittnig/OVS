g = loadImage('pattern-236x330-08bit.raw', [236 330], 'uint8');
displayImage(g, 'originalna slika')

G = computeDFT2(g, 'forward');


d = min(size(H0));
d01 = 1/16 * d
d02 = 1/4 * d
d03 = 1/3 * d

%prvi filter
H0 = zeros(size(G));
H = getFilterSpectrum(H0, d03, 'ILPF')
analyzeDFT2(H, 'scale', 'ILPF filter', 'display')

%filtriraj sliko v ferkvenčni domeni
Gf = G.*analyzeDFT2(H, 'center');

%prekonstruiraj in prikaži filtrirano sliko
gf = computeDFT2(Gf, 'inverse');
analyzeDFT2(gf, 'amplitude', 'scale', 'ILPF', 'display')


%drugi filter
H0 = zeros(size(G));
H = getFilterSpectrum(H0, d03, 'IHPF')
analyzeDFT2(H, 'scale', 'IHPF filter', 'display')
%filtriraj sliko v ferkvenčni domeni
Gf = G.*analyzeDFT2(H, 'center');
analyzeDFT2(Gf, 'amplitude', 'log','scale', 'center', 'Gf', 'display')

%prekonstruiraj in prikaži filtrirano sliko
gf = computeDFT2(Gf, 'inverse');
analyzeDFT2(gf, 'amplitude', 'scale', 'IHPF', 'display')



%tretji filter

H2 = getFilterSpectrum(H0, d03, 'BHPF')
analyzeDFT2(H2, 'scale', 'BHPF filter', 'display')
%filtriraj sliko v ferkvenčni domeni
Gf2 = G.*analyzeDFT2(H2, 'center');
gf2 = computeDFT2(Gf2, 'inverse');

analyzeDFT2(gf2, 'amplitude', 'scale', 'BHPF', 'display')


%cetrti filter

H3 = getFilterSpectrum(H0, d03, 'BLPF')
analyzeDFT2(H3, 'scale', 'BLPF filter', 'display')

%filtriraj sliko v ferkvenčni domeni
Gf3 = G.*analyzeDFT2(H3, 'center');
gf3 = computeDFT2(Gf3, 'inverse');
analyzeDFT2(gf3, 'amplitude', 'scale', 'BLPF', 'display')

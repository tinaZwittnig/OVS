%tretja
%prva slika
g = loadImage('pattern-236x330-08bit.raw', [236 330], 'uint8');
G = computeDFT2(g,  'forward'); %four. transformacija
AG = analyzeDFT2(G,'amplitude'); % amplitudni odziv

enophazG = AG(1,1); %enosmerna spektralna komponenta

invenophazG = 1/sqrt(numel(AG))*enophazG
mean(g(:))

h = loadImage('pumpkin-200x152-08bit.raw', [200 152], 'uint8');
H = computeDFT2(h,  'forward');%four. transformacija
AH = analyzeDFT2(H,'amplitude');% amplitudni odziv

enophazH = AH(1,1) %enosmerna spektralna komponenta

invenophazH = 1/sqrt(numel(AH))*enophazH
mean(h(:))



k = loadImage('cameraman-256x256-08bit.raw', [256 256], 'uint8');
K = computeDFT2(k,  'forward');%four. transformacija
AK = analyzeDFT2(K,'amplitude');% amplitudni odziv

enophazK = AK(1,1);% enosmerna spektralna komponenta

invenophazK = 1/sqrt(numel(AK))*enophazK
mean(k(:))
addpath('/home/tina/Documents/faks/OVS/vaja_3')
%naložimo video
vid = VideoReader('simple-video.avi');

I1 = read(vid,62);
I2 = read(vid,63);
I3 = read(vid,64);

displayImage(I1, 'slika 1');
displayImage(I2, 'slika 2');

bSize = [8, 8];
sSize = 2^4-1;

[MF, CP] = blockMatching(I1, I2, bSize, sSize);
MF(:, :, 1)
stolpci = size(nonzeros(MF(:, :, 1)));
vrstice = size(nonzeros(MF(:, :, 2)));

premik = getParameters('affine',[1,1] , [stolpci, vrstice], 0, [0 0]);
transf = transformImage('affine',I2 , [1 1], inv(premik),0,0);
displayImage(transf, 'napoved')

displayImage(uint8(transf)-I3, 'razlika slik')


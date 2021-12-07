addpath('/home/tina/Documents/faks/OVS/vaja_3')
%naložimo video
vid = VideoReader('real-video.avi');

I1 = read(vid,62);
I2 = read(vid,63);

displayImage(I1, 'slika 1');
displayImage(I2, 'slika 2');

bSize = [8, 8];
sSize = 2^4-1;

[MF, CP] = blockMatching(I1, I2, bSize, sSize);


displayMotionField(MF, CP, 'Vektorji premika');
displayMotionField(MF, CP, 'Superponirani vektorji premika', I1);
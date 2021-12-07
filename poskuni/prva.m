%%prva
distancePoint2Line([0.22,100], [0,100])

M = 7;
N = 7;
w1 = 0;
w2 = 10;
sigma1 = 0.1;
sigma2 = 10;
w = (w1+w2)/2
g1 = weightedGaussianFilter([M,N],[w1,w2],[sigma1,sigma2],w)

addpath('/home/tina/Documents/faks/OVS/vaja_10')
displayImage(255*rescale(g1),'filter')

img = loadImage('train-400x240-08bit.raw', [400,240],'uint8');
displayImage(img,'filter');

[b, oVal] = imitateMiniature(img,[M,N], [sigma1,sigma2], [0.22,100], 25);

displayImage(b,'izhod')
figure()
plot(oVal(:,1),oVal(:,2),'.')
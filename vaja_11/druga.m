ovid = VideoWriter('VektorjiPremika.avi');

ivid = VideoReader('simple-video.avi');
fram = ivid.Duration * ivid.FrameRate;
open(ovid);

for i = 1:fram-1

    I1 = read(ivid, i);
    I2 = read(ivid, i+1);

    bSize = [8,8];
    sSize = 2^4-1;

    [MF, CP] = blockMatching(I1, I2, bSize, sSize);
    quiver(CP(:,:,1), CP(:,:,2), MF(:,:,1), MF(:,:,2), 'r-') %ne uporabimo funkcije, da se nam ne odpre 150 figure.
    set(gca, 'Ydir', 'reverse');
    axis image
    frame = getframe(gcf);
    writeVideo(ovid,frame);
end

close(ovid);
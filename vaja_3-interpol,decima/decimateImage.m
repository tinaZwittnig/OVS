function oImage = decimateImage(iImage, iKernel, iLevel)

[N ,M] = size(iKernel); %velikost filtra
n= floor(N./2);
m= floor(M./2);



for i =1:iLevel
[Y, X] = size(iImage); %velikost vhodne matrike
oImage = zeros(floor(Y/2),floor(X/2));
filter = iKernel;
for y = 1:floor(Y/2)
    for x = 1:floor(X/2)
        %domena slike, ki pripada filtru

        if y*2+N-1 < Y && x*2+M-1 <X
            F = iImage(y*2:y*2+N-1, x*2:x*2+M-1);
            oImage(y+1,x+1) = sum(sum(filter.*F));
        end
    end
end
iImage = oImage;

end
% naloga 1
slika = imread('lena-color.png');
%imshow(slika);
imwrite(slika, 'lena-color.jpg')

% naloga 2

slika2_col = loadImage('lena-color-512x410-08bit.raw', [512, 410], 'uint8');
slika3_gray = loadImage('lena-gray-410x512-08bit.raw', [410, 512], 'uint8');
imshow(uint8(slika2_col))

% naloga 3

displayImage(slika3_gray, 'Lena siva 410 x 512')
displayImage(slika2_col, 'Lena barvna 512 x 410')
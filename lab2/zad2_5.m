bmp = imread('lena.bmp');

figure(1);
bmp31 = imadjust(bmp,[0 1], [0, 31/255]);
imshow(bmp31, []);

figure(2);
bmp15 = imadjust(bmp,[0 1], [0, 15/255]);
imshow(bmp15, []);

figure(3);
bmp7 = imadjust(bmp,[0 1], [0, 7/255]);
imshow(bmp7, []);

figure(4);
bmp3 = imadjust(bmp,[0 1], [0, 3/255]);
imshow(bmp3, []);

figure(5);
bmp1 = imadjust(bmp,[0 1], [0, 1/255]);
imshow(bmp1, []);

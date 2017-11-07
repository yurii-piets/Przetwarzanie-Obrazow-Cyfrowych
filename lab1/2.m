clear;
lenaGrayBmp = imread('lena_gray.bmp');
[X,map] = gray2ind(lenaGrayBmp, 256);
imshow(X,map);
figure(1)

map = colormap(parula(256));
figure(2);
imshow(X,map);
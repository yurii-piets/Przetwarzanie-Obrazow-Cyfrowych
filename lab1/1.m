clear;
close all;
jpgLena = imread('lena.jpg');
bmpLena = imread('lena.bmp');
rgbLena = rgb2gray(bmpLena);
figure(1);
imshow(jpgLena);
figure(2)
imshow(bmpLena);
figure(3)
imshow(rgbLena);

imwrite(rgbLena,'lena_gray.bmp');

colormap gray;
figure(4)
mesh(rgbLena);

figure(5)
plot(rgbLena(10,:));


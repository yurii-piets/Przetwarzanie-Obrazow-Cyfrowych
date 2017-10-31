clearvars; close all; clc;

lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

hist1 = imread('hist1.bmp');
hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');

%1
figure(1);
subplot(2,4,1);imshow(lena1);
subplot(2,4,2);imshow(lena2);
subplot(2,4,3);imshow(lena3);
subplot(2,4,4);imshow(lena4);

subplot(2,4,5);imhist(lena1, 256);
subplot(2,4,6);imhist(lena2, 256);
subplot(2,4,7);imhist(lena3, 256);
subplot(2,4,8);imhist(lena4, 256);

%3
figure(2);
subplot(1,3,1);imshow(hist1);
subplot(1,3,2);imhist(hist1, 256);
subplot(1,3,3);imshow(imadjust(hist1));

%7 - cummulated
[H, x] = imhist(hist1);
C = cumsum(H);

C = uint8(C/max(C) * 255);
lut = intlut(hist1, C);

[H, x] = imhist(lut);
C = cumsum(H);

k = max(C) / max(H);
C = C / k;
figure(3);
subplot(1,2,2); hold on; plot(x, H); plot(x, C); hold off;
subplot(1,2,1); imshow(lut);

%11
figure(4);
subplot(1,3,1);imshow(hist1);
subplot(1,3,2);histeq(hist1, 256); 
subplot(1,3,3);imshow(adapthisteq(hist1)); 
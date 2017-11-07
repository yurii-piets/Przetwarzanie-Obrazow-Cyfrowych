clearvars; close all; clc;
image = imread('lenaSzum.bmp');

%mediana
med = medfilt2(image, [3, 3]);

subplot(3,3,1); imshow(image);
subplot(3,3,2); imshow(med);
subplot(3,3,3); imshow(imabsdiff(med, image), []);

%usredniajca
filtrAvg = fspecial('average', 3);
conv = conv2(image, filtrAvg, 'same');
conv = uint8(conv);

subplot(3,3,4); imshow(image);
subplot(3,3,5); imshow(conv);
subplot(3,3,6); imshow(imabsdiff(conv, image), []);

%powtorzenie

imageBezSzumu = imread('lena.bmp');
med10 = imageBezSzumu;

for i=0:9
    med10 = medfilt2(med10, [3, 3]);
end;

subplot(3,3,7); imshow(imageBezSzumu);
subplot(3,3,8); imshow(conv);
subplot(3,3,9); imshow(imabsdiff(med10, image), []);

%

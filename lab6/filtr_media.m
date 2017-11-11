clearvars; close all; clc;
image = imread('lenaSzum.bmp');

%mediana
med = medfilt2(image, [3, 3]);

subplot(3,3,1); imshow(image); title('oryginal');
subplot(3,3,2); imshow(med); title('mediana');
subplot(3,3,3); imshow(imabsdiff(med, image), []); title('imabsdiff');

%usredniajca
filtrAvg = fspecial('average', 3);
conv = conv2(image, filtrAvg, 'same');
conv = uint8(conv);

subplot(3,3,4); imshow(image); title('oryginal');
subplot(3,3,5); imshow(conv); title('average');
subplot(3,3,6); imshow(imabsdiff(conv, image), []); title('imabsdiff');

%powtorzenie
imageBezSzumu = imread('lena.bmp');
med10 = imageBezSzumu;

for i=0:9
    med10 = medfilt2(med10, [3, 3]);
end;

subplot(3,3,7); imshow(imageBezSzumu); title('oryginal');
subplot(3,3,8); imshow(conv); title('po 10 powt.');
subplot(3,3,9); imshow(imabsdiff(med10, image), []);  title('imabsdiff');

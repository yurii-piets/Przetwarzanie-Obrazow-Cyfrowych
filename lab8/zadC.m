clearvars; close all; clc;

image = imread('ferrari.bmp');

se = strel('square', 3);

%erozja i dylatacja
erodedImage = imerode(image, se);
dilatedImage = imdilate(image, se);

erodedImageDiff = imabsdiff(image, erodedImage);
dilatedImageDiff = imabsdiff(image, dilatedImage);

figure;
subplot(1,2,1); title('oryginal');

subplot(2,3,1); imshow(image,[]); title('oryginal');
subplot(2,3,2); imshow(erodedImage,[]); title('eroded');
subplot(2,3,3); imshow(dilatedImage,[]); title('dilated');

subplot(2,3,4); imshow(erodedImageDiff,[]); title('eroded diff');
subplot(2,3,5); imshow(dilatedImageDiff,[]); title('dilated diff');

%tophat i bothat
figure;
subplot(1,3,1); imshow(image,[]); title('oryginal');
subplot(1,3,2); imshow(imtophat(image, se),[]); title('tophat');
subplot(1,3,3); imshow(imbothat(image, se),[]); title('bothat');

figure;
image = imread('rice.png');
subplot(1,3,1); imshow(image,[]); title('oryginal');
subplot(1,3,2); imshow(imtophat(image, strel('disk', 10)),[]); title('tophat');
subplot(1,3,3); imshow(imbothat(image, strel('disk', 10)),[]); title('bothat');
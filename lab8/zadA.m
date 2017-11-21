clearvars; close all; clc;

image = imread('ertka.bmp');

se = strel('square', 3);
eroded = imerode(image, se);

%erozja
figure;
subplot(2,3,1); imshow(image, []); title('oryginal');
subplot(2,3,2); imshow(eroded, []); title('eroded - square');
subplot(2,3,3); imshow(imerode(image, strel('diamond', 3)), []); title('eroded - diamond');
subplot(2,3,4); imshow(imerode(image, strel('line', 10, 90)), []); title('eroded - line');

eroded3 = imerode(imerode(imerode(image, se), se), se);
subplot(2,3,5); imshow(eroded3, []); title('eroded - 3 times');

%dylatacja
se = strel('square', 3);
figure;

dilated = imdilate(image, se);
subplot(1,2,1); imshow(image, []); title('oryginal');
subplot(1,2,2); imshow(dilated, []); title('imdilated - square');

%erozja, dylatacja, otwarcie, zamkniencie
image = imread('ertka.bmp');
figure;
se = strel('square', 3);
subplot(2,3,1); imshow(image, []); title('oryginal');
subplot(2,3,2); imshow(imerode(image,se), []); title('imerode');
subplot(2,3,3); imshow(imdilate(image, se), []); title('imdilate');
subplot(2,3,4); imshow(imopen(image, se), []); title('imopen');
subplot(2,3,5); imshow(imclose(image, se), []); title('imclose');

%11
figure;
image = imread('ertka.bmp');
se = strel('square', 3);
subplot(1,2,1); imshow(image, []); title('oryginal');
subplot(1,2,2); imshow(imclose(imopen(image,se), se), []); title('czyste');

%trafi, nie trafi
figure;
image = imread('hom.bmp');
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];
hitMiss = bwhitmiss(image, SE1, SE2);
subplot(1,2,1); imshow(image, []); title('oryginal');
subplot(1,2,2); imshow(hitMiss, []); title('hitMiss');





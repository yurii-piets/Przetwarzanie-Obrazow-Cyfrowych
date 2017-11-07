clearvars; close all; clc;
image = imread('plansza.bmp');

filtrAvg = fspecial('average', 3);
conv = conv2(image, filtrAvg, 'same');
conv = uint8(conv);

figure(1);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(conv);
subplot(1,3,3); imshow(imabsdiff(conv, image), []);

%maska
M = [1 2 1; 2 4 2; 1 2 1];
M = M / sum(sum(M));

convM = conv2(image, M, 'same');
convM = uint8(convM);

figure(2);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(convM);
subplot(1,3,3); imshow(imabsdiff(convM, image), []);

%gaussian
filtrG = fspecial('gaussian', 5, 0.5);
convG = uint8(conv2(image, filtrG, 'same'));

figure(3);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(convG);
subplot(1,3,3); imshow(imabsdiff(conv, image), []);

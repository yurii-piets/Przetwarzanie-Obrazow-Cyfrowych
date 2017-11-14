clearvars; close all; clc;
image = imread('plansza.bmp');

filtrAvg = fspecial('average', 3);
conv = conv2(double(image), filtrAvg, 'same');
conv = uint8(conv);

subplot(3,3,1); imshow(image); title('oryginal');
subplot(3,3,2); imshow(conv); title('average');
subplot(3,3,3); imshow(imabsdiff(conv, image), []); title('imabsdiff');

%maska
M = [1 2 1; 2 4 2; 1 2 1];
M = M / sum(sum(M));

convM = conv2(double(image), M, 'same');
convM = uint8(convM);

subplot(3,3,4); imshow(image); title('oryginal');
subplot(3,3,5); imshow(convM); title('M');
subplot(3,3,6); imshow(imabsdiff(convM, image), []); title('imabsdiff');

%gaussian
filtrG = fspecial('gaussian', 5, 0.5);
convG = uint8(conv2(double(image), filtrG, 'same'));

subplot(3,3,7); imshow(image); title('oryginal');
subplot(3,3,8); imshow(convG); title('gaussian');
subplot(3,3,9); imshow(imabsdiff(conv, image), []); title('imabsdiff');

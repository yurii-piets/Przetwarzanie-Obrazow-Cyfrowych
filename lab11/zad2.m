close all; clearvars; clc;
image = imread('ccl2.png');

index4 = bwlabel(image, 4);
index8 = bwlabel(image, 4);

subplot(1,3,1); imshow(image, []); title('ccl2.png');
subplot(1,3,2); imshow(index4, []); title('index4');
subplot(1,3,3); imshow(index8, []); title('index8');
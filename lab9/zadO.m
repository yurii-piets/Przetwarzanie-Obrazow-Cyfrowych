clearvars; close all; clc;

image = imread('dom.png');
BW = edge(image, 'log');
BW2 = edge(image, 'canny');

subplot(2,3,1); imshow(image, []); title('oryginal');
subplot(2,3,2); imshow(BW, []); title('log');
subplot(2,3,3); imshow(BW2, []); title('canny');

BW = edge(image, 'log', 0.5, 0.4);
BW2 = edge(image, 'canny', 0.4, 0.1);

subplot(2,3,4); imshow(image, []); title('oryginal');
subplot(2,3,5); imshow(BW, []); title('log');
subplot(2,3,6); imshow(BW2, []); title('canny');

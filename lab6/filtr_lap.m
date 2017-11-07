clearvars; close all; clc;
image = imread('moon.bmp');

M = [0 1 0; 1 -4 1; 0 1 0];
M = M / 9;

figure(1);
subplot(2,3,1); imshow(image);

convScaled = conv2(double(image), M, 'same') + 128;
subplot(2,3,2); imshow(convScaled, []);

convAbs = abs( conv2(double(image), M, 'same') );
subplot(2,3,3); imshow(convAbs, []);

convLap = uint8(conv2(double(image), double(fspecial('laplacian')), 'same'));
subplot(2,3,4); imshow(convLap, []);

subplot(2,3,5); imshow(image + convLap, []);

%todo: find bug and finish

imshow(image);
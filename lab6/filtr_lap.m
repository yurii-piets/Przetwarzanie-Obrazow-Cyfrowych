clearvars; close all; clc;
image = imread('moon.bmp');

M = [0 1 0; 1 -4 1; 0 1 0];
M = M / 9;

%scalowanie
subplot(3,4,1); imshow(image); title('oryginal');

convScaled = uint8(conv2(double(image), M, 'same')) + 128;
subplot(3,4,2); imshow(convScaled, []); title('skalowanie');

subplot(3,4,3); imshow(image + convScaled, []); title('suma');
subplot(3,4,4); imshow(image - convScaled, []); title('roznica');

%modul
subplot(3,4,5); imshow(image); title('oryginal');

convAbs = uint8(abs(conv2(double(image), M, 'same')));
subplot(3,4,6); imshow(convAbs, []); title('abs');

subplot(3,4,7); imshow(image + convAbs, []); title('suma');
subplot(3,4,8); imshow(image - convAbs, []); title('roznica');

%laplacian
subplot(3,4,9); imshow(image); title('oryginal');

convLap = uint8(conv2(double(image), double(fspecial('laplacian')), 'same'));
subplot(3,4,10); imshow(convLap, []); title('M - laplacian');

subplot(3,4,11); imshow(image + convLap, []); title('suma');
subplot(3,4,12); imshow(image - convLap, []); title('roznica');
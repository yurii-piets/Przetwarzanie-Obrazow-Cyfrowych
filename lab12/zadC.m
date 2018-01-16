close all; clearvars; clc;

image = imread('kolo.bmp');
fft2V = fft2(image);
shift = fftshift(fft2V);
odw = ifftshift(shift);
odw_odw = uint8(ifft2(odw));

subplot(1,3,1); imshow(image);title('oryginal');
subplot(1,3,2); imshow(odw);title('po ifftshift');
subplot(1,3,3); imshow(odw_odw);title('po ifft2');

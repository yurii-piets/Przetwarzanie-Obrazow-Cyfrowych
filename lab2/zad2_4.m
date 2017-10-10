clearvars; close all; clc;
bmp512 = imread('lena.bmp');

bmp256 = imresize(bmp512, 0.5);
bmp128 = imresize(bmp512, 0.25);
bmp64 = imresize(bmp512, 0.125);

imshow(bmp128,'InitialMagnification', 400);
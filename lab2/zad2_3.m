clearvars; close all; clc;

bmp = imread('lena.bmp');
nBmp = imresize(bmp, 1.5);

imshow(nBmp);
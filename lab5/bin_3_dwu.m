clearvars; close all; clc;

obraz = imread('bart.bmp');

progDolny = 189;
progGorny = 209;

obrazBW = obraz > progDolny & obraz < progGorny;
obrazBW = uint8(obrazBW);
obrazBW = obrazBW * 255;

figure(1);
subplot(1,3,1); imshow(obraz);
subplot(1,3,2); imhist(obraz);
subplot(1,3,3); imshow(obrazBW);
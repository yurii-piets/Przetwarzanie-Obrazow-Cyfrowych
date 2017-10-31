clearvars; close all; clc;

obraz = imread('bart.bmp');

progDolny = 0; %todo
progGorny = 256; %todo

obrazBW = obraz > progDolny & obraz < progGorny;
obrazBW = uint8(obrazBW);

figure(1);
subplot(1,3,1); imshow(obraz);
subplot(1,3,2); imhist(obraz);
subplot(1,3,3); imshow(obrazBW);
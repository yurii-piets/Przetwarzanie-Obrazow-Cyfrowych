clearvars; close all; clc;

figure(1);
phobos = imread('phobos.bmp');
subplot(1,2,1);imshow(phobos);
subplot(1,2,2);histeq(phobos); 

figure(2);
load histogramZadany;
obraz = histeq(phobos, histogramZadany);

subplot(1,3,1); plot(histogramZadany);
subplot(1,3,2); imshow(obraz);
subplot(1,3,3); imhist(obraz); 


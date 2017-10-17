clearvars; close all; clc;

kolo = imread('kolo.bmp');
bKolo = boolean(kolo);

kwadrat = imread('kwadrat.bmp');
bkwadrat = boolean(kwadrat);

figure(1);
imshow(bKolo);

figure(2);
imshow(bkwadrat);

nbKolo =~bKolo;
figure(3);
imshow(nbKolo);

andKoloKw = bKolo & bkwadrat;
figure(4);
imshow(andKoloKw);

orKoloKw = bKolo | bkwadrat;
figure(5);
imshow(orKoloKw);

xorLenaKw = xor(bKolo, bkwadrat);
figure(6);
imshow(xorLenaKw);



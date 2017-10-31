clearvars; close all; clc;

%coins = imread('coins.png');
%coins = imread('tekst.bmp');
%coins = imread('obiekty.bmp');
coins = imread('katalog.bmp');

%2
figure(1);
subplot(1,2,1); imshow(coins);
subplot(1,2,2); imhist(coins);

%3
bCoins = im2bw(coins, 80/255);
figure(2);
subplot(1,2,1); imshow(coins);
subplot(1,2,2); imshow(bCoins);

%4
figura = imread('figura.png');
figura2 = imread('figura2.png');
figura3 = imread('figura3.png');

bFigura = im2bw(figura, 130 / 255);
bFigura3 = im2bw(figura3, 130 / 255);

figure(3);
subplot(1,2,1); imshow(figura);
subplot(1,2,2); imhist(figura);

figure(4);
subplot(1,3,1); imshow(figura2);
subplot(1,3,2); imhist(figura2);
subplot(1,3,3); imshow(bFigura);

figure(5);
subplot(1,3,1); imshow(figura3);
subplot(1,3,2); imhist(figura3);
subplot(1,3,3); imshow(bFigura3);

%5
figure(6);
subplot(2,2,1); imshow(coins); title('original');
ots = graythresh(coins);
kittler = clusterKittler(coins);
yen = entropyYen(coins);
subplot(2,2,2); imshow(im2bw(coins, ots)); title(['ots: ', num2str(ots*255)]);
subplot(2,2,3); imshow(im2bw(coins, kittler/ 255));  title(['kittler: ', num2str(kittler)]);
subplot(2,2,4); imshow(im2bw(coins, yen / 255)); title(['yen: ', num2str(yen)]);




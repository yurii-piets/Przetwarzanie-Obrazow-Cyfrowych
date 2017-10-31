clearvars; close all; clc;

%1
figure(1);
lenaRGB = imread('lenaRGB.bmp');
imshow(lenaRGB);

lenaR = lenaRGB(:,:,1);
lenaG = lenaRGB(:,:,2);
lenaB = lenaRGB(:,:,3);

figure(2);
subplot(1,3,1); imhist(lenaR);
subplot(1,3,2); imhist(lenaG);
subplot(1,3,3); imhist(lenaB);

%2
lenaReq = histeq(lenaR);
lenaGeq = histeq(lenaG);
lenaBeq = histeq(lenaB);

lenaEQ = lenaRGB;
lenaEQ(:,:,1) = lenaReq;
lenaEQ(:,:,2) = lenaGeq;
lenaEQ(:,:,3) = lenaBeq;

figure(3);
subplot(1,2,1); imshow(lenaRGB);
subplot(1,2,2); imshow(lenaEQ);

%3 - hsv
lenaHSV = rgb2hsv(imread('lenaRGB.bmp'));
lenaV = lenaHSV(:,:,3);
lenaVeq = histeq(lenaV);

lenaEQ = lenaHSV;
lenaEQ(:,:,3) = lenaVeq;

figure(4);
subplot(1,2,1); imshow(lenaRGB);
subplot(1,2,2); imshow(hsv2rgb(lenaEQ));

%4 - jezioro - histeq
jezioroRGB = imread('jezioro.jpg');

jezioroR = jezioroRGB(:,:,1);
jezioroG = jezioroRGB(:,:,2);
jezioroB = jezioroRGB(:,:,3);

jezioroReq = histeq(jezioroR);
jezioroGeq = histeq(jezioroG);
jezioroBeq = histeq(jezioroB);

jezioroEQ = jezioroRGB;
jezioroEQ(:,:,1) = jezioroReq;
jezioroEQ(:,:,2) = jezioroGeq;
jezioroEQ(:,:,3) = jezioroBeq;

%4 - jezioro - hsv
jezioroHSV = rgb2hsv(imread('jezioro.jpg'));
jezioroV = jezioroHSV(:,:,3);
jezioroVeq = histeq(jezioroV);

jezioroEQ2 = jezioroHSV;
jezioroEQ2(:,:,3) = jezioroVeq;

figure(5);
subplot(1,3,1); imshow(jezioroRGB);
subplot(1,3,2); imshow(hsv2rgb(jezioroEQ2));
subplot(1,3,3); imshow(jezioroEQ);


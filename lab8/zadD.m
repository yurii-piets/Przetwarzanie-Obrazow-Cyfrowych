clearvars; close all; clc;

image = imread('calculator.bmp');
SE = ones(1,71);

%2,3,4
eroded = imerode(image, SE);
recon = imreconstruct(eroded, image); %to jest obraz tla
diff = imabsdiff(image,recon);
subplot(1,4,1); imshow(image, []); title('oryginal');
subplot(1,4,2); imshow(diff, []); title('imabsdiff oryg i recon');

%5
SE2 = ones(1,11);
erodedPion = imerode(diff, SE2);
reconPion = imreconstruct(erodedPion, image);
subplot(1,4,3); imshow(reconPion, []); title('erodedPion');

dil = imdilate(reconPion, ones(1,21));
reconDil = imreconstruct(dil, diff);
subplot(1,4,4); imshow(reconDil, []); title('dilat');

%do porownania
figure;
subplot(2,2,1); imshow(recon, []); title('reconstructed');%do por
subplot(2,2,2); imshow(imopen(image,SE), []); title('klasyczne');%do por

subplot(2,2,3); imshow(diff, []); title('imabsdiff oryg i recon');%do por
subplot(2,2,4); imshow(imtophat(image, SE), []); title('tophat');%do por
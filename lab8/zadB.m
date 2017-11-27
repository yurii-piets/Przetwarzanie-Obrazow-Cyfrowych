clearvars; close all; clc;

figure;
%scienianie
finger = imread('fingerprint.bmp');

BW2 = bwmorph(finger, 'thin');
subplot(2,3,1); imshow(finger, []); title('oryginal');
subplot(2,3,2); imshow(BW2, []); title('scienianie');

%szkieletyzcja

BW3 = bwmorph(finger, 'skel', Inf);
subplot(2,3,3); imshow(BW3, []); title('szkieletyzcja - skel');
subplot(2,3,4); imshow(bwmorph(finger, 'thin'), []); title('szkieletyzcja - thin');
subplot(2,3,5); imshow(bwmorph(finger, 'thin',2 ), []); title('szkieletyzcja - thin - 2');
subplot(2,3,6); imshow(bwmorph(finger, 'thin', Inf), []); title('szkieletyzcja - thin - Inf');

%otwarcie przez rekonstrukcje
figure;
textBmp = imread('text.bmp');
SE = ones(51,1);
open = imopen(textBmp, SE);
subplot(1,3,1); imshow(textBmp, []); title('oryginal');
subplot(1,3,2); imshow(open, []); title('otwarcie(51,1)');
subplot(1,3,3); imshow(imreconstruct(imerode(textBmp, SE), textBmp)); title('imreconstruct()')

%wypelnianie dziur
figure;
subplot(1,2,1); imshow(textBmp, []); title('oryginal');
subplot(1,2,2); imshow(imfill(textBmp, 'holes'), []); title('imfill()');

%czyszczenie brzegu
figure;
subplot(1,2,1); imshow(textBmp, []); title('oryginal');
subplot(1,2,2); imshow(imclearborder(textBmp), []); title('imclearborder()');




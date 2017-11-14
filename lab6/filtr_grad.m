clearvars; close all; clc;
image = imread('kw.bmp');

load maskiPP;

figure(1);
%Robertsa
convR1 = conv2(double(image), R1,'same');
convR2 = conv2(double(image), R2,'same');
subplot(3,4,1); imshow(convR1 + 128, []);  title('R1 +128');
subplot(3,4,2); imshow(convR2 + 1128, []); title('R2 +128');
subplot(3,4,3); imshow(abs(convR1) + 128, []);  title('R1 abs');
subplot(3,4,4); imshow(abs(convR2), []); title('R2 abs');

%Prewitta
convP1 = conv2(double(image), P1,'same');
convP2 = conv2(double(image), P2,'same');
subplot(3,4,5); imshow(convP1 + 128, []);  title('P1 +128');
subplot(3,4,6); imshow(convP2 + 1128, []); title('P2 +128');
subplot(3,4,7); imshow(abs(convP1) + 128, []);  title('P1 abs');
subplot(3,4,8); imshow(abs(convP2), []); title('P2 abs');

%Sobela
subplot(3,4,9); imshow(image); title('oryginal');
convS1 = conv2(double(image), S1,'same');
convS2 = conv2(double(image), S2,'same');
subplot(3,4,9); imshow(convS1 + 128, []);  title('S1 +128');
subplot(3,4,10); imshow(convS2 + 1128, []); title('S2 +128');
subplot(3,4,11); imshow(abs(convS1) + 128, []);  title('S1 abs');
subplot(3,4,12); imshow(abs(convS2), []); title('S2 abs');

%kombinowanie
figure(2);
subplot(1,3,1); imshow(image); title('oryginal');
O2 = sqrt(convS1.^2 + convS2.^2);
OM = abs(convS1) + abs(convS2);
subplot(1,3,2); imshow(O2,[]); title('pierw. kw.');
subplot(1,3,3); imshow(OM,[]); title('modul');
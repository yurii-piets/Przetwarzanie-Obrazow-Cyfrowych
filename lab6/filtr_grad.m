clearvars; close all; clc;
image = imread('kw.bmp');

load maskiPP;

figure(1);
%Robertsa
subplot(3,5,1); imshow(image); title('oryginal');
convR1 = uint8(conv2(image, R1,'same'));
convR2 = uint8(conv2(image, R2,'same'));
subplot(3,5,2); imshow(convR1);  title('R1');
subplot(3,5,3); imshow(convR2); title('R2');
subplot(3,5,4); imshow(image + convR1 + convR2, []); title('suma');
subplot(3,5,5); imshow(image - convR1 - convR2, []); title('roznica');

%Prewitta
subplot(3,5,6); imshow(image); title('oryginal');
convP1 = uint8(conv2(image, P1,'same'));
convP2 = uint8(conv2(image, P2,'same'));
subplot(3,5,7); imshow(convP1);  title('P1');
subplot(3,5,8); imshow(convP2); title('P2');
subplot(3,5,9); imshow(image + convP1 + convP2, []); title('suma');
subplot(3,5,10); imshow(image - convP1 - convP2, []); title('roznica');

%Sobela
subplot(3,5,11); imshow(image); title('oryginal');
convS1 = uint8(conv2(image, S1,'same'));
convS2 = uint8(conv2(image, S2,'same'));
subplot(3,5,12); imshow(convS1);  title('S1');
subplot(3,5,13); imshow(convS2); title('S2');
subplot(3,5,14); imshow(image + convS1 + convS2, []); title('suma');
subplot(3,5,15); imshow(image - convS1 - convS2, []); title('roznica');

figure(2);
subplot(1,3,1); imshow(image); title('oryginal');
O2 = sqrt(double(convS1.^2 + convS2.^2));
OM = abs(convS1) + abs(convS2);
subplot(1,3,2); imshow(O2); title('pierw. kw.');
subplot(1,3,3); imshow(OM); title('modul');
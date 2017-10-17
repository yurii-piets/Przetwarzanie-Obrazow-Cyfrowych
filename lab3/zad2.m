clearvars; close all; clc;

lena = imread('lena.bmp');
jet = imread('jet.bmp');

sum = imadd(lena, jet, 'uint16');
figure(1);
title('Sum');
imshow(sum,[]);

figure(2);
title('Linear combination');
linComb = imlincomb(1, jet, 1, lena);
imshow(linComb, []);

figure(3);
title('Diff');
lena16 = int16(lena);
jet16 = int16(jet);
sub = imsubtract(lena16, jet16);
imshow(sub, []);

figure(4);
title('Mod from diff');
imshow(imabsdiff(lena,jet));

figure(5);
title('Mult by scalar');
mul = immultiply(lena, 0.5);
imshow(mul);


figure(6);
title('Mult by mask');
mask = boolean(imread('kolo.bmp'));
mulMask = immultiply(lena, mask);
imshow(mulMask);

figure(7);
neg = imcomplement(lena);
imshow(neg);



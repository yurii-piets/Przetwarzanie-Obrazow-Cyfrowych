close all; clearvars; clc;

%transalate - kwadrat
image = imread('kwadrat.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imtranslate(image, [30 30]); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,1); imshow(logA,[]); title('amplituda');
subplot(4,4,2); imshow(faza,[]); title('faza');
subplot(4,4,3); imshow(logACh,[]); title('amplituda - tr');
subplot(4,4,4); imshow(fazaCh,[]); title('faza - tr');

%translate - kwaratT.bmp
image = imread('kwadratT.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imtranslate(image, [30 30]); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,5); imshow(logA,[]); title('amplituda');
subplot(4,4,6); imshow(faza,[]); title('faza');
subplot(4,4,7); imshow(logACh,[]); title('amplituda - tr');
subplot(4,4,8); imshow(fazaCh,[]); title('faza - tr');

% rotate - kwadrat.bmp
image = imread('kwadrat.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imrotate(image, 30); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,9); imshow(logA,[]); title('amplituda');
subplot(4,4,10); imshow(faza,[]); title('faza');
subplot(4,4,11); imshow(logACh,[]); title('amplituda - rt');
subplot(4,4,12); imshow(fazaCh,[]); title('faza - rt');

%rotate - kwadrat45.bmp
image = imread('kwadrat45.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imrotate(image, 30); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,13); imshow(logA,[]); title('amplituda');
subplot(4,4,14); imshow(faza,[]); title('faza');
subplot(4,4,15); imshow(logACh,[]); title('amplituda - rt');
subplot(4,4,16); imshow(fazaCh,[]); title('faza - rt');

figure;
%zmiana rozm - kwadrat.bmp
image = imread('kwadrat.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imresize(image, [1080 1920]); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,1); imshow(logA,[]); title('amplituda');
subplot(4,4,2); imshow(faza,[]); title('faza');
subplot(4,4,3); imshow(logACh,[]); title('amplituda - re');
subplot(4,4,4); imshow(fazaCh,[]); title('faza - re');

%zmiana rozm - kwadratS.bmp
image = imread('kwadratS.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imresize(image, [1080 1920]); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,5); imshow(logA,[]); title('amplituda');
subplot(4,4,6); imshow(faza,[]); title('faza');
subplot(4,4,7); imshow(logACh,[]); title('amplituda - re');
subplot(4,4,8); imshow(fazaCh,[]); title('faza - re');

%kombinacja liniowa - kwadrat45.bmp
image = imread('kwadrat45.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imlincomb(5, image); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,9); imshow(logA,[]); title('amplituda');
subplot(4,4,10); imshow(faza,[]); title('faza');
subplot(4,4,11); imshow(logACh,[]); title('amplituda - re');
subplot(4,4,12); imshow(fazaCh,[]); title('faza - re');

%kombinacja liniowa - kwadratKL.bmp
image = imread('kwadrat45.bmp');
fft2V = fft2(image);
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

imageCh = imlincomb(5, image); 

fft2Ch = fft2(imageCh);
logACh = log10(abs(fft2Ch) + 1);
fazaCh = angle(fft2Ch .* (logACh > 0.001));

subplot(4,4,13); imshow(logA,[]); title('amplituda');
subplot(4,4,14); imshow(faza,[]); title('faza');
subplot(4,4,15); imshow(logACh,[]); title('amplituda - re');
subplot(4,4,16); imshow(fazaCh,[]); title('faza - re');


close all; clearvars; clc;

image = imread('lena.bmp');
fft2V = fftshift(fft2(image));
logA = log10(abs(fft2V) + 1);
faza = angle(fft2V .* (logA > 0.001));

subplot(1,3,1); imshow(image, []); title('oryginalny');
subplot(1,3,2); imshow(logA, []); title('amplituda');
subplot(1,3,3); imshow(faza, []); title('faza');

% 3 
%doln gor
[f1, f2] = freqspace(512, 'meshgrid');
r = sqrt(f1.^2 + f2.^2);
Hd = ones(512);
Hd( r > 0.95 | r < 0.05 ) = 0;

filtered = fft2V .* Hd;

shift = ifftshift(filtered);
ifft2V = ifft2(shift);

figure;
subplot(1,2,1); colormap(jet(64)); mesh(f1,f2,Hd);
subplot(1,2,2); imshow(ifft2V);

%gor
Hd = ones(512);
Hd( r < 0.1 ) = 0;

filtered = fft2V .* Hd;

shift = ifftshift(filtered);
ifft2V = ifft2(shift);

figure;
subplot(1,2,1); colormap(jet(64)); mesh(f1,f2,Hd);
subplot(1,2,2); imshow(ifft2V);

%dol
Hd = ones(512);
Hd( r > 0.2 ) = 0;

filtered = fft2V .* Hd;

shift = ifftshift(filtered);
ifft2V = ifft2(shift);

figure; 
subplot(1,2,1); colormap(jet(64)); mesh(f1, f2, Hd);
subplot(1,2,2); imshow(ifft2V,[]);

% 8
h = fwind1(Hd, hanning(21));
[H, f1, f2] = freqz2(h, 512, 512);

filtered = fft2V .* H;

iffsh = ifftshift(filtered);
ifft2V = ifft2(iffsh);

figure;
subplot(1,2,1); mesh(f1, f2, H);
subplot(1,2,2); imshow(ifft2V,[]);
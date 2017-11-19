clearvars; close all; clc;
load MR_data;

figure;
subplot(1,3,1); imshow(I_noisy1, []); title('I_noisy1');
subplot(1,3,2); imshow(convolution(I_noisy1, [3 3]), []); title('convolution');
subplot(1,3,3); imshow(bilateral(I_noisy1, [3 3]), []); title('bilateral');

figure;
subplot(1,3,1); imshow(I_noisy2, []); title('I_noisy2');
subplot(1,3,2); imshow(convolution(I_noisy2, [3 3]), []); title('convolution');
subplot(1,3,3); imshow(bilateral(I_noisy2, [3 3]), []); title('bilateral');

figure;
subplot(1,3,1); imshow(I_noisy3, []); title('I_noisy3');
subplot(1,3,2); imshow(convolution(I_noisy3, [3 3]), []); title('convolution');
subplot(1,3,3); imshow(bilateral(I_noisy3, [3 3]), []); title('bilateral');

figure;
subplot(1,3,1); imshow(I_noisy4, []); title('I_noisy4');
subplot(1,3,2); imshow(convolution(I_noisy4, [3 3]), []); title('convolution');
subplot(1,3,3); imshow(bilateral(I_noisy4, [3 3]), []); title('bilateral');

figure;
subplot(1,3,1); imshow(I_noisefree, []); title('I_noisefree');
subplot(1,3,2); imshow(convolution(I_noisefree, [3 3]), []); title('convolution');
subplot(1,3,3); imshow(bilateral(I_noisefree, [3 3]), []); title('bilateral');
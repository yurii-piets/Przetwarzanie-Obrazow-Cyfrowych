clearvars; close all; clc;
load MR_data;

subplot(1,3,1); imshow(I_noisy1, []); title('oryginal');
subplot(1,3,2); imshow(convolution(I_noisy1, [3 3]), []); title('convolution');
subplot(1,3,3); imshow(bilateral(I_noisy1, [3 3]), []); title('bilateral');
clearvars; close all; clc;
load MR_data;

subplot(1,2,1); imshow(I_noisy1, []); title('oryginal');
subplot(1,2,2); imshow(convolution(I_noisy1, [3 3]), []); title('convolution');
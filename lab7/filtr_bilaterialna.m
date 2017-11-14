clearvars; close all; clc;
load MR_data;

suplot(1,2,1); imshow(I_noisy1, []); title('oryginal');
suplot(1,2,2); imshow(convolution(), []); title('convolution');
%todo
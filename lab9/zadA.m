clearvars; close all; clc;

image = zeros(11, 11);
image(4,4) = 1;
image(10,10) = 1;
image(10,3) = 1;

[H, theta, ro] = hough(image, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

imshow(H, []);
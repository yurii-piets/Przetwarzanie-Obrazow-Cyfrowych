clearvars; close all; clc;

image = zeros(11, 11);
image(4,4) = 1;
image(1,6) = 1;
image(10,3) = 1;

[H, theta, rho] = hough(image, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure;
imshow(H, []);

X = 248;
Y = 185;

t = theta(X);
r = rho(Y);

xx = 0:0.1:10;
yy = ((r-xx*cosd(t))/sind(t));

figure;
imshow(image);
hold on;
plot(xx+1, yy+1);
hold off;
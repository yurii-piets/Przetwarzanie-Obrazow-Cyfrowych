clearvars; close all; clc;

image = zeros(11, 11);
image(4,4) = 1;
image(1,6) = 1;
image(10,3) = 1;

[H, theta, ro] = hough(image, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

imshow(H, []);

X = 182;
Y = 193;

t = theta(X);
r = ro(Y);

xx = 0:0.1:10;
yy = ((r-xx*cos(t))/sin(t));

imshow(image);
hold on;
plot(xx+1, yy+1);
hold off;
clearvars; close all; clc;

image = imread('kwadraty.png');

BW = edge(image, 'canny');
[H, theta, rho] = hough(image, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure;
subplot(1,3,1); imshow(image, []); title('oryginal');
subplot(1,3,2); imshow(BW, []); title('canny')
subplot(1,3,3); imshow(H, []); title('H');

peaks = houghpeaks(H, 8);

figure;
subplot(1,2,1); plot(H); title('Kwadraty Hough H');
subplot(1,2,2); plot(peaks); title('Kwadraty Hough Peaks');

lines = houghlines(image, theta, rho, peaks, 'FillGap', 5, 'MinLength', 7);

figure;
hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');
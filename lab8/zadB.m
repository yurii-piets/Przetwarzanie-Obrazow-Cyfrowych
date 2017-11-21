clearvars; close all; clc;

%scienianie
finger = imread('fingerprint.bmp');

BW2 = bwmorph(finger, 'thin');
subplot(1,3,1); imshow(finger, []); title('oryginal');
subplot(1,3,2); imshow(BW2, []); title('scienianie');

%szkieletyzcja

BW3 = bwmorph(finger, 'skel', Inf);
subplot(1,3,3); imshow(BW3, []); title('szkieletyzcja');

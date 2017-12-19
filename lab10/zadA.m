close all; clearvars; clc;

image = imread('knee.png');
image = double(image);

x = 280;
y = 320;

[n m] = size(image);

visited = zeros(n, m);
segmented = zeros(n, m);
stack = zeros(10000, 2);
iStack = 1;

stack(iStack, :) = [x, y];
visited(x, y) = 1;
segmented(x, y) = image(x, y);

BRD = 40;
mV = image(x, y);
nS = 1;

while iStack > 0
    x = stack(iStack, 1);
    y = stack(iStack, 2);
    iStack = iStack - 1;
    nS = nS + 1;
    mV = (mV * (nS - 1) + image(x, y)) / nS;
    
    if x <= 1 || x >= n
        continue;
    end;
    
    if y <= 1 || y >= m
        continue;
    end;
    
    brightness = image(x, y);
    
    for i = -1:1
        for j = -1:1
            if i == 0 && j == 0
                continue;
            end;
            
            if visited(x+i, y+j) == 1
                continue;
            end;
            
            visited(x+i, y+j) = 1;
            
            brightnessLocal = image(x+i, y+j);
            diff = abs(mV - brightnessLocal);
            
            if diff < BRD
                segmented(x+i, y+j) = image(x+i, y+j);
                iStack = iStack + 1;
                stack(iStack, 1) = x+i;
                stack(iStack, 2) = y+j;
            end
        end;
    end
    
end;

h = fspecial('gaussian', [3 3], 4);
filtered = imfilter(segmented, h);

subplot(1,4,1); imshow(image, []); title('oryginal');
subplot(1,4,2); imshow(visited, []); title('visited');
subplot(1,4,3); imshow(segmented, []); title('segmented');
subplot(1,4,4); imshow(filtered, []); title('filtered');
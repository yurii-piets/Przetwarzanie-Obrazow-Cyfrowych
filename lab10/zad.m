clearvars; close all; clc;

BRD = 4;
image = imread('knee.png');
image = im2double(image);

%[x y] = floor(ginput(1));

x = 330;
y = 205;

[n, m] = size(image);

visited = zeros(n, m);
segmented = zeros(n, m);
stack = zeros(10000,2);
iStack = 1;

stack(iStack, :) = [x y];
visited(x, y) = 1;
segmented(x, y) = image(x,y);

while iStack ~= 0
    x = stack(iStack, 1);
    y = stack(iStack, 2);
    iStack = iStack - 1;
    
    if(~(x - 1 <= 0 || x + 1 > n || y - 1 <= 0 || y + 1 > m))
       segmented(x, y) = image(x,y);
       brightness = image(x,y); 
       
        for i=-1:1
            for j=-1:1
                if( ~( i == 0 && j == 0) )
                    brightnessNeighbour = image(x+i, y+j);
                    diff = abs(brightness-brightnessNeighbour);
                    
                    if (visited(x+i,y+j) == 0 && diff < BRD)
                        iStack = iStack + 1;
                        stack(iStack, :) = [x y];
                    end
                    
                    visited(x+i, y+j) = 1;
                end
            end
        end
        
        visited(x, y) = 1;
    end;
    
end;

figure;
subplot(1,3,1); imshow(image, []); title('oryginal');
subplot(1,3,2); imshow(segmented, []); title('segmented');
subplot(1,3,3); imshow(visited, []); title('visited');
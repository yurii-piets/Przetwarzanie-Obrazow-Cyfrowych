%TODO find bug
close all; clearvars; clc;

image = imread('ccl1.png');

[YY, XX] = size(image);
imageFinal = image;

L = 1;

for x=2:YY-1
    for y=2:XX-1
        
        if image(x, y) == 0
            continue;
        end;
        
        sasiedzi = [image(x-1, y-1) image(x-1, y) image(x-1, y+1) image(x, y-1)];
        suma = sum(sasiedzi);
        
        if suma == 0
            imageFinal(x,y) = L;
            L = L + 1;
        elseif suma > 0
            sasiedzi = nonzeros(sasiedzi);
            maxV = max(sasiedzi);
            minV = min(sasiedzi);
            
            if minV == maxV
                imageFinal(x,y) = maxV;
            else
                imageFinal(x,y) = minV;
            end;
        end;
        
    end;
end;

subplot(1,3,1); imshow(image, []); title('oryginal');
subplot(1,3,2); imshow(label2rgb(imageFinal)); title('final');
subplot(1,3,3); imshow(imread('ccl1Result.png'), []); title('ccl1Result.png');
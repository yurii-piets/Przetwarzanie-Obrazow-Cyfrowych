close all; clearvars; clc;

image = imread('ccl1.png');

[YY, XX] = size(image);
imageFinal = image;

L = 1;
N = 100;
id = 1:N;
lut = zeros(N);

for x=2:YY-1
    for y=2:XX-1
        
        if image(x, y) == 0
            continue;
        end;
        
            sasiedzi = [imageFinal(x-1, y-1) imageFinal(x-1, y) imageFinal(x-1, y+1) imageFinal(x, y-1)];
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
                    id = quick_union(id, minV, maxV);
                end;
            end;
    end;
end;

subplot(1,3,1); imshow(image, []); title('oryginal');
subplot(1,3,2); imshow(label2rgb(imageFinal)); title('final');
subplot(1,3,3); imshow(imread('ccl1Result.png'), []); title('ccl1Result.png');

lut = zeros(N,1);

for i = 1:N
    lut(i) = quick_root(id,i);
end

for x=2:YY-1
    for y=2:XX-1
        if imageFinal(x,y) > 0
            imageFinal(x,y) = lut(imageFinal(x,y));
        end
    end
end

imshow(label2rgb(imageFinal));

subplot(1,2,1); imshow(image, []); title('oryginal');
subplot(1,2,2); imshow(label2rgb(imageFinal)); title('final');
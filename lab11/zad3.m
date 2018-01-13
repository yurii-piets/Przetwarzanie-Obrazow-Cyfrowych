close all; clearvars; clc;

image = imread('shapes.png');
L = bwlabel(image, 4);
wsp = obliczWspolczynniki(L);

r = regionprops(L, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}',num2str(i)]);
end;

[YY,XX] = size(image);
for x=1:XX
    for y=1:YY
        piksel = L(x,y);
        if piksel ~= 0 && (wsp(piksel, 3) > 5.0 || wsp(piksel, 3) < 4.8)
            L(x,y) = 0;
        end;
    end;
end;

subplot(1,2,1); imshow(image, []); title('oryginal');
subplot(1,2,2); imshow(L, []); title('labeled');

%real
image = imread('shapesReal.png');

imageFinal = image;
imageFinal = rgb2gray(imageFinal);
imageFinal = imerode(imageFinal, strel('disk', 5));
imageFinal = im2bw(imageFinal, 0.2);
[XX, YY] = size(imageFinal);

for x=1:XX
    for y=1:YY
        if imageFinal(x,y) == 0
            imageFinal(x,y) = 1;
        else
            imageFinal(x,y) = 0;
        end;
    end;
end;

L = bwlabel(imageFinal, 4);
wsp = obliczWspolczynniki(L);

r = regionprops(L, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end;

[XX,YY] = size(imageFinal);
for x=1:XX
    for y=1:YY
        piksel = L(x,y);
        if piksel ~= 0 && (wsp(piksel, 2) > 0.7 || wsp(piksel, 2) < 0.6 || wsp(piksel, 3) < 5)
            L(x,y) = 0;
        end;
    end;
end;

figure;
subplot(1,3,1); imshow(image, []); title('oryginal');
subplot(1,3,2); imshow(L, []); title('final');
subplot(1,3,3); imshow(imageFinal, []); title('labeled');

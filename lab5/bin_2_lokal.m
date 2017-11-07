clearvars; close all; clc;

obraz = imread('katalog.bmp');
obrazBW = obraz;

[X,Y] = size(obraz);
W2 = 15;
R = 128;
k = 0.15;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i, j, W2, obraz, X, Y);
        stddev = stddevLT(i, j, W2, obraz, mean, X, Y);
        T = mean*(1+k*((stddev/R)-1)); 
        
        if obraz(i,j) > T
            obrazBW(i,j) = 255;
        else 
            obrazBW(i,j) = 0;
        end;
    end;
end;

figure(1);
subplot(1,3,1); imshow(obraz);
subplot(1,3,2); imshow(obrazBW);
subplot(1,3,3); imhist(obraz);
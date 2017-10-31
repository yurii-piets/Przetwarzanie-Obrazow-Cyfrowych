clearvars; close all; clc;

obraz = imread('rice.png');
obrazBW = obraz;

[X,Y] = size(obraz);
W2 = 4;
B = 125;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,W2,obraz,X,Y);
        if (mean > B)
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

%todo
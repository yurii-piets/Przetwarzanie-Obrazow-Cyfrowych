clearvars; close all; clc;

parrotBmp = imread('parrot.bmp');
figure(1);
imshow(parrotBmp);
xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(parrotBmp);

nXX = round(XX * xReScale);
nYY = round(YY * yReScale);

nParrotBmp = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;

for ii=0:nXX-1
    for jj=0:nYY-1   
        i = round(ii * xStep);
        j = round(jj * yStep);
        if i > XX -1
            i = XX -1;
        end;
        if j > YY - 1
            j = YY -1;
        end
        nParrotBmp(jj+1,ii+1) = parrotBmp(j+1, i+1); 
    end;
end;

figure(2);
imshow(nParrotBmp);
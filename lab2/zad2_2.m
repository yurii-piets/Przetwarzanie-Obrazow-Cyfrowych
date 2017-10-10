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
        i = floor(ii * xStep);
        j = floor(jj * yStep);
        
        if i <= 0
            i = 1;
        end;
        
        if j <= 0
            j = 1;
        end;
        
        if i > XX - 1
            i = XX - 1;
        end
       
        if j > YY - 1
            j = YY - 1;
        end
        
        fA = double(parrotBmp(i,j));
        fB = double(parrotBmp(i+1,j));
        fC = double(parrotBmp(i+1,j+1));
        fD = double(parrotBmp(i,j+1));
        
        fABCD = [1-i, i] * [fA, fD; fB, fC] * [1-j; j];
        
        nParrotBmp(jj+1,ii+1) = fABCD;
    end;
end;

figure(2);
imshow(nParrotBmp);

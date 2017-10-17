clearvars; close all; clc;

parrotBmp = imread('parrot.bmp');
xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(parrotBmp);

nXX = round(XX * xReScale);
nYY = round(YY * yReScale);

nParrotBmp = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;

dParrotBmp = double(parrotBmp);

for ii=0:nYY-1
    for jj=0:nXX-1
         i = floor(ii*yStep);
         j = floor(jj*xStep);
         
         a = ii*yStep - i;
         b = jj*xStep - j;
         
         if j > YY - 2
             j = YY - 2;
         end;
         
         if i > XX-2
             i = XX-2;
         end;
         
         FA = dParrotBmp(j+1,i+1);
         FB = dParrotBmp(j+2,i+1);
         FD = dParrotBmp(j+1,i+2);
         FC = dParrotBmp(j+2,i+2);
         
         FABCD = [1-a, a] *[FA,FD;FB,FC] * [1-b;b];
         
         nParrotBmp(jj+1,ii+1) = FABCD;
    end;
end;


figure;
imshow(parrotBmp);
figure;
imshow(nParrotBmp);
%subplot(1,2,1); imshow(parrotBmp); title('Original Img');
%subplot(1,2,2); imshow(nParrotBmp); title('New Img');

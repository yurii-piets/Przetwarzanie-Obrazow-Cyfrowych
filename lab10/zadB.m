close all; clearvars; clc;

global minimum;
global BRD;
global segRes;
global MRes;
global index;

image = imread('umbrella.png');
hsv = rgb2hsv(image);
hsv = double(hsv);
H = hsv(:,:,1);
[y, x] = size(H);

minimum = 2;
BRD = 0.05;
segRes = zeros(x,y);
MRes = zeros(x,y);
index = -1;

split(H, 1, 1, x, y);
i = 0;
while i <= index
    IB = segRes == i;
    if ~any(IB(:))
        i = i + 1;
        continue;
    end;
    
    [yF, xF] = find(IB,1,'first');
    
    dilate = imdilate(IB, strel('square', 3));
    maskDiff = imabsdiff(dilate, IB);
    maskMult = maskDiff .* segRes;
    uniqueV = unique( nonzeros(maskMult));
    
    joined = 0;
    for j = 1:numel(uniqueV);

        IBS = segRes == uniqueV(j);
        [yFS, xFS] = find(IBS, 1, 'first');

        colorDiff = abs(MRes(yF,xF) - MRes(yFS, xFS));

        if colorDiff < (5 / 255)
            segRes(IBS) = i;
            joined = 1;
        end;
    end;

    if joined == 0
        i = i+1;
    end;
    
end;

min = 33;
U = unique(segRes);
for i = 1:numel(U)
    C = segRes == U(i);
    if sum(C) < min
        segRes(C) = 0;
    end;
end;

for i = 1:numel(U)
    C = segRes == U(i);
    segRes(C) = i;
end;

img_segmented = label2rgb(segRes);
imageF = label2rgb(segRes);

subplot(1,3,1); imshow(image, []); title('original');
subplot(1,3,2); imshow(segRes, []); title('segRes');
subplot(1,3,3); imshow(imageF, []); title('result');

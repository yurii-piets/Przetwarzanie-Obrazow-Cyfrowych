function myLut( imgName, codec )
    img = imread(imgName);
    lutImg = intlut(img, codec);
    subplot(1,3,1); plot(codec);
    subplot(1,3,2); imshow(img); title('Original Img');
    subplot(1,3,3); imshow(lutImg); title('New Img');
end


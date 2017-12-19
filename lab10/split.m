function split(image, x1, y1, x2, y2)

    global minimum;
    global BRD;
    global segRes;
    global MRes;
    global index;
    
    imagePart = image(y1:y2,x1:x2);
    meanV = mean(imagePart(:));
    stdV = std(imagePart(:));
    
    if (stdV < BRD) || ((x2-x1) <= minimum)
        index = index + 1;
        segRes(y1:y2, x1:x2) = index;
        MRes(y1:y2,x1:x2) = meanV; 
    else
        x = floor((x2+x1)/2);
        y = floor((y2+y1)/2);
        split(image, x1, y1, x, y);
        split(image, x+1, y1, x2, y);
        split(image, x+1, y+1, x2, y2);
        split(image, x1, y+1, x, y2);
    end
end
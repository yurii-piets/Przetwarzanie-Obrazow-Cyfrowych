function dwuwym( imageName)
    image = imread(imageName);
    fft2V = fft2(image);

    fftshiftV = fftshift(fft2V);

    logA = log10(abs(fft2V) + 1);
    faza = angle(fft2V .* (logA > 0.001));
    
    figure;
    subplot(3,3,1); imshow(image, []); title('imageName - org.');
    subplot(3,3,2); imshow(fft2V); title('fft2');
    subplot(3,3,3); imshow(fftshiftV); title('fftshift');

    subplot(3,3,4); imshow(logA,[]); title('amplituda');
    subplot(3,3,5); imshow(faza,[]); title('faza');
    
    F1 = fft(image, [], 1);
    F2 = fft(F1, [], 2);

    logA2 = log10(abs(F2) + 1);
    faza2 = angle(F2 .* (logA2 > 0.001));
    
    subplot(3,3,7); imshow(logA2,[]); title('amplituda - F2');
    subplot(3,3,8); imshow(faza2,[]); title('faza - F2');
end


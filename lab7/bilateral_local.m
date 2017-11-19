function data_filtered = bilateral_local(data, local_window)

    h = fspecial('gaussian', local_window, 25);
    Nx = size(data, 2);
    
    Ncy = ceil(local_window(1)/2);
    Ncx = ceil(local_window(2)/2);
    
    ro = 3;
    
    for i = 1:Nx
        patch = reshape(data(:,i), local_window);

        [rows cols] = find(patch == patch);
        rows = reshape(rows, local_window);
        cols = reshape(cols, local_window);
        
        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2 );
        dist = dist.^h;
        absValue = abs(patch - patch(Ncy, Ncx));
        
        gamma = exp(((-1) * (absValue .* absValue)) / (2 * ro * ro));
        
        data_filtered(i) = sum(sum(dist .* gamma .* patch)) / sum(sum(dist .* gamma));
    
end


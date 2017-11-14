function data_filtered =  convolution_local(data, local_window)

    h = fspecial('gaussian', local_window, 25);
    [Nx Nc] = size(local_window);
    
    for i = 1:Nx
        patch = reshape(data(:,i), local_window);
        data_filtered = sum (sum(patch .* h));
    end
    %todo
end


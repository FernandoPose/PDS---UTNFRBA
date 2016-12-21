function [out] = FilterMedia(x,LengW)

    sizeX = length(x)/2;
    out   = zeros(1,sizeX);
    
    if sizeX < LengW
        LengW = sizeX;
    end
    
    for k = 1 : length(x)/2
        out(k) = mean(x(k:(k+LengW)));
    end
    out = out';
end
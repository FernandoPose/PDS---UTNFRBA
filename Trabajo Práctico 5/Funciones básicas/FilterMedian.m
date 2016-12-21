function [out] = FilterMedian(x,LengW,percentil)

    sizeX = length(x)/2;
    out   = zeros(sizeX,1);
    
    if sizeX < LengW
        LengW = sizeX;
    end
    
    for k = 1 : length(x)/2
        out(k) = mediana(x(k:(k+LengW)),percentil);
    end
end
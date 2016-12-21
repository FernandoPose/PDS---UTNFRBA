function [y] = mediana(x,percentil)

    xOrd = sort(x,'ascend');
    xOrd = round(xOrd);
    
    if percentil == 0
        y = xOrd(1);
    end 
    if percentil == 50
        if rem(length(xOrd),2) == 0
            y = (xOrd(end/2)+xOrd(end/2+1))/2;
        else
            y = xOrd(round(end/2));
        end
    else 
        if percentil == 100
            y = xOrd(end);
        else
            y = round(prctile(xOrd,percentil));
        end
    end  
end
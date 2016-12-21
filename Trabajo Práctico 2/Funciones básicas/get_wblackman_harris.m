%**
%	\fn     [output] = get_wblackman_harris(N)
%	\brief  Genera una ventana Blackman Harris
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_wblackman_harris(N)
    
    output = zeros(N,1);
    
    a0 = 0.35875;
    a1 = 0.48829;
    a2 = 0.14128;
    a3 = 0.01168;
    
    for n = 1:N
        output(n) = a0-a1*cos(2*pi*n/(N-1))+a2*cos(4*pi*n/(N-1))-a3*cos(6*pi*n/(N-1));
    end
end
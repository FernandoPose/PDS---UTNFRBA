%**
%	\fn     [output] = get_whann(N)
%	\brief  Genera una ventana Hann con signo "-"
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_whann(N)
    
    output = zeros(N,1);
    
    for n = 1:N
        output(n) = 0.5*(1-cos(2*pi*n/(N-1)));
    end
end


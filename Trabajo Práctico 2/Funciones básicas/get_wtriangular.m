%**
%	\fn     [output] = get_wtriangular(N)
%	\brief  Genera una ventana triangular
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_wtriangular(N)
    
    output = zeros(N,1);
    
    for n = 1:N
        output(n) = ((N+1)/2 - abs(n - (N-1)/2)) * 2/(N+1);
    end
end


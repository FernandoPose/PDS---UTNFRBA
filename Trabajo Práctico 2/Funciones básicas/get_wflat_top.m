%**
%	\fn     [output] = get_wflat_top(N)
%	\brief  Genera una ventana Flat-Top
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_wflat_top(N)
    
    output = zeros(N,1);
    
    a0 = 1;
    a1 = 1.93;
    a2 = 1.29;
    a3 = 0.388;
    a4 = 0.032;
    
    for n = 1:N
        output(n) = a0-a1*cos(2*pi*n/(N-1))+a2*cos(4*pi*n/(N-1))-a3*cos(6*pi*n/(N-1))+a4*cos(8*pi*n/(N-1));
    end
end
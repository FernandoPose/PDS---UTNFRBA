%% Ejercicio 1 - Código: Función Bartlett
%
%	\fn [output] = get_bartlett()
%	\brief Calcula con bartlett la DEP del vector intput
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.23
%**

function [output] = get_bartlett(input, nsector)
    
    L = floor(length(input)/nsector);
    output = zeros(1,length(input));
    n1 = 1;
    
    for i = 1:nsector
        output(1,n1:n1+L-1) = get_periodograma(input(1,n1:n1+L-1))/nsector;
        n1 = n1 + L;
    end;
end



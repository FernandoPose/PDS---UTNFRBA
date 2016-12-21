%% Ejercicio 1 - Código: Función Welch
%
%	\fn [output] = get_welch()
%	\brief Calcula con welch la DEP del vector intput
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.23
%**

function [output] = get_welch(input, L, over, window)

    if ( over >= 1) || (over < 0)
        error ('overlap is invalid');
    end
    
    n1 = 1;
    n0 = (1-over)*L;
    
    nsect = 1 + floor((length(input) - L)/n0);
    
    output = zeros(1,length(input));
    
    for i = 1: nsect
        output(1,n1:n1+L-1) = get_periodograma_modificada(input, window, n1, n1+L-1)/nsect;
        n1 = n1 + n0;
    end
end

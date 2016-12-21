%% Ejercicio 1 - Código: Función Periodograma modificada
%
%	\fn [output] = get_periodograma_modificada(intput,window, inicio, fin)
%	\brief Calcula el periograma de una señal ventaneada
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.23
%**

function [output] = get_periodograma_modificada(input, ventana, inicio, fin)
    
    input = input'; %traspongo la matriz

    if nargin == 2
        inicio = 1; 
        fin = length(input);
    end
    
    N = fin - inicio + 1;
    W = ones(N,1);
    
    if (ventana == 2)
        W = hamming(N);
        elseif (ventana == 3)
            W = hanning(N);
        elseif (ventana ==  4)
            W = bartlett(N);
        elseif (ventana == 5)
            W = blackman(N);
    end;
        
    x_window = input(inicio:fin).^W/norm(W); % Norma del vector.-
    output = N * get_periodograma(x_window);
    
end



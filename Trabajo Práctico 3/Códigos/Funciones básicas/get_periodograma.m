%% Ejercicio 1 - Código: Función Periodograma
%
%	\fn [output] = get_periodograma(intput, inicio, fin)
%	\brief Calcula con periograma la DEP del vector input
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.23
%**

function [output] = get_periodograma(input, inicio, fin)
    
    input = input'; %traspongo la matriz

    if nargin == 1
        inicio = 1; 
        fin = length(input);
    end;
    
    output = abs(fft(input(inicio:fin))).^2/(fin-inicio+1);
    output(1) = output(2);
end
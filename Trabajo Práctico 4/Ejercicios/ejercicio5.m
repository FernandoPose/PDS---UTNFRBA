% Diseñe el siguiente filtro pasa altos:
% fs = 10Hz
% fc = 20Hz
% As = 80dB
% Ab = 0.1dB

% Para las frecuencias de muestreo:
% fs1 = 250Hz
% fs2 = 500Hz
% fs3 = 1000Hz

% A) ¿Qué ocurre con la cantidad de coeficientes?
% B) Desde el punto de vista de la eficiencia computacional, ¿Cuál es el
%    más adecuado?
% C) Cómo implementaria la forma más eficiente si su sistema tiene un ADC
% cuya fs está fijada a 1000Hz

function [] = ejercicio5()
    
    load('Ejercicio5.mat');

    fc = 1;
    
    % Filtro Pasa Altos fc = 20Hz As = 80dB Ab = 0.1dB
    % Método: Equirriple. Fstop = 15 Fpass = 20
    % fs1 = 250Hz Coeficientes: 172 Retardo de grupo: 86
    
    fs = 250;
    fc = PlotRespImp5(HtPaA,fc,fs);
    
    % Filtro Pasa Altos fc = 20Hz As = 80dB Ab = 0.1dB
    % Método: Equirriple. Fstop = 15 Fpass = 20
    % fs1 = 500Hz Coeficientes: 342 Retardo de grupo: 171
    
    fs = 500;
    fc = PlotRespImp5(HtPaB,fc,fs);
    
    % Filtro Pasa Altos fc = 20Hz As = 80dB Ab = 0.1dB
    % Método: Equirriple. Fstop = 15 Fpass = 20
    % fs1 = 1000Hz Coeficientes: 684 Retardo de grupo: 342
    
    fs = 1000;
    fc = PlotRespImp5(HtPaC,fc,fs);

end

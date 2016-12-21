% Utilizando la herramienta fdatool, diseñe los siguientes filtros FIR
% pasa-bajos por el método de ventanas, con las siguientes frecuencias de
% corte:
% wc = 0.3 rad/s
% wc = 0.7 rad/s
% Para ventanas del tipo:
% Triangular
% Blackman-Harris
% Flat-top

% Para todos los casos la atenuacion requerida será de al menos 80dB. EL
% retardo de grupo debe ser un número entero. Obtenga la cantidad de
% coeficientes, el retardo de grupo y grafique la respuesta al impulso del
% filtro diseñado. Discuta los resultados e indique cuál es el diseño más
% conveniente.

% Ahora se agrega el requerimiento de que la banda de transición no puede
% superar los 0.1 rad/muestra. Para que los filtros diseñados operen a una
% fc1 = 300Hz y fc2 = 700Hz, de cuánto debería ser la frecuencia de
% muestreo. 

%Si se pretende ahora diseñar un nuevo par de filtros que operen
% a una fc1 = 30000Hz y fc2 = 70000Hz, ¿Qué debería cambiar en el sistema
% digital implementado hasta ahora? Discuta la estrategia adoptada si es
% útil para frecuencias arbitrariamente grandes.

function [] = ejercicio3()
    
    load('Ejercicio3.mat');
    
    fc = 1;
    
    %% Primera parte
    
    % Filtro Pasa Bajas wc = 0.3 rad/s Ventana: Triangular
    % Coeficientes: 3500 , Retardo de grupo: 1750.
    
    fc = PlotRespImp(HLpTrA,fc);
    
    % Filtro Pasa Bajas wc = 0.7 rad/s Ventana: Triangular
    % Coeficientes: 3500 , Retardo de grupo: 1750.
    
    fc = PlotRespImp(HLpTrB,fc);
    
    % Filtro Pasa Bajas wc = 0.3 rad/s Ventana: Blackman-Harris
    % Coeficientes: 100 , Retardo de grupo: 50.
    
    fc = PlotRespImp(HLpBhA,fc);
    
    % Filtro Pasa Bajas wc = 0.7 rad/s Ventana: Triangular
    % Coeficientes: 100 , Retardo de grupo: 50.
    
    fc = PlotRespImp(HLpBhB,fc);
    
    % Filtro Pasa Bajas wc = 0.3 rad/s Ventana: Flat-Top
    % Coeficientes: 100 , Retardo de grupo: 50.
    
    fc = PlotRespImp(HLpFtA,fc);
    
    % Filtro Pasa Bajas wc = 0.7 rad/s Ventana: Flat-Top
    % Coeficientes: 100 , Retardo de grupo: 50.
    
    fc = PlotRespImp(HLpFtB,fc);
    
    
    %% Segunda parte
    % Banda de transición no puede superar los 0.1 rad/muestra.
    
    % Filtro Pasa Bajas wc = 0.3 rad/s Ventana: Triangular
    % Coeficientes: 19000 , Retardo de grupo: 9000.
    
    fc = PlotRespImp(HLpTrAA,fc);
    
    % Filtro Pasa Bajas wc = 0.7 rad/s Ventana: Triangular
    % Coeficientes: 20000 , Retardo de grupo: 10000.

    fc = PlotRespImp(HLpTrBB,fc);
    
    % Filtro Pasa Bajas wc = 0.3 rad/s Ventana: Blackman-Harris
    % Coeficientes: 120 , Retardo de grupo: 60.
    
    fc = PlotRespImp(HLpBhAA,fc);
    
    % Filtro Pasa Bajas wc = 0.7 rad/s Ventana: Blackman-Harris
    % Coeficientes: 120 , Retardo de grupo: 60.
    
    fc = PlotRespImp(HLpBhBB,fc);
    
    % Filtro Pasa Bajas wc = 0.3 rad/s Ventana: Flat-Top
    % Coeficientes: 90 , Retardo de grupo: 45.
    
    fc = PlotRespImp(HLpFtAA,fc);
    
    % Filtro Pasa Bajas wc = 0.7 rad/s Ventana: Flat-Top
    % Coeficientes: 90 , Retardo de grupo: 45.
    
    fc = PlotRespImp(HLpFtBB,fc);
    
end

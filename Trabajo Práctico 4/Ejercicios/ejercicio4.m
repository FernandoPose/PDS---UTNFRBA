% Con la misma herramienta fdatool, diseñe los mismos filtros del punto
% anterior por medio del método equiripple (u ópticmo) y discuta las
% diferencias entre ambos métodos respecto a la facilidad de uso y del
% filtro obtenido como resultado (cantidad de coeficientes, atenuación,
% transición). Grafique respuesta al impulso, en frecuencia y retardo de
% grupo.

function [] = ejercicio4()
    
    load('Ejercicio4.mat');

    fc = 1;
    
    % Filtro Pasa Bajas wc = 0.3 rad/s Método: Equirriple.
    % wp = 0.25 rad/s  ws = 0.35 rad/s
    % Coeficientes: 50 , Retardo de grupo: 25.
    
    fc = PlotRespImp(ThPbA,fc);
    
    figure(fc); grid();
    RetardoGrupo = refline([0 25]); ylim([24.5 25.5]);
    set(RetardoGrupo, 'color','b'); 
    ylabel('Retardo de grupo[Muestras]'); xlabel('Frecuencia normalizada[pi rad/muestras]');
    fc = fc + 1;
    
    % Filtro Pasa Bajas wc = 0.7 rad/s Método: Equirriple.
    % wp = 0.35 rad/s  ws = 0.75 rad/s
    % Coeficientes: 50 , Retardo de grupo: 25.
    
    fc = PlotRespImp(ThPbB,fc);
    figure(fc); grid();
    RetardoGrupo = refline([0 25]); ylim([24.5 25.5]);
    set(RetardoGrupo, 'color','b');
    ylabel('Retardo de grupo[Muestras]'); xlabel('Frecuencia normalizada[pi rad/muestras]');
    fc = fc + 1;
    
end

%% Enunciado 
% Genere una señal amplitud unitaria y frecuencia N/4 df + fr, siendo fr
% una frecuencia aleatoria uniformemente distribuida entre +/- 2Hz. Realice
% 200 experimentos para estudiar los siguientes incisos:
%%
% # Calcule el error producido al medir la amplitud exclusivamente en la
% componente correspondiente a N/4 df para todas las frecuencias
% analizadas. ¿Cuál es la ventana más conveniente y por qué?
% # Repita (a) pero mida la energía comprendida entre N/4 df +/- 2Hz.
% Compare los resultados de ambas estrategias. ¿Cuál es la más conveniente?
% Discuta ventajas y desventajas de ambos métodos.

%% Ejercicio 3A
% Banco de pruebas

function [] = ejercicio3()

    fx = 1;

    % Parámetros de la sñal

    N = 400;
    fs = 1000;
    phase = 0;
    offset = 0;
    amp = 1;
    
    df = fs/N;
    
    % Parámetros de la frecuencia aleatoria uniforme
    
    a = -2;
    b = 2;
    
    % Número de experimentos a realizar
    
    Experimentos = 200;
    
    fr = a + (b-a)*rand(Experimentos,1);
    
    % Frecuencia de la señal
    fo = N/4 * df + fr;

    % Genero la señales
     vector_ventas = [ones(N,1) get_wtriangular(N) get_whann(N) get_wblackman_harris(N) get_wflat_top(N)];
     
    for cont = 1: Experimentos
        signal(:,cont) = fsenoidal(amp,fo(cont),phase,offset,N,fs);
    end
    
    for j =1:5
        for i=1:Experimentos
            signal_w = vector_ventas(:,j) .* signal(:,i);
            signal_w = 2/N * abs(fft(signal_w));
            signal_w = signal_w(1:N/2);
            frec_int(i) = signal_w(floor(N/4 + 1));
        end
        Media = mean(frec_int);
        error = frec_int - Media;
%%
        fx = plot_hist(error,fx);
    end
end


%% Ejercicio 3 - Código: Ploteo de histograma.
%
%	\fn fx = plot_hist(Signal,fx)
%	\brief Plotea el histográma de la señal: Cantidad de experimentos con
%	error vs. error cometido
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param Signal - Señal
%   \param fx - Número de figura
%   \return fx - Número próximo de figura
%	\date 2015.10.04

function fx = plot_hist(Signal,fx)

    figure(fx); set(gcf,'Name','Ejercicio 3'); 
    hist(Signal,10);
    title('Histograma de error - Sesgo');
    xlabel('Error cometido'); ylabel('Cant. de experimentos con error');
    fx = fx + 1;
    
end
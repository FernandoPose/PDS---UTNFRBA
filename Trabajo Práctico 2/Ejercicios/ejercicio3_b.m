%% Ejercicio 3B
% Banco de pruebas

function [] = ejercicio3_b()

    fx = 1;
    
    % Parámetros de la sñal

    N = 1000;
    fs = 1000;
    phase = 0;
    offset = 0;
    a = -2;
    b = 2;
    
    Experimentos = 200;
    
    df = fs/N;
    
    fr = a + (b-a)*rand(Experimentos,1);

    amp = 1;
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
            rango_med_energ = (N/4 - 2):(N/4 +2);
            rango_med_energ = rango_med_energ';
            energ(i) = 1/length(rango_med_energ) * sum(signal_w(rango_med_energ));  
        end
        
        
        Media = mean(energ);
        Error = energ - Media;
%%
        fx = plot_3b(Error,fx,rango_med_energ);
    end
end


%% Ejercicio 3 - Código: Ploteo de ejercicio 3B
%
%	\fn fx = plot_3b(Error,fx,intervalo)
%	\brief Plotea módulo de error y histograma
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param Error     - Señal a plotear
%   \param fx        - Número de figura
%   \param intervalo - Intervalo de frecuencias
%   \return fx - Número próximo de figura
%	\date 2015.10.04

function fx = plot_3b(Error,fx,intervalo)

    figure(fx); set(gcf,'Name','Ejercicio 3B'); 
    
    subplot(2,1,1); stem(intervalo,abs(Error(1:length(intervalo))));
    title('Error de la energía - Sesgo'); 
    xlabel('Frecuencia[Hz]'); ylabel('|Sesgo[f]|'); 
    
    subplot(2,1,2); hist(Error,10);
    title('Histograma de error - Sesgo');
    xlabel('Error cometido'); ylabel('Cant. de experimentos con error');
    
    fx = fx + 1;
end
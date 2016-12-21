%**
%	\fn [fc] = plot_espc6(signal,N,f,fc)
%	\brief Ploteo de señales.
%	\details Plotea el espectro: modulo y fase de la misma.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.20


function [fc] = plot_espc6(signal,N,f,fc)

    signal_tf  = 2/N * fft(signal);
    
    figure(fc); set(gcf,'Name','Ejercicio 6'); 
     
    subplot(2,1,1);
    plot(f(1:length(signal_tf)/2),abs(signal_tf(1:length(signal_tf)/2)));
    title('Modulo de la transformada del filtro'); 
    xlabel('Frecuencia[wn]'); ylabel('|H[wn]|'); 
    
    subplot(2,1,2);
    stem(f(1:length(signal_tf)/2),angle(signal_tf(1:length(signal_tf)/2)));
    title('Fase de la Transformada del filtro'); 
    xlabel('Frecuencia[wn]'); ylabel('fase H[wn]');
    
    fc = fc + 1;

end
    
    


%**
%	\fn [fc] = plot_espc_signal(signal,N,f,t, fc)
%	\brief Ploteo de señales.
%	\details Plotea la señal en tiempo, el espectro: modulo y fase de la
%	misma.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17


function [fc] = plot_espc_signal(signal,N,f,t, fc)

    signal_tf  = 2/N * fft(signal);
    
    figure(fc); set(gcf,'Name','Ejercicio 1'); 
    
    subplot(3,1,1); 
    plot(t,signal); xlabel('Tiempo[s]'); ylabel('x[t]'); grid;
    title('Senal de tres tonos');
    
    subplot(3,1,2);
    stem(f(1:length(signal_tf)/2),abs(signal_tf(1:length(signal_tf)/2)));
    title('Modulo de la Transformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('|X[f]|'); 
    
    subplot(3,1,3);
    stem(f(1:length(signal_tf)/2),angle(signal_tf(1:length(signal_tf)/2)));
    title('Fase de la Transformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('fase X[f]');
    
    fc = fc + 1;

end

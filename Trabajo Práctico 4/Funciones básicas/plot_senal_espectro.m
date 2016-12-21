%**
%	\fn [fc] = plot_senal_espectro(signal,output,N,f,t, fc)
%	\brief Ploteo de señales ejercicio 2 convolución.
%	\details Plotea la señal en tiempo, el espectro: modulo y fase de la
%	misma.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [fc] = plot_senal_espectro(signal,output,N,f,t, fc)

    signal_tf  = 2/N * fft(signal);
    output_tf  = 2/N * fft(output);
    
    figure(fc); set(gcf,'Name','Ejercicio 2'); 
    
    a(1) = subplot(2,2,1); 
    plot(signal); xlabel('N'); ylabel('x[N]'); 
    title('Señal a la entrada');
    
    subplot(2,2,2);
    stem(f(1:length(signal_tf)/2),abs(signal_tf(1:length(signal_tf)/2)));
    title('Espectro de la señal de entrada'); 
    xlabel('Frecuencia[Hz]'); ylabel('|X[w]|'); 

    a(2) = subplot(2,2,3); 
    plot(output); xlabel('N'); ylabel('x[N]'); 
    title('Señal a la salida');
    
    subplot(2,2,4);
    stem(f(1:length(output_tf)/2),abs(output_tf(1:length(output_tf)/2)));
    title('Espectro de la señal de salida'); 
    xlabel('Frecuencia[Hz]'); ylabel('|X[w]|'); 
    
    linkaxes(a,'x');
    fc = fc + 1;

end

%**
%	\fn     ploteo_espectros_ventanas(signal,f,N,fx)
%	\brief  PLoteo del espectro de la señal: temporal, espectro veces y dB
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   28/10/15 
%	\param  signal  - Señal a plotear
%	\param  f       - vector frecuencia
%	\param  N       - Número de muestras
%	\param  fx      - Número de imágen
%**

function ploteo_espectros_ventanas(signal,f,N,fx)
    
    output = my_dft(signal);
    
    figure(fx);
    subplot(3,1,1); plot(f(1:length(output)/2),abs(output(1:length(output)/2)));
    title('Modulo de la Transoformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); 

    subplot(3,1,2); plot(f(1:length(output)/2),angle(output(1:length(output)/2)));
    title('Fase de la Transformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('fase x[f]');
   
    signal_t = 20*log10(abs(output));
    subplot(3,1,3); plot(f(1:length(signal_t)/2),signal_t(1:length(signal_t)/2));
    title('Espectro en dB:'); 
    xlabel('Frecuencia[Hz]'); ylabel('|x[f]|dB'); 
    
end
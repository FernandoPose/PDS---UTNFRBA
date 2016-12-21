%**
%	\fn     [fx] = Ploteo_Espectros(signal,x_temp,f,fx)
%	\brief  PLoteo del espectro de la señal: temporal, espectro veces y dB
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   28/10/15 
%	\param  signal  - Señal a plotear
%	\param  x_temp  - Vector temporal
%	\param  f       - vector frecuencia
%	\param  fx      - Número de imágen
%**

function [fx] = Ploteo_Espectros(signal,x_temp,f,fx)

signal_t = my_dft(signal);

figure(fx); set(gcf,'Name','Ejercicio 2 A'); 
subplot(3,1,1); stem(x_temp,signal);
title('Funcion Bitonal'); 
xlabel('Tiempo[s]'); ylabel('Amplitud'); grid; 

subplot(3,1,2); stem(f(1:length(signal_t)/2),abs(signal_t(1:length(signal_t)/2)));
title('Modulo de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); 

subplot(3,1,3); stem(f(1:length(signal_t)/2),angle(signal_t(1:length(signal_t)/2)));
title('Fase de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('fase x[f]'); 

signal_t = 20*log10(signal_t);

fx = fx + 1;
figure(fx); plot(f(1:length(signal_t)/2),abs(signal_t(1:length(signal_t)/2)));
title('Espectro en dB'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|dB'); 

end
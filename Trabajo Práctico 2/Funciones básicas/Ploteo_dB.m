%**
%	\fn     [] = Ploteo_dB(signal,f,fx,Amp))
%	\brief  Plotea el espectro de signal en dB
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   28/10/15 
%	\param  signal  - Señal a plotear
%	\param  f       - vector frecuencia
%	\param  fx      - Número de imágen
%	\param  Amp     - Amplitud de componente 2
%**

function [] = Ploteo_dB(signal,f,fx,Amp)

signal_t = my_dft(signal);
signal_t = 20*log10(abs(signal_t));
figure(fx); plot(f(1:length(signal_t)/2),signal_t(1:length(signal_t)/2));
title(['Espectro en dB: ' sprintf('%3.3f',Amp) 'dB inferior a Amp1']); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|dB'); 

end
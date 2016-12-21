%**
%	\fn [] = PLoteoEspectroW(signal)
%	\brief  Plotea una señal cuya fs es arbitraria.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 28/10/15
%	\param signal  - Señal a plotear 
%**

function [] = PloteoEspectroW(signal) %wvtool()
    
  
    fs = 100; % Arbitrario
    
    output = my_dft(signal);
    N = length(output);
    
    f=0:fs/N:(N-1)*fs/N; 
    
    figure(1); set(gcf,'Name','Ploteo de ventana'); 
    subplot(3,1,1); plot(signal);
    title('Ventana'); 
    xlabel('Muestras [n]'); ylabel('Amplitud(n)'); grid; 
    
    subplot(3,1,2); stem(f(1:length(output)/2),abs(output(1:length(output)/2)));
    title('Modulo de la Transoformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); 

    subplot(3,1,3); stem(f(1:length(output)/2),angle(output(1:length(output)/2)));
    title('Fase de la Transformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('fase x[f]');     
    
end


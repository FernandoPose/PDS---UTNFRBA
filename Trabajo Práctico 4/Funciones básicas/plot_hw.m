%**
%	\fn [fc] = plot_hw(LowPass, HighPass, BandPass,N,f, fc)
%	\brief Ploteo de funciones transferencia
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [fc] = plot_hw(LowPass, HighPass, BandPass,N,f, fc)
        
    figure(fc); set(gcf,'Name','Ejercicio 1'); 
    subplot(3,1,1);
    stem(f(1:length(LowPass)/2),abs(LowPass(1:length(LowPass)/2)));
    title('Modulo del filtro Pasa Bajos'); 
    xlabel('Frecuencia[Hz]'); ylabel('|H[f]|'); 
    
    subplot(3,1,2);
    stem(f(1:length(HighPass)/2),abs(HighPass(1:length(HighPass)/2)));
    title('Modulo del filtro Pasa Altos'); 
    xlabel('Frecuencia[Hz]'); ylabel('|H[f]|'); 
    
    subplot(3,1,3);
    stem(f(1:length(BandPass)/2),abs(BandPass(1:length(BandPass)/2)));
    title('Modulo del filtro Pasa Banda'); 
    xlabel('Frecuencia[Hz]'); ylabel('|H[f]|'); 
    
    fc = fc + 1;
    
end
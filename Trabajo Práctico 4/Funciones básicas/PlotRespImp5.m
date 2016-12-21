%**
%	\fn [fc] = PlotRespImp5(Transf,fc)
%	\brief Ploteo de las respuestas al impulso de los filtros Ejercicio 5
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.18

function [fc] = PlotRespImp5(Transf,fc,fs)

    N  = length(Transf);
    f=0:fs/N:(N-1)*fs/N;
    
    Transf_Tf = fft(Transf);
    
    figure(fc); set(gcf,'Name','Ejercicio 3');    
    subplot(3,1,1); plot(Transf); xlabel('n'); ylabel('h[n]'); xlim([0 N]);
    title('Respuesta al impulso'); grid();

    subplot(3,1,2); plot(f,mag2db(abs(Transf_Tf)));
    xlabel('Frecuencia[w_n]'); xlim([0 fs/2]);
    ylabel('|H[w_n]|dB'); grid();
    title('Modulo de la respuesta al impulso');
  
    subplot(3,1,3); plot(f,angle(Transf_Tf)); 
    xlabel('Frecuencia[w_n]'); ylabel('arg[w_n]'); grid();
    title('Fase de la respuesta al impulso');  xlim([0 fs/2]);

    fc = fc + 1;
    
end
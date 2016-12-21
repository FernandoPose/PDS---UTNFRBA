%**
%	\fn [fc] = PlotRespImp(Transf,fc)
%	\brief Ploteo de las respuestas al impulso de los filtros Ejercicio 4
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.18

function [fc] = PlotRespImp(Transf,fc)

    fs = 100; % Arbitrario
    N  = length(Transf);
    
    [Hw,w]  = freqz(Transf);
    
    figure(fc); set(gcf,'Name','Ejercicio 3');    
    subplot(3,1,1); stem(Transf); xlabel('n'); ylabel('h[n]'); xlim([0 N]);
    title('Respuesta al impulso'); grid();

    subplot(3,1,2); plot(w/pi,mag2db(abs(Hw))); 
    xlabel('Frecuencia[w_n]'); ylabel('|H[w_n]|dB'); grid();
    title('Modulo de la respuesta al impulso');
    
    subplot(3,1,3); plot(w/pi,angle(Hw)); 
    xlabel('Frecuencia[w_n]'); ylabel('arg[w_n]'); grid();
    title('Modulo de la respuesta al impulso');
    
    fc = fc + 1;
    
end
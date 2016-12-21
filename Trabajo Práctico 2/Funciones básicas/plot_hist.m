%% Ejercicio 3 - Código: Ploteo de histograma.
%
%	\fn fx = plot_hist(Signal,fx)
%	\brief Plotea el histográma de la señal: Cantidad de experimentos con
%	error vs. error cometido
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param Signal - Señal
%   \param fx - Número de figura
%   \return fx - Número próximo de figura
%	\date 2015.10.04


function fx = plot_hist(Signal,fx)

    figure(fx); set(gcf,'Name','Ejercicio 3'); 
    hist(Signal,10);
    title('Histograma de error - Sesgo');
    xlabel('Error cometido'); ylabel('Cant. de experimentos con error');
    fx = fx + 1;
    
end
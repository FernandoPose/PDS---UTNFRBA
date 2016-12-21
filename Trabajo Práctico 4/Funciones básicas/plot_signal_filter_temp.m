%**
%	\fn [fc] = plot_signal_filter_temp(y_l, y_h, y_b, t, fc)
%	\brief Plotea las salidas del filtro en el tiempo.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [fc] = plot_signal_filter_temp(y_l, y_h, y_b, t, fc)
    
    figure(fc); set(gcf,'Name','Ejercicio 1'); 
    
    subplot(3,1,1); 
    plot(t,y_l); xlabel('Tiempo[s]'); ylabel('y[t]');
    title('Senal filtrada: Pasa bajos');
    
    subplot(3,1,2); 
    plot(t,y_h); xlabel('Tiempo[s]'); ylabel('y[t]'); 
    title('Senal filtrada: Pasa altos');
    
    subplot(3,1,3); 
    plot(t,y_b); xlabel('Tiempo[s]'); ylabel('y[t]'); 
    title('Senal filtrada: Pasa banda');
    
    fc = fc + 1;

end

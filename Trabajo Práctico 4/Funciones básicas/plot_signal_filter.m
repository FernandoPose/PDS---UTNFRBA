%**
%	\fn plot_signal_filter(signal_tf,transf,Y,N,f,fc)
%	\brief Plotea: Entrada, transferencia y salida todo en frecuencia.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function plot_signal_filter(signal_tf,transf,Y,N,f,fc)

    figure(fc); set(gcf,'Name','Ejercicio 1'); 
    subplot(3,1,1);
    stem(f(1:length(signal_tf)/2),abs(signal_tf(1:length(signal_tf)/2)));
    title('Entrada al sistema'); 
    xlabel('Frecuencia[Hz]'); ylabel('|X[f]|'); 
    
    subplot(3,1,2);
    stem(f(1:length(transf)/2),abs(transf(1:length(transf)/2)));
    title('Transferencia del sistema'); 
    xlabel('Frecuencia[Hz]'); ylabel('|H[f]|'); 
    
    subplot(3,1,3);
    stem(f(1:length(Y)/2),abs(Y(1:length(Y)/2)));
    title('Salida del sistema'); 
    xlabel('Frecuencia[Hz]'); ylabel('|Y[f]|'); 

end
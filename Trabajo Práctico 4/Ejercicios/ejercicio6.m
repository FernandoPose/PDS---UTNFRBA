% Teniendo en cuenta que la actividad eléctrica del corazón puede
% registrarse en la superficie del tórax por medio del ECG, y que dicha
% actividad eléctrica se encuentra contaminada por distintas señales de
% ruido (musculares, acople de la señal de red eléctrica entre otras
% perturbaciones). Por otra parte se sabe que la forma de un latido típico
% puede representarse mediante la figura mostrada en el informe.

% Se pide diseñar los filtros digitales adecuados para que la señal de ECG
% que se incluye en el archivo TP3_ecg.mat, quede lo más limpia de ruidos
% posibles, o lo que es equivalente, lo más parecida a la figura de arriba
% posible. La frecuencia de muestreo es de 1000Hz.

function [] = ejercicio6()
    
    load('Ejercicio6.mat');
    load('TP3_ecg.mat');
    
    % Frecuencia de sampleo
    fs = 1000;
    
    % Eliminar frecuencia ruido de linea de 50Hz
    % Eliminar frecuencia ruido de linea de 60Hz
    % Lim inf: 0,5Hz
    % Lim sup: Diagnostico: 100Hz

    fc = 1;
    
    ecg = ecg_lead;
    
    % Filtro Elimina banda Método: Equirriple
    % Fase Lineal - Filtro FIR  50Hz
    % Fpass = 48Hz
    % Fstop = 49Hz
    % Fpass = 51Hz
    % Fstop = 52Hz
    % Coeficientes: 1660
    % Retardo de grupo: 830.
    % Dstop = 0.001
    % Dpass = 0.1
    
    % Filtro la señal
    Out_N50 = filter(HtEb50L,1,ecg);
    
    % Ploteo características del filtro
    f = 0:fs/length(HtEb50L):(length(HtEb50L)-1)*fs/length(HtEb50L);
    fc = plot_espc6(HtEb50L,length(HtEb50L),f,fc);
   
    % Corrijo la fase:
    Out_N50 = Out_N50(length(HtEb50L)/2:end);

      
    % Filtro Pasa Altos wc = 0.5 rad/s Método: Equirriple
    % Fpass = 0.6Hz Fstop = 0.4Hz
    % Coeficientes: 8498. 
    % Retardo de grupo: 4249.
    % Dstop = 0.001
    % Dpass = 0.1
    
    % Filtro la señal
    Output_1 = filter(HtPaL,1,Out_N50);
    
    % Ploteo características del filtro
    f = 0:fs/length(HtPaL):(length(HtPaL)-1)*fs/length(HtPaL);
    fc = plot_espc6(HtPaL,length(HtPaL),f,fc);
    
    % Corrijo la fase:
    Output_1= Output_1(length(HtPaL)/2:end);
    
    % Filtro Pasa Bajas wc = 60 rad/s Método: Equirriple
    % Fpass = 59Hz Fstop = 62Hz
    % Coeficientes:  602. 
    % Retardo de grupo: 301.
    % Dstop = 0.001
    % Dpass = 0.1
    
    % Filtro la señal
    Output_2 = filter(HtPbL,1, Output_1);
    
    % Ploteo características del filtro
    f = 0:fs/length(HtPbL):(length(HtPbL)-1)*fs/length(HtPbL);
    fc = plot_espc6(HtPbL,length(HtPbL),f,fc);

    % Corrijo la fase:
    Output_2= Output_2(length(HtPbL)/2:end);

    figure(fc); set(gcf,'Name','Ejercicio 6');
    plot(ecg); title('Ecg real'); hold on
    plot(Output_2,'r'); title('Señal de ECG');
    legend('ECG - Sin procesar','ECG - Filtrado');
    hold off;
    
end
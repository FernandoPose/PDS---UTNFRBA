% Filtro adaptado.
% En el archivo TP3_ecg.mat encontrará una grabación electrocardiográfica
% (ECG). Aplique el concepto de filtro adaptado para encontrar los
% paatrones representados por las variables:

% hearteat_pattern1: Latido normal.
% heartbeat_patter2: Latido de origen ventricular.
% qrs_pattern1: complejo QRS normal.

% Explique conceptualmente como podría realizar un detector de latidos con
% la señal resultante del filtro adaptado. Discuta la utilizad y
% limitaciones de éste método.

function [] = ejercicio2_B()
    
    fc = 1;
    
    load('TP3_ecg.mat')
     
    % Señal ECG completa
    figure(fc); plot(ecg_lead); title('Señal ECG sin procesar'); fc = fc + 1;
    xlabel('N'); ylabel('Amplitud');
    
    
    % Complejo Latido normal
    figure(fc); plot(heartbeat_pattern1);  ylabel('Amplitud'); xlabel('N');
    title('Patron: Latido normal');
    fc = fc + 1;
    
    % Convoluciono la señal con un latido normal
    out_lat_norm = conv(ecg_lead,heartbeat_pattern1);
    out_lat_norm = 1/length(out_lat_norm) * out_lat_norm;
    figure(fc); hold on;
    plot(ecg_lead); plot(out_lat_norm,'r'); hold off;
    ylabel('Amplitud'); xlabel('N');
    legend('ECG - Sin procesar','ECG - Procesada');
    title('Señal ECG convolucionada con Patron latido normal');
    fc = fc + 1;
    
    
    % Latido de origen ventricular
    figure(fc); plot(heartbeat_pattern2); xlabel('N'); ylabel('Amplitud');
    title('Patron: Latido origen ventricular');
    fc = fc + 1;
    
    %Convoluciono la señal con un latido de origen ventricular
    out_ventr = conv(ecg_lead,heartbeat_pattern2);
    out_ventr = 1/length(out_ventr) * out_ventr;
    figure(fc); hold on;
    plot(ecg_lead); plot(out_ventr,'r'); hold off;
    ylabel('Amplitud'); xlabel('N');
    legend('ECG - Sin procesar','ECG - Procesada');
    title('Señal ECG convolucionada con Patron latido ventricular');
    fc = fc + 1;
    
    
    
    % Complejo QRS normal
    figure(fc); plot(qrs_pattern1);  title('Patron: QRS normal');
    xlabel('N'); ylabel('Amplitud');
    fc = fc + 1;
    
    %Convoluciono la señal con un complejo QRS normal
    out_QRS = conv(ecg_lead,qrs_pattern1);
    out_QRS = 1/length(out_QRS) * out_QRS; 
    figure(fc); hold on;
    plot(ecg_lead); plot(out_QRS,'r'); hold off;
    ylabel('Amplitud'); xlabel('N');
    legend('ECG - Sin procesar','ECG - Procesada');
    title('Señal ECG convolucionada con Patron QRS normal');

end
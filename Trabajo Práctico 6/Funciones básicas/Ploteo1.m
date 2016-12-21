%**
%	\fn [fp] = Ploteo1(Signal,Signal_Resample,ts,tsx,fp)
%	\brief Plotea señales ejercicio 1
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal          - Señal original
%   \param  Signal_Resample - Señal resampleada
%	\param  ts              - Eje temporal de señal original
%   \param  tsx             - Eje temporal de señal resampleada
%   \param  fp              - Número de imagen

function [fp] = Ploteo1(Signal,Signal_Resample,ts,tsx,fp)

Linf = 0; 
Lsup = 2;

%Linf = 0; 
%Lsup = 4;

%Linf = 0;
%Lsup = 6;

%Linf = 1120;
%Lsup = 1122;

%Linf = 1120;
%Lsup = 1124;

%Linf = 1120;
%Lsup = 1126;

%Linf = 600;
%Lsup = 602;

%Linf = 600;
%Lsup = 604;

%Linf = 600;
%Lsup = 606;

figure(fp);

subplot(2,2,1:2)
hold on
plot(ts,Signal,'x-');
plot(tsx,Signal_Resample,'x-r');
%xlim([Linf Lsup]);
xlabel('Tiempo[seg]'); ylabel('Amplitud[V]'); grid;
title('Resampleo - Multirate');
legend('ECG sin procesar','ECG Procesado');
hold off

subplot(2,2,3)
plot(ts,Signal,'x-'); 
%xlim([Linf Lsup]);
xlabel('Tiempo[seg]'); ylabel('Amplitud[V]'); grid;
title('ECG Sin procesar');
subplot(2,2,4)
plot(tsx,Signal_Resample,'x-');
xlabel('Tiempo[seg]'); ylabel('Amplitud[V]'); grid;
%xlim([Linf Lsup]);
grid on;
title('ECG Procesada');
set(gcf,'Name','Trabajo Práctico 6 - MultiRate');  

end







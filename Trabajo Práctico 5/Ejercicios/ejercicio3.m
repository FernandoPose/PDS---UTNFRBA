function ejercicio3()

load('TP5_ECG.mat');

fc = 1;

% Ventana a utilizar
LengW = 200;

% Frecuencia de sampleo
fs = 1000;

% Filtro de media movil
tic; EcgFilterMedia   = FilterMedia(ECG1,LengW); MediaTime = toc;
disp('Tiempo filtrado media:');
disp(MediaTime);

fc = ploteo_3(ECG1,EcgFilterMedia,fc);
fc = ploteo_33(ECG1,EcgFilterMedia,fc);

% Filtro de mediana - Percentil 0. 
percentil = 0;
tic; EcgFilterMedian0  = FilterMedian(ECG1,LengW,percentil); MedianTime =toc;
disp('Tiempo filtrado mediana percentil 0:');
disp(MedianTime);

fc = ploteo_3(ECG1,EcgFilterMedian0,fc);
fc = ploteo_33(ECG1,EcgFilterMedian0,fc);

% Filtro de mediana - Percentil 50.
percentil = 50;
tic; EcgFilterMedian50  = FilterMedian(ECG1,LengW,percentil); MedianTime =toc;
disp('Tiempo filtrado mediana percentil 50:');
disp(MedianTime);

fc = ploteo_3(ECG1,EcgFilterMedian50,fc);
fc = ploteo_33(ECG1,EcgFilterMedian50,fc);

% Filtro de mediana - Percentil 100. 
percentil = 100;
tic; EcgFilterMedian100  = FilterMedian(ECG1,LengW,percentil); MedianTime =toc;
disp('Tiempo filtrado mediana percentil 100:');
disp(MedianTime);

fc = ploteo_3(ECG1,EcgFilterMedian100,fc);
fc = ploteo_33(ECG1,EcgFilterMedian100,fc);

% Ploteo las comparaciones del filtrado de media y el filtrado de mediana

% Media vs. mediana percentil 0
fc = ploteo_3b(EcgFilterMedia,EcgFilterMedian0,fc);
fc = ploteo_3bb(EcgFilterMedia,EcgFilterMedian0,fc);

% Media vs. mediana percentil 50
fc = ploteo_3b(EcgFilterMedia,EcgFilterMedian50,fc);
fc = ploteo_3bb(EcgFilterMedia,EcgFilterMedian50,fc);

% Media vs. mediana percentil 100
fc = ploteo_3b(EcgFilterMedia,EcgFilterMedian100,fc);
fc = ploteo_3bb(EcgFilterMedia,EcgFilterMedian100,fc);

end
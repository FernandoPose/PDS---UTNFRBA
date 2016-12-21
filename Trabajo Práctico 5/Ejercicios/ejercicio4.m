function ejercicio4()

load('TP5_ECG.mat');

fc = 1;

Fs = 1000;

%% Primer metodo planteado - V(n) = med600 (med200(x(n))

percentil = 50;
LengW2 = 200;
LengW6 = 600;

tic;
v_aux = FilterMedian(ECG1,LengW2,percentil);
v     = FilterMedian(v_aux,LengW6,percentil);
TiempoMediana = toc;

disp('Tiempo con el primer metodo: ');
disp(TiempoMediana);

resultado = ECG1(1:length(ECG1)/4) - v;

fc = ploteo4(ECG1(1:length(ECG1)/4),resultado,fc);

%% Segundo metodo planteado - 

QRS = QRS_loc1';
PQ  = 80;

ejeX = zeros(length(QRS_loc1),1);
ejeY = zeros(length(QRS_loc1),1);

tic;
for k = 1 : length(QRS)
    
     if(QRS(k) > length(ECG1))
        ejeX = ejeX(1:k);
        ejeY = ejeY(1:k);
        break;
    end
    
    ejeX(k) = (QRS(k) - PQ);
    ejeY(k) = ECG1(QRS(k) - PQ);
end;

LineaBase = spline(ejeX,ejeY,1:length(ECG1));
TiempoInterpolador = toc;

disp('Tiempo con el segundo metodo: ');
disp(TiempoInterpolador);

resultado = ECG1 - LineaBase';

fc = ploteo4(ECG1,resultado,fc);

end
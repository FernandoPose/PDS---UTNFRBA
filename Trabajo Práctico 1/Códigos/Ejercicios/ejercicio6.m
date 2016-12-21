%% Ejercicio 6
%%
%% Enunciado 
% Para cada señal propuesta:
%% 
% # Sin realizar ninguna simulación, responda conceptualmente qué contenido
% espectral debería obtener tras evaluar su FFT.
% # Calcule su espectro en Matlab y discuta su predicción con los
% resultados obtenidos. Intente explicar dichos resultados.
% # Preste especial atención en su discusión a:
%%
% * La energía total de la señal
% * La energía del tono en particular
% * La localización del tono en el espectro
%%
% Siga las indicaciones para cada señal. (ver señales en consignas PDF)
%%
% Luego de realizar la experimentación y observando los resultados
% obtenidos discuta si es fiable o no medir en el dominio de Fourier, por
% medio de la FFT los siguientes aspectos de una señal:
%%
% * Energía
% * Contenido espectral
% * Energía de un determinado ancho de banda o componente espectral
% * Localización temporal de un determinado componente espectral


%% Ejercicio 6.A 

%%
% # Señal 1: En esta primera señal, señal senoidal periodica, en el
% espectro se deberia poder observar un delta a la frecuencia de 9 df
% (resolucion espectral). El resto del espectro deberia tener componentes
% nulas.
% # Señal 2: Para esta segunda señal, señal senoidal de un solo ciclo,
% nuevamente deberiamos poder observar un delta en el espetro a 9 df
% (resolucion espectral). A diferencia de la primer señal en este la
% amplitud de la componente deberia disminuir deacuerdo a que en el tiempo
% se tiene menor cantidad de informacion. Ademas debido a que se completo
% con ceros parte de la señal podria observarse el efecto de leakage
% (desparramo) apareciendo componentes no nulas de frecuencia al rededor de
% la componente de mayor energia.
% # Señal 3: En esta señal, señal senoidal de un ciclo desplazada hacia el
% tercer periodo, en el espectro de modulo debera ser igual a la señal 2.
% Las diferencias respecto de la señal 2 se observaran en el espectro de
% fase.
% # Señal 4: En la señal, dos ciclos de dos senoidales de dos frecuencias
% distintas, el espectro estará compuesto por dos deltas, debido a que las
% frecuencias de las mismas están muy cerca entre sí no se podra
% identificar a las mismas. Además aparecera el efecto de leakage debido a
% no contar con la suficiente resolucion espectral. 
% # Señal 5: Al igual que en el caso 2 y 3, en esta la señal, la señal
% generada contendra el mismo espectro en modulo que la señal 4 y los
% cambios se podran observar respecto del espectro de fase debido a que
% ambas señales contienen la misma informacion.
% # Señal 6: Esta señal, esta compuesta por tres ciclos de una señal
% senoidal de una unica frecuencia, por lo tanto en el espectro aparecera
% una delta (parecido al caso de la señal dos) con la diferencia que sera
% de mayor amplitud debido a que la señal cuenta con mayor cantidad de
% informacion y por tal motivo mayor energia. Ademas aparecera el efecto de
% leakage nuevamente debido a que puede no cumplirse f = K * fs/N siendo
% k = {1,2,N}
% # Señal 7: Esta señal, esta compuesta por tres ciclos de tres funciones
% senoidales de misma frecuencia pero amplitudes diferentes. En el espectro
% deberia ver el delta de mayor amplitud sobre la fo de la señal y luego a
% los alrededores del mismo, por el efecto de leakage otras componentes de
% menor frecuencia.
% # Señal 8: Esta señal esta compuesta por tres ciclos de la señal 7 por lo
% tanto en el espectro se observara lo mismo, con la diferencia de al tener
% mayor cantidad de informacion, la amplitud de las componentes en
% frecuencia aumentara.
% # Señal 9: En este caso, se consta de dos ciclos de una senoidal
% defasados uno del otro en pi radianes (180°). Aplicando el principio de
% superposición, se debería observar en el espectro de módulo a la
% frecuencia de la señal un valor nulo de componente.

%% Ejercicio 6.B.C.D - Parámetros
% Banco de pruebas

function [] = ejercicio6()

% Declaro los parámetros para realizar las funciones pedidas en el
% enunciado.

N = 1800;
fs = 100;
df = fs/N;

amp = 1;
fo= df;
offset = 0;
phase = 0;

fx = 1;

%%
% A continuación se pueden ver tanto el código como la señal generada
% (correspondientes a las pedidas en el enunciado del ejercicio) junto con
% el espectro correspondiente a cada señal, tanto el espectro de módulo
% como el de fase.

%% Ejercicio 6.B.C.D - Primera Señal

[output,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Segunda Señal

fx = fx + 1;
[output,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
j=N/9:length(output);
output(j) = 0;

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Tercera Señal

fx = fx + 1;
[output,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
j=1:2*N/9; 
k = 3* N/9: length(output);
output(j) = 0; output(k) = 0;

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Cuarta Señal
fx = fx + 1;
[output_1,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
[output_2,x_temp] = fsenoidal(amp, 8*fo, phase, offset, N, fs);

j=N/9:length(output_1);
output_1(j) = 0;
f=1:2*N/8; 
g = 3* N/8: length(output_2);
output_2(f) = 0; output_2(g) = 0;
output = output_1 + output_2;

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Quinta Señal

fx = fx + 1;
[output_1,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
[output_2,x_temp] = fsenoidal(amp, 8*fo, phase, offset, N, fs);

j=N/8:length(output_2);
output_2(j) = 0;
f=1:2*N/9; 
g = 3* N/9: length(output_1);
output_1(f) = 0; output_1(g) = 0;
output = output_1 + output_2;

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Sexta Señal

fx = fx + 1;
[output_1,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
[output_2,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
[output_3,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);

j=N/9:length(output_1);
output_1(j) = 0;
j=1:N/9; k = 2*N/9:length(output_2);
output_2(j)=0; output_2(k)=0;
j=1:2*N/9; k = 3*N/9:length(output_3);
output_3(j)=0; output_3(k)=0;
output = output_1 + output_2 + output_3;

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Septima Señal

fx = fx + 1;
[output_1,x_temp] = fsenoidal(0.1*amp, 9*fo, phase, offset, N, fs);
[output_2,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
[output_3,x_temp] = fsenoidal(0.3*amp, 9*fo, phase, offset, N, fs);

j=N/9:length(output_1);
output_1(j) = 0;
j=1:N/9; k = 2*N/9:length(output_2);
output_2(j)=0; output_2(k)=0;
j=1:2*N/9; k = 3*N/9:length(output_3);
output_3(j)=0; output_3(k)=0;
output = output_1 + output_2 + output_3;

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Octava Señal

fx = fx + 1;
[output_1,x_temp] = fsenoidal(0.1*amp, 9*fo, phase, offset, N, fs);
[output_2,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
[output_3,x_temp] = fsenoidal(0.3*amp, 9*fo, phase, offset, N, fs);

j=N/9:length(output_1);
output_1(j) = 0;

j=1:N/9; k = 2*N/9:length(output_2);
output_2(j)=0; output_2(k)=0;

j=1:2*N/9; k = 3*N/9:length(output_3);
output_3(j)=0; output_3(k)=0;
output = output_1 + output_2 + output_3;
output = repmat(output(1:600),3);

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

%% Ejercicio 6.B.C.D - Novena Señal

fx = fx + 1;
[output_1,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);
phase = pi;
[output_2,x_temp] = fsenoidal(amp, 9*fo, phase, offset, N, fs);

j=N/9:length(output_1);
output_1(j) = 0;
j=1:N/9;
f=2*N/9:length(output_2); 
output_2(j) = 0; output_2(f) = 0;
output = output_1 + output_2;

f=0:fs/N:(N-1)*fs/N;

plot_ejercicio6(output,x_temp,f,N, fx);

%%
% La simulación verifica lo esperado en 1.A

end

%% Ejercicio 6 - Conclusiones
% Respecto de la energia utilizar, medir en el domino de Fourier, por medio
% de la FFT, no presenta inconvenientes debido a que el calculo de la
% energia tiene encuenta todos los coeficientes (todas las muestras) y no
% depende ni de la ubicacion de las componentes en el espectro ni de la
% fase, solo del cuadrado de la amplitud de las mismas. En lo que respecta
% a la localizacion temporan de un determinado componente espectral, este
% puede volverse difucultoso o no encontrar debido a la resolucion
% espectral que depende de la frecuencia de muestreo "fs" y del numero de
% muestras tomadas. Ademas para detectar el espectro de la señal respecto
% al desparramo producido por el efecto de leakage se debe tomar una
% cantidad de muestras suficientemente alta de moto tal de disminuir la
% resolucion espectral. Se debe recordar que esta tiene su limitacion,
% fisicamente no se puede reducir la resolucion tanto como uno quiera.

%% Ejercicio 6 - Código: Ploteo de señales
function [] = plot_ejercicio6(output,x_temp,f,N, fx)

figure(fx); set(gcf,'Name','Ejercicio 6');
subplot(3,1,1); plot(x_temp,output,'b');
xlabel('Tiempo[seg]'); ylabel('Amplitud [V]'); grid;

output_fft = fft(output);
output_fft = output_fft*2/N;

subplot(3,1,2); stem(f(1:length(output)/2),abs(output_fft(1:length(output)/2)));
title('Modulo de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); grid;

subplot(3,1,3); stem(f(1:length(output)/2),angle(output_fft(1:length(output)/2)));
title('Fase de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('fase x[f]'); grid;

end




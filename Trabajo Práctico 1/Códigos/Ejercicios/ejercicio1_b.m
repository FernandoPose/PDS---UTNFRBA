
%% Ejercicio 1.B
% Banco de pruebas: Ejercicio 1.B

%%
% Con los generadores de señales: senoidales, cuadradas y triangulares se
% desarrollo el script que se exime a continuación. Por razones de
% visualización, las conclusiones de este ejercicio, se podrán observar
% debajo de cada par de señales generadas de cada uno de los tipos pedidos.
% Es importante destacar, en éste caso, que todas las señales generadas
% fueron sampleadas con una fs de 100 Hz.


function [] = ejercicio1_b()

amplitud = 1;
fo= 10;
offset = 0;
N = 100;
fs = 100;  % Rango de variación de fs: 10 - 110

phase = pi/2;
simet = 10;
duty  = 10;


%% Ejercicio 1.B - Señal Senoidal

[F_senoidal,t] = fsenoidal(amplitud, fo, phase, offset, N, fs);
figure(1); set(gcf,'Name','Funcion senoidal'); 
subplot(4,1,1); stem(t,F_senoidal);
title(['Funcion Senoidal: ' sprintf('%3.3f',amplitud) 'V' ' Phase: ' sprintf('%3.3f',phase) ' Fo: ' sprintf('%3.3f',fo)]); 
ylabel('Voltage[V]'); grid;


[F_senoidal,t] = fsenoidal(2*amplitud, 2*fo, 2*phase, offset, N, fs);
subplot(4,1,2); stem(t,F_senoidal);
title(['Funcion Senoidal: ' sprintf('%3.3f',2*amplitud) 'V' ' Phase: ' sprintf('%3.3f',2*phase) ' Fo: ' sprintf('%3.3f',2*fo)]); 
ylabel('Voltage[V]'); grid;

[F_senoidal,t] = fsenoidal(amplitud, 5*fo, 3*phase, offset, N, fs);
subplot(4,1,3); stem(t,F_senoidal);
title(['Funcion Senoidal: ' sprintf('%3.3f',amplitud) 'V' ' Phase: ' sprintf('%3.3f',3*phase) ' Fo: ' sprintf('%3.3f',5*fo)]); 
ylabel('Voltage[V]'); grid;

[F_senoidal,t] = fsenoidal(2*amplitud, 11*fo, 4*phase, offset, N, fs);
subplot(4,1,4); stem(t,F_senoidal);
title(['Funcion Senoidal: ' sprintf('%3.3f',2*amplitud) 'V' ' Phase: ' sprintf('%3.3f',4*phase) ' Fo: ' sprintf('%3.3f',11*fo)]); 
xlabel('Tiempo[s]'); ylabel('Voltage[V]'); grid;

%%
% *Conclusiones:*
%%
% *Señal 1:* La primer señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 1V
% * Fase    : 1,751rad
% * Fo      : 10Hz

%%
% Para esta señal, la frecuencia de muestreo es superior al doble de la
% maxima frecuencia de la señal (en este caso se trata de un tono de 10Hz,
% señal acotada en banda) por tal motivo no se nota nada extraño. Bajo
% estas circustancias se puede garantizar la reconstruccion de la señal
% original.

%%
% *Señal 2:* La segunda señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 2V
% * Fase    : 3,142rad
% * Fo      : 20Hz

%%
% En esta segunda señal, nuevamente se repite lo expresado en las
% conclusiones antes dichas.

%%
% *Señal 3:* La tercera señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 1V
% * Fase    : 4,712rad
% * Fo      : 50Hz

%%
% En la tercer señal, se observa que la frecuencia de la misma es de 50Hz
% siendo la frecuencia de muestero 100Hz. Por tal motivo, la frecuencia de
% la señal coincide con la frecuencia de Nyquist, motivo por el cual se
% puede observar la señal formada por muestras de valor positivo y negativo
% de forma alternada.

%%
% *Señal 4:* La cuarta señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 2V
% * Fase    : 6,283rad
% * Fo      : 110Hz

%%
% Finalmente, en esta cuarta señal, podemos observar que la frecuencia de
% la señal es mayor a la frecuencia de Nyquist, por lo que se produce una
% distorision conocida como aliasing; algunos autores la traducen como
% solapamiento. Este fenomeno, ocurre cuando los deltas con los cuales se
% muestrea estan muy cerca, al convolucionar con el espectro de la señal se
% producira un solapamiento. Este solapamiento deformara el espectro
% original impidiendo la reconstruccion de la señal original.

%% Ejercicio 1.b - Señal Cuadrada

[F_cuadrada,t] = fcuadrada(amplitud, fo, 2*duty, offset, N, fs);
figure(2); set(gcf,'Name','Funcion cuadrada'); 
subplot(4,1,1); stem(t,F_cuadrada);
title(['Funcion Cuadrada: ' sprintf('%3.3f',amplitud) 'V' ' Duty: ' sprintf('%3.3f',2*duty) ' Fo: ' sprintf('%3.3f',fo)]); 
ylabel('Amplitud[V]'); grid;


[F_cuadrada,t] = fcuadrada(2*amplitud, 2*fo, 5*duty, offset, N, fs);
subplot(4,1,2); stem(t,F_cuadrada);
title(['Funcion Cuadrada: ' sprintf('%3.3f',2*amplitud) 'V' ' Duty: ' sprintf('%3.3f',5*duty) ' Fo: ' sprintf('%3.3f',2*fo)]); 
ylabel('Amplitud[V]'); grid;

[F_cuadrada,t] = fcuadrada(amplitud, 5*fo, 7*duty, offset, N, fs);
subplot(4,1,3); stem(t,F_cuadrada);
title(['Funcion Cuadrada: ' sprintf('%3.3f',amplitud) 'V' ' Duty: ' sprintf('%3.3f',7*duty) ' Fo: ' sprintf('%3.3f',5*fo)]); 
ylabel('Amplitud[V]'); grid;

[F_cuadrada,t] = fcuadrada(2*amplitud, 11*fo, 2*duty, offset, N, fs);
subplot(4,1,4); stem(t,F_cuadrada);
title(['Funcion Cuadrada: ' sprintf('%3.3f',2*amplitud) 'V' ' Duty: ' sprintf('%3.3f',2*duty) ' Fo: ' sprintf('%3.3f',11*fo)]); 
xlabel('Tiempo[s]'); ylabel('Amplitud[V]'); grid;

%%
% *Conclusiones:*
%%
% *Señal 1:* La primer señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 1V
% * Duty    : 20%
% * Fo      : 10Hz

%%
% Para esta señal, se respeto el teorema del muestreo, donde la frecuencia
% de muestreo es mayor al doble de la maxima frecuencia de la señal. Por
% este motivo, se podra recuperar la señal sin reconocer ningun efecto en
% particular a ser mensionado.

%%
% *Señal 2:* La segunda señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 2V
% * Duty    : 50%
% * Fo      : 20Hz

%%
% En esta señal, al igual que para el segundo caso de las señales
% senoidales, la frecuencia de muestreo supera a la frecuencia de Nyquist,
% motivo por el cual se podra reconstruir la señal de forma adecuada.

%%
% *Señal 3:* La tercera señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 1V
% * Duty    : 70%
% * Fo      : 50Hz

%%
% Para esta tercera señal, la frecuencia es igual a la frecuencia de
% Nyquist (dos veces la maxima frecuencia de la señal) se puede observar
% del grafico que se tiene casi un espectro continuo, debido a que las
% muestras que se toman de la señal coinciden, casi siempre (al menos en
% este caso) con la parte de la señal en alto.

%%
% *Señal 4:* La cuarta señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 2V
% * Duty    : 20%
% * Fo      : 110Hz

%%
% En la cuarta señal, se realiza un sobremuestreo de la señal, motivo por
% el cual se produce un efecto de aliasing, o solapamiento. Esta señal no
% se podra reconstruir.

%%
%Como comentario final, se puede notar que en los cuatro casos
%vistos, la señal obtenida del muestreo no pierde la forma, pueda o no, ser
%reconstruida. Se deberia realizar un estudio mas completo para poder
%ganarantizar o rechazar la generalizacion de esta conclusion ante
%cualquier señal cuadrada.

%% Ejercicio 1.c - Señal Triangular

[F_triangular,t] = ftriangular(amplitud, fo, 5*simet, offset, N, fs);
figure(3); set(gcf,'Name','Funcion triangular'); 
subplot(4,1,1); stem(t,F_triangular);
title(['Funcion Triangular: ' sprintf('%3.3f',amplitud) 'V' ' Simetria: ' sprintf('%3.3f',2*simet) ' Fo: ' sprintf('%3.3f',fo)]); 
ylabel('Amplitud[V]'); grid;


[F_triangular,t] = ftriangular(2*amplitud, 2*fo, 5*simet, offset, N, fs); 
subplot(4,1,2); stem(t,F_triangular);
title(['Funcion Triangular: ' sprintf('%3.3f',2*amplitud) 'V' ' Simetria: ' sprintf('%3.3f',5*simet) ' Fo: ' sprintf('%3.3f',2*fo)]); 
ylabel('Amplitud[V]'); grid;

[F_triangular,t] = ftriangular(amplitud, 5*fo, 3*simet, offset, N, fs);
subplot(4,1,3); stem(t,F_triangular);
title(['Funcion Triangular: ' sprintf('%3.3f',amplitud) 'V' ' Simetria: ' sprintf('%3.3f',3*simet) ' Fo: ' sprintf('%3.3f',5*fo)]); 
ylabel('Amplitud[V]'); grid;

[F_triangular,t] = fcuadrada(2*amplitud, 11*fo, 7*simet, offset, N, fs);
subplot(4,1,4); stem(t,F_triangular);
title(['Funcion Triangular: ' sprintf('%3.3f',2*amplitud) 'V' ' Simetria: ' sprintf('%3.3f',7*simet) ' Fo: ' sprintf('%3.3f',11*fo)]); 
xlabel('Tiempo[s]'); ylabel('Amplitud[V]'); grid;

%%
% *Conclusiones:*
%%
% *Señal 1:* La primer señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 1V
% * Simetria: 50%
% * Fo      : 10Hz

%%
% *Señal 2:* La segunda señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 2V
% * Simetria: 50%
% * Fo      : 20Hz
%%
% *Señal 3:* La tercera señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 1V
% * Simetria: 30%
% * Fo      : 50Hz

%%
% *Señal 4:* La cuarta señal fue generada a partir de los siguientes
% parámetros:
%%
% * Amplitud: 2V
% * Simetria: 70%
% * Fo      : 110Hz

%%
% Para las señales triangulares, se repiten las mismas conclusiones ya
% obtenidas. Se puede observar que cuando la frecuencia de muestreo es
% superior a dos veces la frecuencia maxima (frecuencia de Nyquist) la
% forma de onda se mantiene (ver las primeras dos señales). LUego en la
% frecuencia de Nyquist, se repite el caso de la señal senoidal a la
% frecuencia de Nyquist. Finalmente en la cuarta señal, cuando la
% frecuencia de sampleo es menor que el doble de la frecuencia maxima la
% señal pierde su forma, la misma ya no puede ser reconstruida nuevamente.
end








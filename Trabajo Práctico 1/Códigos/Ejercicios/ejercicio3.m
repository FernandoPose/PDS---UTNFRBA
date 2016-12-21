%% Ejercicio 3
%%
%% Enunciado 
% # Discutir si las señales del punto 1 son acotadas en banda(X(f) = 0 si
% f > Fs/2), ¿Cómo se podrían limitar en banda en caso que no estén
% acotadas?
%%
% * Fundamente su respuesta en base a señales generadas con las funciones
% de 1 para los casos de estar o no acotadas en banda.
% * Calcule y grafique los espectros con la DFT desarrollada en 2, de las
% señales generadas en 3.A para avalar sus conclusiones.

%% Ejercicio 3.A
% Al tratarse la señal que se desa transformar de una señal discreta, el
% espectro sera discreto y se encontrara "envuelto", segun como fue visto en
% la teoria a partir de:
%%
% # La transformada de una señal senoidal corresponde a dos pulsos en
% frecuencia en +/- fo (siendo fo la frecuencia de la señal a transformar)
% # La transformada de un pulso corresponde a una sinc()
% # La transformada de una señal triangular corresponde a una funcion
% sinc2().
%%
% Debido a esto las componentes se encontraran en dichas envolventes,
% siendo en el caso de la señal cuadrada y triangular una envolvente que en
% el espectro se encuentra entre -inf a inf, teniendo estas ultimas señales
% transformadas componentes en todo el espectro. Es por esto que como se
% vera estas dos ultimas señales comentadas no tendran un espectro acotado
% en banda.

%%
% La forma de obtener una señal acotada en banda es a traves de realizar un
% filtrado sobre la señal en cuestion. Esto se basa en realizar una
% convolucion en tiempo discreto (lo que equivale a un producto en
% frecuencia). El filtrado nos permite eliminar las componentes en
% frecuencias que no deseamos. En nuestro ejercicio deseamos eliminar las
% componentes en frecuencia que superen la frecuencia de Nyquist, de modo
% tal de obtener la señal acotada en banda, para esto utilizaremos lo que
% denominaremos un filtro pasa bajos.

%% Ejercicio 3.B
% Banco de pruebas

function [] = ejercicio3()
%%
% Declaro los parámetros para realizar un juego de funciones, de tal forma
% de poder realizar la formulación de las conclusiones pedidas.

amplitud = 1;
frecuencia= 10;
offset = 0;
N = 100;
fs = 100;

phase = 0;
simet = 50;
duty  = 50;


%% Ejercicio 3.A - Señal Senoidal
[F_senoidal,t] = fsenoidal(amplitud, frecuencia, phase, offset, N, fs);

figure(1); set(gcf,'Name','Ejercicio 3'); 
subplot(3,1,1); plot(t,F_senoidal);
title('Funcion Senoidal'); 
xlabel('Tiempo[s]'); ylabel('Amplitud[V]'); grid;

f=0:fs/N:(N-1)*fs/N;
F_senoidal_t = my_dft(F_senoidal);

subplot(3,1,2); stem(f(1:length(F_senoidal_t)/2),abs(F_senoidal_t(1:length(F_senoidal_t)/2)));
title('Modulo de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); grid;

subplot(3,1,3); stem(f(1:length(F_senoidal_t)/2),angle(F_senoidal_t(1:length(F_senoidal_t)/2)));
title('Fase de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('fase x[f]'); grid;

%%
% Señal 1: La señal senoidal fue generada, a partir de a partir de los
% parámetros que se exponen a continuación, utilizando los algoritmos
% generados en el ejercicio 1.A del trabajo práctico presente.
%%
% * Amplitud: 1V
% * Fase    : 0 rad
% * Fo      : 10 Hz
% * Fs      : 100 Hz

% Se puede observar, que en el caso de la funcion senoidal, su transformada
% da un par de deltas en +/- la frecuencia de la señal, en este caso +/-
% 10Hz. Se observa que x(f) = 0 cuanfo f>fs/2 por lo tanto, como se
% esperaba, se trata de una señal acotada en banda.

%% Ejercicio 3.b - Señal Cuadrada

[F_cuadrada, t] = fcuadrada(amplitud, frecuencia, duty, offset, N, fs);

figure(2); set(gcf,'Name','Ejercicio 3'); 
subplot(3,1,1); plot(t,F_cuadrada);
title('Funcion Cuadrada'); 
xlabel('Tiempo[s]'); ylabel('Amplitud[V]'); grid;

f=0:fs/N:(N-1)*fs/N;
F_cuadrada_t = my_dft(F_cuadrada);

subplot(3,1,2); stem(f(1:length(F_cuadrada_t)/2),abs(F_cuadrada_t(1:length(F_cuadrada_t)/2)));
title('Modulo de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); grid;

subplot(3,1,3); stem(f(1:length(F_cuadrada_t)/2),angle(F_cuadrada_t(1:length(F_cuadrada_t)/2)));
title('Fase de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('fase x[f]'); grid;

%%
% Señal 2: La señal cuadrada fue generada, a partir de a partir de los
% parámetros que se exponen a continuación, utilizando los algoritmos
% generados en el ejercicio 1.A del trabajo práctico presente.
%%
% * Amplitud: 1V
% * Duty    : 50 %
% * Fo      : 10 Hz
% * Fs      : 100 Hz

% Del espectro obtenido queda verificado el analisis realizado en el primer
% punto del ejercicio. Podemos ver que esta señal no es acotada en banda
% (x(f) != 0 cuanfo f>fs/2. 

%% Ejercicio 3.c - Señal Triangular
[F_triangular, t] = ftriangular(amplitud, frecuencia, simet, offset, N, fs);

figure(3); set(gcf,'Name','Ejercicio 3'); 
subplot(3,1,1); plot(t,F_triangular);
title('Funcion Triangular'); 
xlabel('Tiempo[s]'); ylabel('Amplitud[V]'); grid;

f=0:fs/N:(N-1)*fs/N;
F_triangular_t = my_dft(F_triangular);

subplot(3,1,2); stem(f(1:length(F_triangular_t)/2),abs(F_triangular_t(1:length(F_triangular_t)/2)));
title('Modulo de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); grid;

subplot(3,1,3); stem(f(1:length(F_triangular_t)/2),angle(F_triangular_t(1:length(F_triangular_t)/2)));
title('Fase de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('fase x[f]'); grid;
%%
% Señal 1: La señal senoidal fue generada, a partir de a partir de los
% parámetros que se exponen a continuación, utilizando los algoritmos
% generados en el ejercicio 1.A del trabajo práctico presente.
%%
% * Amplitud: 1V
% * Simetría: 50 %
% * Fo      : 10 Hz
% * Fs      : 100 Hz
%%
% Al igual que en el caso de la funcion cuadra, esta señal tampoco resulta
% acotada en banda, validando los conceptos dados en el primer punto del
% ejercicio.

end








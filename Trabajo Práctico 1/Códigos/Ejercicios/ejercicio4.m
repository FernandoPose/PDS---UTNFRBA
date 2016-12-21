%% Ejercicio 4
%%
%% Enunciado 
% # Verifique el efecto del leakage para una senoidal de f = fn *df siendo
% fn = round(N/4) y luego para fn = fn + di; siendo di = [0.01, 0.025,
% 0.5].
% # Verifique que ocurre si a la señal se le agregan ceros para prolongar
% su duracion. Es decir si la señal tiene N muestras, agregue Mj ceros
% siendo Mj = [N/10, N, 10*N]
% # ¿Ha variado la resolucion espectral en los casos de 3.B?¿Cual es el
% efecto que se produce en cada caso? Esta tecnica se conoce como Zero
% Padding.


%%
% El efecto de leakage esta presente siempre en la señales del mundo real,
% el mismo aparece cuando la frecuencia de la señal es distinta de k* fs/N
% siendo fs la frecuencia de sampleo, N la cantidad de muestras que se
% utilizan y k un numero entero entre 1 y N, es decir que no contamos con
% la resulocion suficiente para resolver. Este efecto se puede apreciar al
% ver el espectro resultante donde la energia que tiene la señal original
% se distribuye al rededor de la componente principal, pero ya no coincide
% con esta. Este efecto trae asociado entre otras cosas, error en la
% medicion de amplitud. A continuacion se desarrola un script que permite
% verificar el efecto.

%% Ejercicio 4 Parámetros
% Banco de prueba
function [] = ejercicio4()

%%
% Declaro los parámetros para realizar un juego de funciones, de tal forma
% de poder realizar la formulación de las conclusiones pedidas.

amplitud = 1;
offset = 0;
N = 100;
fs = 100;
phase = 0;

df = fs/N; 

%% 

fn = round(N/4) ;
fx = 1;

%% Ejercicio 4.A - Verificación del efecto del leakage

%% 
% *Señal fo = round(N/4) * df*

fo_1 = fn * df;
[F_senoidal,t] = fsenoidal(amplitud, fo_1, phase, offset, N, fs);
ploteo_ejercicio4(F_senoidal, fs, N, fo_1, fx);
fx = fx + 1;

%%
% En este primer ejemplo se puede ver que f es igual a k * fs/N cuando se
% tiene k = 25 que se encuentra dentro de los valores que puede tener K.
% Debido a esto no se tiene efecto de leakage o desparramo por lo que, el
% espectro obtenido se condice con la teoria.

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,01*

di = 0.01;
fn_aux = fn + di;
fo_2 = fn_aux * df;

[F_senoidal,t] = fsenoidal(amplitud, fo_2, phase, offset, N, fs);
ploteo_ejercicio4(F_senoidal, fs, N, fo_2, fx);
fx = fx + 1;

%%
% En este ejemplo, la frecuencia de la señal aumenta en una centesima, si
% bien aparece un efecto de leakage, el mismo no se visualiza tan
% facilmente como si sera el caso de las proximas señaes.

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,25*

di = 0.25;
fn_aux = fn + di;
fo_3 = fn_aux * df;

[F_senoidal,t] = fsenoidal(amplitud, fo_3, phase, offset, N, fs);
ploteo_ejercicio4(F_senoidal, fs, N, fo_3, fx);
fx = fx + 1;

%%
% Se puede observar en la señal que se muestra que K = 25,250 este no es un
% numero entero entre los valores posibles que puede tomar K por lo que
% aparece el efecto que se esta estudiando, por lo cual la energia comienza
% a repartirse por el espectro al rededor de la componente mas energetica.

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,5*

di = 0.5;
fn_aux = fn + di;
fo_4 = fn_aux * df;

[F_senoidal,t] = fsenoidal(amplitud, fo_4, phase, offset, N, fs);
ploteo_ejercicio4(F_senoidal, fs, N, fo_4, fx);
fx = fx + 1;

%%
% Finalmente en este caso se repite nuevamente el mismo efecto mensionado
% en las anteriores dos señales, con la diferencia de que ahora las
% componentes de frecuencias al rededor de la componente principal
% contendran mayor nivel energetico.

%% Ejercicio 4.B - Técnica Zero Padding
% Para disminuir el efecto de leakage se puede aplicar la tecnica conocida
% como Zero Padding a la señal. Esta tecnica se basa en agregar ceros a la
% señal de modo tal de aumentar N y por lo tanto aumentar la resolucion del
% espectro. Al realizar esta tecnica y acercar los bins, esto trae como
% conseuencia inmediata (en el caso de que no se aumente el tiempo entre
% muestras) un aumento en la frecuencia de la señal.

%%
% *Agrego N/10 Ceros*

M = zeros(N/10,1);
%%
% *Señal fo = round(N/4) * df*

[F_senoidal,t] = fsenoidal(amplitud, fo_1, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_1, fx);
fx = fx + 1;

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,01*

[F_senoidal,t] = fsenoidal(amplitud, fo_2, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_2, fx);
fx = fx + 1;

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,25*

[F_senoidal,t] = fsenoidal(amplitud, fo_3, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_3, fx);
fx = fx + 1;

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,5*

[F_senoidal,t] = fsenoidal(amplitud, fo_4, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_4, fx);
fx = fx + 1;

%% 
% *Agrego N Ceros*

M = zeros(N,1);

%% 
% *Señal fo = round(N/4) * df*

[F_senoidal,t] = fsenoidal(amplitud, fo_1, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_1, fx);
fx = fx + 1;

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,01*

[F_senoidal,t] = fsenoidal(amplitud, fo_2, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_2, fx);
fx = fx + 1;

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,25*

[F_senoidal,t] = fsenoidal(amplitud, fo_3, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_3, fx);
fx = fx + 1;

%%
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,5*

[F_senoidal,t] = fsenoidal(amplitud, fo_4, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_4, fx);
fx = fx + 1;

%% 
% *Agrego 10*N Ceros*

M = zeros(10*N,1);

%% 
% *Señal fo = round(N/4) * df*

[F_senoidal,t] = fsenoidal(amplitud, fo_1, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_1, fx);
fx = fx + 1;

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,01*

[F_senoidal,t] = fsenoidal(amplitud, fo_2, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_2, fx);
fx = fx + 1;

%% 
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,25*

[F_senoidal,t] = fsenoidal(amplitud, fo_3, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_3, fx);
fx = fx + 1;

%%
% *Señal fo = (round(N/4)+di) * df  siendo di = 0,5*

[F_senoidal,t] = fsenoidal(amplitud, fo_4, phase, offset, N, fs);
F_senoidal_b = [F_senoidal' M'];
ploteo_ejercicio4(F_senoidal_b', fs, (N+length(M)), fo_4, fx);
fx = fx + 1;

%%
% Como conclusion es interesante agregar a lo ya explicado que a medida que
% se aumenta la cantidad de muestras, motivo por el cual disminuye la
% resolucion espectral, las amplitudes de las componentes en el espectro
% van cada vez siendo menores. Esto es debido a que se debe siempre
% conservar la energia de la señal (ver teorema de Parseval)

end


%% Ejercicio 4  - Código: Ploteo de espéctros
%
%	\fn [] = ploteo_ejercicio4(F_senoidal, fs, N, fo, fx)
%	\brief Funcion que plotea los espectros correspondientes al ejercicio 4
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.26
%   \param F_senoidal - Vector con la señal a plotear
%   \param fs         - Frecuencia de sampleo
%   \param N          - Numero de muestras de F_senoidal
%   \param fo         - Frecuencia de la señal
%   \param fx         - Numero de imagen

function [] = ploteo_ejercicio4(F_senoidal, fs, N, fo, fx)

f=0:fs/N:(N-1)*fs/N;

figure(fx);
subplot(2,1,1); plot(F_senoidal);
title(['Funcion senoidal de fo = ' sprintf('%3.3f',fo) ' Hz']); 
xlabel('Frecuencia[Hz]'); ylabel('Amplitud'); grid;

F_senoidal_t = my_dft(F_senoidal);

subplot(2,1,2); stem(f(1:length(F_senoidal_t)/2),abs(F_senoidal_t(1:length(F_senoidal_t)/2)));
title('Modulo de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); grid;

end
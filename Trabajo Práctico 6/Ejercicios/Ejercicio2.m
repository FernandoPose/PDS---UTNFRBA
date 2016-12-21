%% Ejercicio 2
%%
%% Enunciado 
% Repetir el punto 1 de manera tal que la función de remuestreo elija
% factorización de M y L más adecuada en tanto a:
%%
% # Costo computacional. Proporcional a la cantidad de coeficientes
% empleada por los filtros antialias (ver la función firpmord, rat y
% factor).
% # Memoria intermedia máxima requerida.
%%
% El costo computacional es proporcional a la longitud de cada filtro (que
% predice firmord). Es decir que habiendo M caminos posibles para hacer el
% cambio de frecuencia de muestreo, por ejemplo:
% L: 3 3 5 (45)
% M: 2 7   (14)
% Se podria pensar también por medio de los siguientes caminos (ver
% enunciado) y en esos casos elegir por el de menor costo.
%% 
% * fs1 = 250  Hz
% * fs1 = 2000 Hz
% * fs1 = 1100 Hz
% * fs1 = 180  Hz
% * fs1 = 999  Hz
%%
% Recordar que la fs del ECG es de 1000Hz. Para cada situación mostrar un
% segmento de 2 segundos del principio, parte media y final de cada
% registro. Comparar las 5 situaciones evidenciando la densisdad de
% muestras en cada señal.
%%

%% Frecuencias de muestreo:

fs1 = 250;
fs2 = 2000;
fs3 = 1100;
fs4 = 180;
fs5 = 999;

fp = 1;

% Cargo la señal ECG - Trabajo Practico 4

load('TP3_ecg.mat');
Signal = ecg_lead;
fs = 1000;

tol = 1e-9;

%% Frecuencia de sampleo: fs = 1000 Hz : Fs1 = 250 Hz
tic;
fp = FuncEjercicio1(Signal,fs,fs1,tol,fp);
t_fs250 = toc
%% Frecuencia de sampleo: fs = 1000 Hz : Fs1 = 2000 Hz
%tic;
%fp = FuncEjercicio1(Signal,fs,fs2,tol,fp);
%t_fs2000 = toc
%% Frecuencia de sampleo: fs = 1000 Hz : Fs1 = 1100 Hz
%tic;
%fp = FuncEjercicio1(Signal,fs,fs3,tol,fp);
%t_fs1100 = toc
%% Frecuencia de sampleo: fs = 1000 Hz : Fs1 = 180 Hz
%fp = FuncEjercicio1(Signal,fs,fs4,tol,fp);

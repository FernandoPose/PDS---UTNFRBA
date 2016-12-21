%% Ejercicio 1
%%
%% Enunciado 
% Implementar las funciones que realicen la interpolación por L, el
% diezmado por M y el cambio de frecuencia de muestreo de una señal. Probar
% su funcionamiento con una de las señales de ECG provistas en el TP4,
% cambiando su frecuencia de muestreo a:
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



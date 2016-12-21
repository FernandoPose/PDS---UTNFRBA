%% Ejercicio 3
%%
%% Enunciado 
% Realizar las optimizaciones computacionales polyphase para las 3
% funciones del punto 2. Comparar el tiempo de ejecución para cada
% situación del punto 1 y del punto 2.
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

%Frecuencia de sampleo: fs = 1000 Hz : Fs1 = 250 Hz
tic;
fp = FuncEjercicio3(Signal,fs,fs1,tol,fp);
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

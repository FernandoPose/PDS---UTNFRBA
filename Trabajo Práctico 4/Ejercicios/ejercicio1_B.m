function [] = ejercicio1_B()

fc = 1;

% Declaro los parametros de la señal de tres componentes:

amp    = 1;
offset = 0;
N      = 100;
fs     = 100;
phase  = 0;

% Resolucion espectral:

df = fs/N;
f=0:fs/N:(N-1)*fs/N;
t = 0:1/fs:(N-1)*1/fs;

% Frecuencias de c/u de las componentes de la señal:

fo_1   = (3  * df) + (0.5 * df);
fo_2   = (5  * df) + (0.5 * df);
fo_3   = (10 * df) + (0.5 * df);

signal_1 =  fsenoidal(amp, fo_1, phase, offset, N, fs);
signal_2 =  fsenoidal(amp, fo_2, phase, offset, N, fs);
signal_3 =  fsenoidal(amp, fo_3, phase, offset, N, fs);


% Obtengo la señal con la que voy a trabajar:

signal = signal_1 + signal_2 + signal_3;

% Ploteo y espectro de la señal tritonal:

fc = plot_espc_signal(signal, N, f, t, fc);

% Obtencion de los filtros:

LowPass  = get_hw(N,0,6);
HighPass = get_hw(N,4,N);
BandPass = get_hw(N,4,6);

% Ploteo de las funciones transferencias: Pasa bajos, Pasa altos y Pasa
% banda

fc = plot_hw(LowPass, HighPass, BandPass,N,f, fc);


% Obtengo las salidas del sistema aplicando los filtros realizados y ploteo
% en el dominio de la frecuencia.

[Y_L,fc] = get_out_frec(signal,LowPass,N,f,fc);
[Y_H,fc] = get_out_frec(signal,HighPass,N,f,fc);
[Y_B,fc] = get_out_frec(signal,BandPass,N,f,fc);

% Obtengo la salida del sistema y ploteo en función del tiempo.

y_l = N * ifft(Y_L);
y_h = N * ifft(Y_H);
y_b = N * ifft(Y_B);
fc  = plot_signal_filter_temp(y_l, y_h, y_b, t, fc);

end



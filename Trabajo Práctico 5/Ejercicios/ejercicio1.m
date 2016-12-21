function [] = ejercicio1()

fc = 1;

% Genero la señal de entrada de prueba

% Declaro los parametros de la señal de tres componentes:

amp    = 1;
offset = 0;
N      = 100;
fs     = 500;
phase  = 0;

% Resolucion espectral:

df = fs/N;
f=0:fs/N:(N-1)*fs/N;
t = 0:1/fs:(N-1)*1/fs;

% Frecuencias de c/u de las componentes de la señal:

fo_1   = 50;
fo_2   = 100; 
fo_3   = 150;

signal_1 =  fsenoidal(amp, fo_1, phase, offset, N, fs);
signal_2 =  fsenoidal(amp, fo_2, phase, offset, N, fs);
signal_3 =  fsenoidal(amp, fo_3, phase, offset, N, fs);


% Obtengo la señal con la que voy a trabajar:


signal = signal_1 + signal_2 + signal_3;

% Ploteo y espectro de la señal tritonal:

fc = plot_espc_signal(signal, N, f, t, fc);


% Filtro: BandPass
% Tipo: Butterworth
% Fs: 500Hz
% Fstop1: 80Hz  Fpass1: 90Hz
% Fstop2: 110Hz  Fpass2: 120dB
% Astop: 100dB Apass: 1dB

Fs = 500;  % Sampling Frequency

Fstop1 = 80;          % First Stopband Frequency
Fpass1 = 90;          % First Passband Frequency
Fpass2 = 110;         % Second Passband Frequency
Fstop2 = 120;         % Second Stopband Frequency
Astop1 = 100;         % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 30;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);


[B,A] = sos2tf(Hd.sosMatrix,Hd.ScaleValues);

%Ploteo la respuesta al impulso del filtro

freqz(Hd);
fc = fc + 1;

% Aplico el filtro a la señal:

OutFilt   = filter(Hd,signal);
OutMyFilt = MyDirectFrom(signal,B,A);

% Función Matlab

fc = plot_senal_espectro(signal,OutFilt,N,f,t, fc);

% Función Propia:

fc = plot_senal_espectro(signal,OutMyFilt,N,f,t, fc);


end




























function [] = ejercicio2()

fc = 1;

load('TP5_ECG.mat');

Fs = 1000;  % Sampling Frequency

% All frequency values are in Hz.

Fstop1 = 0.01;        % First Stopband Frequency
Fpass1 = 0.1;         % First Passband Frequency
Fpass2 = 35;          % Second Passband Frequency
Fstop2 = 50;          % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly


h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
                  
% Butterworth Bandpass filter
Butterworth = design(h, 'butter', 'MatchExactly', match);
        
% Chebyshev Type I Bandpass filter
ChebyshevI = design(h, 'cheby1', 'MatchExactly', match);
            
% Chebyshev Type II Bandpass filter
ChebyshevII = design(h, 'cheby2', 'MatchExactly', match);

% Elliptic Bandpass filter
Elliptic = design(h, 'ellip', 'MatchExactly', match);

%% Ploteo de los filtros.
%% Módulo
h = fvtool(Butterworth, ChebyshevI, ChebyshevII, Elliptic);
set(h, 'Legend', 'on');
legend(h, 'Butterworth', 'Chebychev 1', 'Chebychev 2', 'Eliptico');

%% Fase
set(h,'Analysis','phase')   % Change display to phase plot
set(h,'Legend','on')         % Turn legend on
legend(h, 'Butterworth', 'Chebychev 1', 'Chebychev 2', 'Eliptico');



%% Ploteo de la señal de ECG - Sin procesar

% Ploteo el ECG sin filtrar

figure(fc)

% Ploteo de señal de ECG - Tiempo
subplot(2,1,1); plot(4e5:4.02e5,ECG1(4e5:4.02e5));
xlabel('n'), ylabel('Amplitud'); 
title('ECG Antes de procesar');
% Ploteo de señal ECG - Frecuencia

subplot(2,1,2);
ECG1_tf = 2 / length(ECG1) * fft(ECG1);
plot(abs(ECG1_tf(1:length(ECG1_tf)/2)));
xlabel('w(n)'); ylabel('Amplitud(w)');
title('Espectro del ECG Antes de procesar');
 
fc = fc + 1;

%% Filtrado de la señal de ECG - Butterworth (Sin correccion de fase)

% Fltro con Butterworth e introduzco defasaje en la señal.
ECG1_filter = filter(Butterworth,ECG1);
fc = ploteo_2(ECG1,ECG1_filter,fc);

%% Filtrado de la señal de ECG - ChebyshevI (Sin correccion de fase)

ECG1_filter = filter(ChebyshevI,ECG1);
fc = ploteo_2(ECG1,ECG1_filter,fc);

%% Filtrado de la señal de ECG - Chebyshev Type II (Sin correccion de fase)

% Fltro con Butterworth e introduzco defasaje en la señal.
ECG1_filter = filter(ChebyshevII,ECG1);
fc = ploteo_2(ECG1,ECG1_filter,fc);

%% Filtrado de la señal de ECG - Elliptic (Sin correccion de fase)

% Fltro con Butterworth e introduzco defasaje en la señal.
ECG1_filter = filter(Elliptic,ECG1);
fc = ploteo_2(ECG1,ECG1_filter,fc);


%% Aplicando las correcciones de fase:

%% Filtrado de la señal de ECG - Butterworth (Con correccion de fase)

ECG1_filter = filter(Butterworth,flipud(ECG1));
ECG1_filter = filter(Butterworth,flipud(ECG1_filter));
fc = ploteo_2(ECG1,ECG1_filter,fc);

%% Filtrado de la señal de ECG - ChebyshevI (Con correccion de fase)

ECG1_filter = filter(ChebyshevI,flipud(ECG1));
ECG1_filter = filter(ChebyshevI,flipud(ECG1_filter));
fc = ploteo_2(ECG1,ECG1_filter,fc);

%% Filtrado de la señal de ECG - ChebyshevII (Con correccion de fase)

ECG1_filter = filter(ChebyshevII,flipud(ECG1));
ECG1_filter = filter(ChebyshevII,flipud(ECG1_filter));
fc = ploteo_2(ECG1,ECG1_filter,fc);

%% Filtrado de la señal de ECG - Elliptic (Con correccion de fase)

ECG1_filter = filter(Elliptic,flipud(ECG1));
ECG1_filter = filter(Elliptic,flipud(ECG1_filter));
fc = ploteo_2(ECG1,ECG1_filter,fc);




%% Parte 2
% Trabajando con el filtrado de Butterworth sin fase corregida.

% Energia de la señal de ECG sin procesar:

ECG1_filter = filter(Butterworth,ECG1);

EnergiaTotal = sum(abs(fft(ECG1)));
EnergiaConProc = sum(abs(fft(ECG1_filter)));
EnergiaPerdida = EnergiaTotal - EnergiaConProc;

disp('La energia total del ECG es:');
disp(EnergiaTotal);
disp('La energia total luego de procesar del ECG es:');
disp(EnergiaConProc);
disp('La energia perdida al procesar la señal es:');
disp(EnergiaPerdida);
EnergiaPerdida = 100 * (EnergiaPerdida/EnergiaTotal);
disp('El porcentaje de energia perdido de señal es:');
disp(EnergiaPerdida);


%% Mitigo problema de item 2:

Fstop1 = 0.001;        % First Stopband Frequency
Fpass1 = 0.01;         % First Passband Frequency
Fpass2 = 100;         % Second Passband Frequency
Fstop2 = 120;         % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Butterworth = design(h, 'butter', 'MatchExactly', match);

ECG1_filter = filter(Butterworth,ECG1);

EnergiaTotal = sum(abs(fft(ECG1)));
EnergiaConProc = sum(abs(fft(ECG1_filter)));

EnergiaPerdida = EnergiaTotal - EnergiaConProc;
EnergiaPerdida = 100 * (EnergiaPerdida/EnergiaTotal);
disp('El porcentaje de energia perdido de señal es:');
disp(EnergiaPerdida);


%% Parte 3


% Señal de ECG general.

Fstop1 = 1;        % First Stopband Frequency
Fpass1 = 1.5;         % First Passband Frequency
Fpass2 = 40;          % Second Passband Frequency
Fstop2 = 45;          % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Butterworth = design(h, 'butter', 'MatchExactly', match);

ECG1_filter = filter(Butterworth,flipud(ECG1));
ECG1_filter = filter(Butterworth,flipud(ECG1_filter));

fc = ploteo_2B(ECG1,ECG1_filter,fc);


%% Parte 4

% Linea de base.

Fstop1 = 1;           % First Stopband Frequency
Fpass1 = 1.1;         % First Passband Frequency
Fpass2 = 100;         % Second Passband Frequency
Fstop2 = 120;         % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Butterworth = design(h, 'butter', 'MatchExactly', match);

ECG1_filter = filter(Butterworth,flipud(ECG1));
ECG1_filter = filter(Butterworth,flipud(ECG1_filter));

fc = ploteo_2B(ECG1,ECG1_filter,fc);

end







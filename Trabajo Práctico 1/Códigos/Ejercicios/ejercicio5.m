%% Ejercicio 5
%%
%% Enunciado 
% Compare el tiempo de ejercución de la DFT implementada en 2 con la FFT en
% función del tamaño de la señal N. Puede utilizar las funciones tic y toc
% de Matlab. Grafique el tiempo de ejercución de ambas señales.

%%
% Algunos de los problemas que se pueden observar al realizar una DFY es la
% de un costo computacional elevado dado que se deben realizar N^2
% multiplicaciones y (N-1)^2 sumatorias. El objetivo de este ejercicio es
% realizar una comparativa en tiempos entre realizar una DFT o una FFT
% sobre una señal. 
%%
% Para realizar la comparativa antes dicha se utilizara una señal senoidal
% generada con las funciones creadas en el ejercicio 1 del trabajo practico
% cuayos parametros se describen a continuacion:
%%
% * Amplitud   = 1V
% * Frecuencia = 10Hz
% * Offset     = 0
% * fs         = 100
% * phase      = 0
% * N          = 20:20:200
%%
% Luego se desarrollaran las conclusiones.

%% Ejercicio 5 
% Banco de pruebas

function [] = ejercicio5()

% Declaro los parámetros para realizar realizar una función senoidal que me
% permita verificar los tiempos necesarios para realizar una DFT y una FFT
% y así poder realizar una comparación entre las mismas.

amplitud = 1;
frecuencia= 10;
offset = 0; 
fs = 100;
phase = 0;

N = 20:20:200;

    for i=1:length(N)

        [F_senoidal,t] = fsenoidal(amplitud, frecuencia, phase, offset, N(i), fs);

        % Tiempo DFT

        tic;
        F_senoidal_t = my_dft(F_senoidal);
        t_dft = toc;

        % Tiempo FFT

        tic;
        F_senoidal_t = fft(F_senoidal);
        t_fft = toc;

        time_dft(i) = t_dft;
        time_fft(i) = t_fft;
    end
%%
    ejercicio5_ploteo(time_dft, time_fft, N);
end

%%
% De los resultados obtenidos se puede notar que a medida que la cantidad
% de muestras aumenta el tiempo en realizar la DFT sobre la señal estudiada
% aumenta de forma exponencial en comparacion al tiempo en aplicar la FFT
% sobre la misma señal. Por lo que nos permite concluir en que realizar una
% FFT en una cantidad de muestras considerable ( un numero mayo de 64
% muestras suele considerarse) sera mas practico y de menor costo
% computacional que realizar una DFT.

%%
% Finalmente se deja expuesto, a modo informativo, la cantidad de
% multiplcaciones que debe llevar a cabo una DFT por cada una
% multiplizacion que realiza la FFT:

%%
% * N = 256        => DFT: 64  multiplicaciones / FFT: 1 multiplicacion
% * N = 1 048 576  => DFT: 205 multiplicaciones / FFT: 1 multiplicacion
% * N = 16 777 216 => DFT: 683 multiplicaciones / FFT: 1 multiplicacion


%% Ejercicio 5 - Código: Ploteo de Gráficos
%
%	\fn [] = ejercicio5_ploteo(time_dft, time_fft, N)
%	\brief Plotea DFT, FFT y DFT - FFT 
%	\details Plotea los tiempos en función de las muestras que tiene
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.29

function [] = ejercicio5_ploteo(time_dft, time_fft, N)
figure(1); set(gcf,'Name','Ejercicio 4'); 
subplot(3,1,1); plot(N,time_dft);
title('Tiempo de la DFT '); 
ylabel('Tiempo'); grid;

subplot(3,1,2); plot(N,time_fft);
title('Tiempo de la FFT '); 
ylabel('Tiempo'); grid;

subplot(3,1,3); plot(N,time_dft-time_fft);
title('Diferencia de tiempos DFT - FFT '); 
ylabel('Tiempo'); grid;

end



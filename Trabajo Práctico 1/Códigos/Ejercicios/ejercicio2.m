%% Ejercicio 2
%%
%% Enunciado 
% Implemente un algoritmo que calcule la transformada discreta de Fourier(DFT).

%% Ejercicio 2
% Banco de pruebas.

function [] = ejercicio2()

%% 
% Declaro los parámetros para realizar una funcion, senoidal en este caso y
% a partir de la misma probar el algoritmo desarrollado para calcular la
% Transformada Discreta de Fourier.

amplitud = 1;
frecuencia= 10;
offset = 0;
N = 100;
fs = 100;
phase = 0;
 
%% 
[F_senoidal,t] = fsenoidal(amplitud, frecuencia, phase, offset, N, fs);
%% 

f=0:fs/N:(N-1)*fs/N;

%%
% Es importante destacar bajo que condiciones trabaja el algoritmo de la
% DFT para saber a que tipo de señales se le puede aplicar esta
% transformada. La DFT requiere que la funcion de entrada sea una secuencia
% discreta y de duracion finita. Dicha secuencia se suele generar a partir
% del muestreo de una funcion continua (ejercicio 1). Esta transformada
% unicamente evalua las suficientes componentes frecuenciales para
% reconstruir un segmento finito que se analiza, en otras palabras, el
% segmento que se analiza es un unico periodo de una señal periodica que se
% extiende de forma infinita.
%%
% Como resumen a lo dicho entonces, se dice que la DFT puede aplcarse
% siempre que la señal X[n] sea discreta, de duracion finita y con X[n]=0
% para No<n<0 donde N es el largo del array y N son la cantidad de puntos
% del espectro a calcular.

F_senoidal_t = my_dft(F_senoidal);

%% 
figure(1); set(gcf,'Name','Ejercicio 2'); 
subplot(3,1,1); plot(t,F_senoidal);
title('Funcion Senoidal'); 
xlabel('Tiempo[s]'); ylabel('Amplitud[V]'); grid; 

subplot(3,1,2); stem(f(1:length(F_senoidal_t)/2),abs(F_senoidal_t(1:length(F_senoidal_t)/2)));
title('Modulo de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); 

subplot(3,1,3); stem(f(1:length(F_senoidal_t)/2),angle(F_senoidal_t(1:length(F_senoidal_t)/2)));
title('Fase de la Transformada de Fourier Discreta'); 
xlabel('Frecuencia[Hz]'); ylabel('fase x[f]'); 

%%
% Se puede observar que el espectro resultante, es un delta a la frecuencia
% de la señal. En este caso, la señal es un tono de 10Hz (señal senoidal).
% El caso de una señal cuadrada y triangular se estudiara en el ejercicio 3
% del presente trabajo practico.

end

%% Ejercicio 2 - Códigos
% A continuación se exíme el código generado para desarrollar la DFT de una
% señal.

%% Ejercicio 2 - Codigo: Transformada discreta de Fourier (DFT)
%
%	\fn output = my_dft(samples)
%	\brief Realiza la DFT de samples
%	\details Samples debe ser un vector columna
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.17
%	\param Samples - Vector con muestras de la señal
%	\return output - Vector columna con la DFT de la señal	
%**

function output = my_dft(samples)
    
    N =length(samples);
    
    exponente = zeros(N,1);
    
    samples = samples';
    n = 1:1:N;
    
    exponente(n,1) = exp(-2* 1j * pi *n/N);
  
    for k=0:1:N-1
        output(k+1) = samples*(exponente.^k); 
    end
    output = output * 1/N;
    output = output';
end
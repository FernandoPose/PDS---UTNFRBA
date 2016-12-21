%% Ejercicio 1
%%
%% Enunciado 
% # Realizar las funciones necesarias para generar las siguientes señales:
%% 
% * Senoidal.   (Parametros: fase(radianes))
% * Cuadrada.   (parámetros: ciclo de actividad (%) )
% * Triangular. (parámetros: punto de simetría (%) )
%%
% Nota: Los parametros comunes a todas seran:
%%
% * frecuencia de muestreo (Hz),
% * frecuencia de la onda (Hz),
% * amplitud (# samples)
% * cantidad de muestras N.
%% 
% Es decir que se podría invocar la señal que genere la senoidal como:
%%
% *signal = sinusoidal_func_name( 1000, 100, 1, 1000, pi/2);*
%%
% Siendo una senoidal muestreada a 1000 Hz, de 100 Hz, amplitud unitaria, de
% 1000 muestras y con una fase de pi/2 radianes.
%%
% # Genere señales de ej para corroborar el correcto funcionamiento 
% # Probar dichas señales que estén comprendidas en el rango de 0.1 fs
% hasta 1.1 fs de distintas amplitudes y fases. Al menos 4 señales de cada
% tipo. Compruebe los efectos del aliasing al aproximar y/o sobrepasar
% fs/2. Grafique las señales y discuta los resultados respecto a:
%% 
%   i. Frecuencia esperada – frecuencia obtenida
%   ii. Fase


%% Ejercicio 1.A 
% Banco de pruebas

function [] = ejercicio1_a()

% Declaro los parámetros para realizar un juego de funciones, con el
% objetivo de probar el correcto funcionamiento de las funciones pedidas.

amplitud = 1;
frecuencia= 10;
offset = 0;
N = 100;
fs = 100;

phase = 0;
simet = 50;
duty  = 50;

%% Ejercicio 1.A - Señal Senoidal
% Si bien la función senoidal retorna un vector con las muestras de la
% señal, objetivo del ejercicio, se incluye un vector tiempo el cual
% contiene los valores de tiempo a los cuales se fueron tomando dichas
% muestras. Este último se retorna con el objetivo de poder graficar la
% señal muestras en función del tiempo de las mismas.


[F_senoidal,t] = fsenoidal(amplitud, frecuencia, phase, offset, N, fs);

figure(1); set(gcf,'Name','Ejercicio 1a'); 
plot(t,F_senoidal);
title('Funcion Senoidal'); 
xlabel('Tiempo[seg]'); ylabel('Amplitud[V]'); grid;

%% 
% En la figura se puede observar una señal senoidal: amplitud = f(tiempo)
% Siendo los parámetros de la misma los que se detallan a continuación:
%% 
% * Amplitud               = 1
% * Frecuencia de la señal = 10
% * Offset                 = 0
% * N                      = 100
% * fs                     = 100
% * phase                  = 0
%% 


%% Ejercicio 1.A - Señal Cuadrada
% Nuevamente, al igual que en el caso de la señal senoidal, la función
% retorna dos parámetros, en el primero (F_cuadrada) se encontrarán las
% muestras de la señal cuadrada y en el segundo parámetro (t) se podrá
% encontrar los tiempos a los que se encuentran tomadas dichas muestras.

[F_cuadrada, t] = fcuadrada(amplitud, frecuencia, duty, offset, N, fs);

figure(2); set(gcf,'Name','Ejercicio 1a');  
plot(t,F_cuadrada);
title('Funcion Cuadrada'); 
xlabel('Tiempo[seg]'); ylabel('Amplitud[V]'); grid;

%% 
% En la figura se puede observar una señal cuadrada: amplitud = f(tiempo)
% Siendo los parámetros de la misma los que se detallan a continuación:
%% 
% * Amplitud               = 1
% * Frecuencia de la señal = 10
% * Offset                 = 0
% * N                      = 100
% * fs                     = 100
% * duty                   = 50
%% 

%% Ejercicio 1.A - Señal Triangular
% En ésta función también vale lo comentado tanto para la señal senoidal,
% como la señal cuadrada. En ésta el primer parámetro (F_trinagular)
% contendrá las muestras de la señal triangular y el segundo parámetro (t)
% contendrá nuevamente los tiempos a los cuales fueron tomadas dichas
% muestras.

[F_triangular, t] = ftriangular(amplitud, frecuencia, simet, offset, N, fs);

figure(3); set(gcf,'Name','Ejercicio 1a');  
plot(t,F_triangular);
title('Funcion Triangular'); 
xlabel('Tiempo[seg]'); ylabel('Amplitud[V]'); grid;

%% 
% En la figura se puede observar una señal triangular: amplitud = f(tiempo)
% Siendo los parámetros de la misma los que se detallan a continuación:
%% 
% * Amplitud               = 1
% * Frecuencia de la señal = 10
% * Offset                 = 0
% * N                      = 100
% * fs                     = 100
% * Simetria               = 50

end

%% Ejercicio 1.A - Códigos
% A continuación se exímen los códigos generadores de las señales vistas en
% la parte A del ejercicio.

%% Ejercicio 1.A - Código: Función Cuadrada
%
%	\fn output = fcuadrada(amp, fo, ciclo, offset, N, fs)
%	\brief Genera una señal cuadrada
%	\details Los parametros son ingresados por el usuario
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.19
%	\param Amplitud - Amplitud de la señal  
%	\param fo       - Frecuencia de la señal
%	\param duty     - Ciclo de actividad
%	\param offset   - Offset de la señal    
%	\param N        - Numero de muestras de la señal
%	\param fs       - Frecuencia de muestreo de la señal
%	\return output  - Vector con la señal cuadrada	
%   \return x_temp  - Vector temporal:muestra

function [output, x_temp] = fcuadrada(amplitud, fo, duty, offset, N, fs)
    
    aux_y = zeros(N,1);
       
    x_temp = 0:1/fs:(N-1)*(1/fs);  
    to = 1/fo;
    
    duty = duty/100;
    
    for j=1:1:N
        if  rem(x_temp(j),to) < (duty*to)  
            aux_y(j) = 1;
        else
            aux_y(j) = 0;
        end
    end
    output = amplitud * aux_y + offset;
end

%% Ejercicio 1.A - Código: Función Senoidal
%
%	\fn [output,x_temp] = fsenoidal(amp, fo, phase, offset, N, fs)
%	\brief Genera una señal senoidal
%	\details Los parametros son ingresados por el usuario
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.17
%	\param amp      - Amplitud de la señal
%	\param fo       - Frecuencia de la señal
%	\param phase    - Fase inicial de la señal
%	\param offset   - Offset de la señal
%	\param N        - Numero de muestras de la señal
%	\param fs       - Frecuencia de muestreo de la señal
%	\return output  - Vector con la señal senoidal	
%   \return x_temp  - Vector temporal:muestra

function [output,x_temp] = fsenoidal(amp, fo, phase, offset, N, fs)

    aux_y = zeros(N,1);
    x_temp = 0:1/fs:(N-1)*1/fs;

    for j =1:N
        aux_y(j,1) = offset + amp * sin(2*pi*fo*j/fs  + phase);
    end
    output = aux_y;
end

%% Ejercicio 1.A - Código: Función Triangular
%
%	\fn [output,x_temp] = ftriangular(amp, fo, ciclo, offset, N, fs)
%	\brief Genera una señal triangular
%	\details Los parametros son ingresados por el usuario
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.19
%	\param Amplitud - Amplitud de la señal  
%	\param fo       - Frecuencia de la señal
%	\param simet    - Punto de simetría
%	\param offset   - Offset de la señal    
%	\param N        - Numero de muestras de la señal
%	\param fs       - Frecuencia de muestreo de la señal
%	\return output  - Vector con la señal cuadrada	
%   \return x_temp  - Vector de tiempo:muestra
%**

function [output,x_temp] = ftriangular(amplitud, fo, simet, offset, N, fs)
    
    aux_y = zeros(N,1);
       
    x_temp = 0:1/fs:(N-1)*(1/fs);  
    to = 1/fo;
    
    to = 1/fo;
    
    simet = simet/100;
    
    for j=1:1:N
        if  rem(x_temp(j),to) < (simet*to)  
            aux_y(j) = (amplitud/(simet*to)) * rem(x_temp(j),to);
        else
            aux_y(j) = - amplitud / (to - (simet*to)) * (rem(x_temp(j),to) - (simet*to)) + amplitud; 
        end
    end
    output = aux_y + offset;
end







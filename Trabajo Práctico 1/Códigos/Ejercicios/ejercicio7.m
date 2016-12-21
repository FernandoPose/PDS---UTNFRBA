%% Ejercicio 7
%%
%% Enunciado 
% Simule el efecto de cuantizar una señal continua en el tiempo mediante un
% conversor analógico digital. Para ello analice señales determinísticas
% como las generadas en 1, y otras que varíen de forma más aleatoria, por
% ejemplo añadiendo ruido mediante random. Muestre un ejemplo
% representativo de cada uno de estos casos. Puede simular una señal
% continua mediante una señal muestreada a una fs muy alta en comparación
% con las fs que quiere estudiar, y un tipo de dato de cuantización para
% cada tamaño de muestra mediante:
%% 
% # La propia señal temporal y su espectro
% # Una descripción de la señal, por medio de su energía, valor medio, RMS
% # Un histograma de los valores que toma la señal
% # Una descripción del histograma, por medio de estadísticos como la
% media, desvío estándar y varianza.


%%
% # Nota: Se decidio separar el ejercicio en dos partes, una de señal
% determinística y una segunda parte para la señal no determinística.
% Dentro de cada parte se describe los valores caracteristicos "b" y "c",
% los ploteos de la señal temporal y sus espectros "a" y finalmente los
% histogramas "d".
% # Nota: Para una correcta visualización, se incluye el código a medida
% que se muestra la resolución para un nivel de cuantización de bits. Luego
% para 8 y 16 bit solo se muestran las imágenes y conclusiones debido a que
% es el mismo código con la única variacion de Nbit.

%% Ejercicio 7 - Parámetros
% Banco de prueba

function [] = ejercicio7 ()

% Parametros de prueba:
amplitud = 1;
fo = 1000;
fase = 0;
offset = 0;
N = 1000;
fs = 44000;

fx = 1;

%% Análisis con un nivel de cuantizacion de 4 bits
% A conotinuación se simula el efecto de cuantizar una señal con un nivel
% de cuntización de 4 bit. Se realiza además un análisis sobre el ruido de
% cuantización para dicho nivel.

Nbit = 4;
%%
fx = func_det(amplitud, fo, fase, offset, N, fs, Nbit, fx);
%%
fx = func_no_det(amplitud, fo, fase, offset, N, fs, Nbit, fx);

end



%% Ejercicio 7 - Código: Funcion deterministica
%
%	\fn [] = [fx] = func_det(amplitud, fo, fase, offset, N, fs, Nbit, fx)
%	\brief  Realiza el ejercicio a partir de una señal determinística
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  amplitud _ Amplitud de la señal
%   \param  fo       - Frecuencia de la señal 
%   \param  fase     - Fase inicial de la señal
%   \param  offset   - Offset de señal
%   \param  N        - Numero de muestras de la señal
%   \param  fs       - Frecuencia de sampleo de señal
%   \param  Nbit     - Número de cuantización de ADC
%   \param  fx       - Figura actual
%   \return fx       - Próxima figura
%	\date 2015.08.19

function [fx] = func_det(amplitud, fo, fase, offset, N, fs, Nbit, fx)

% Parámetros para el ADC:
K = 1;
Vref = 3.3;

% Parámetros para generar el ruido:
mu = 0;

% Preparo el ADC:
escalado_sup = (2^(Nbit-1))-1;
Resolucion = Vref/escalado_sup;

%Obtengo la señal deterministica - Ejercicio 1:
[y,t] = fsenoidal (amplitud, fo, fase, offset, N, fs);

Cuentas = y/Resolucion;
Sq_1 = round(Cuentas);
Sn_1 = Sq_1 - Cuentas; 
%% 
% Ploteo de gráficos
plot_ejercicio7(y,t,Sq_1,Sn_1,fx);
fx = fx + 1;
%% 
% Analisis de la señal: energia, valor medio y valor eficaz de la señal det.
disp('Señal deterministica: ');

%% 
% Datos de: Energía, valor medio y valor eficaz.
[Energia V_medio V_eficaz] = datos_EVV(y);
%% 

%% 
% *Energia:*
disp(['El valor de energia es: ' num2str(Energia) ' Joule']);
%% 
% *Valor Medio:*
disp(['El valor medio es: ' num2str(V_medio) ' V']);
%% 
% *Valor Eficaz:*
disp(['El valor eficaz es: ' num2str(V_eficaz) ' V']);

%% 
% Histograma
%%
plot_ejercicio7_hist(Sn_1,fx);
fx = fx + 1;
%%
% Analisis del histograma: Media, desvio estandar y varianza.
disp('Análisis de Sn: ');
%%
[Energia V_medio V_eficaz Var Desvio] = datos_EVVVD(Sn_1);

%% 
% *Energia:*
disp(['El valor de energia es: ' num2str(Energia) ' Joule']);
%% 
% *Valor Medio:*
disp(['El valor medio es: ' num2str(V_medio) ' V']);
%% 
% *Valor Eficaz:*
disp(['El valor eficaz es: ' num2str(V_eficaz) ' V']);
%% 
% *Varianza:* 
disp(['La varianza es: ' num2str(Var)]);
%% 
% *Desvio estándar:*
disp(['El desvio es: ' num2str(Desvio)]);


end


%% Ejercicio 7 - Código: Funcion no deterministica
%
%	\fn [] = [fx] = func_no_det(amplitud, fo, fase, offset, N, fs, Nbit, fx)
%	\brief  Realiza el ejercicio a partir de una señal no determinística
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  amplitud _ Amplitud de la señal
%   \param  fo       - Frecuencia de la señal 
%   \param  fase     - Fase inicial de la señal
%   \param  offset   - Offset de señal
%   \param  N        - Numero de muestras de la señal
%   \param  fs       - Frecuencia de sampleo de señal
%   \param  Nbit     - Número de cuantización de ADC
%   \param  fx       - Figura actual
%   \return fx       - Próxima figura
%	\date 2015.08.19

function [fx] = func_no_det(amplitud, fo, fase, offset, N, fs, Nbit, fx)

% Parámetros para el ADC:
K = 1;
Vref = 3.3;

% Parámetros para generar el ruido:
mu = 0;

% Preparo el ADC:
escalado_sup = (2^(Nbit-1))-1;
Resolucion = Vref/escalado_sup;

% Armo el ruido que le sumo a la senoidal para hacer una señal no
% deterministica.

[y,t] = fsenoidal (amplitud, fo, fase, offset, N, fs);

x = randn (N,1);
y = y' + x' * amplitud/10 + mu;
Cuentas = y/Resolucion;
Sq_2 = round(Cuentas);
Sn_2 = Sq_2 - Cuentas; 

% Ploteo de gráficos
%%
plot_ejercicio7(y,t,Sq_2,Sn_2,fx);
fx = fx + 1;
%% 
% Analisis de la señal: energia, valor medio y valor eficaz de la señal det.
disp('Señal no deterministica: ');

%% 
% Datos de: Energía, valor medio y valor eficaz.
[Energia V_medio V_eficaz] = datos_EVV(y);
%% 
% *Energia:*
disp(['El valor de energia es: ' num2str(Energia) ' Joule']);
%% 
% *Valor Medio:*
disp(['El valor medio es: ' num2str(V_medio) ' V']);
%% 
% *Valor Eficaz:*
disp(['El valor eficaz es: ' num2str(V_eficaz) ' V']);

%%
% *Histograma*
plot_ejercicio7_hist(Sn_2,fx);
fx = fx + 1;
%% 
% Analisis del histograma: Media, desvio estandar y varianza.
disp('Análisis de Sn: ');
[Energia V_medio V_eficaz Var Desvio] = datos_EVVVD(Sn_2);

%% 
% *Energia:*
disp(['El valor de energia es: ' num2str(Energia) ' Joule']);
%% 
% *Valor Medio:*
disp(['El valor medio es: ' num2str(V_medio) ' V']);
%% 
% *Valor Eficaz:*
disp(['El valor eficaz es: ' num2str(V_eficaz) ' V']);
%% 
% *Varianza:* 
disp(['La varianza es: ' num2str(Var)]);
%% 
% *Desvio estándar:*
disp(['El desvio es: ' num2str(Desvio)]);


end


%% Ejercicio 7 - Código: Ploteo de señales.
%
%	\fn [] = plot_ejercicio7(y,t,Sq,Sn,fx)
%	\brief Plotea la señal y el espectro.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param y  - Señal
%   \param t  - Vector tiempo:muestra
%   \param Sq - Señal cuantificada
%   \param Sn - Señal error de cuantización
%   \param fx - Número de figura 
%	\date 2015.08.19


function [] = plot_ejercicio7(y,t,Sq,Sn,fx)

figure(fx); set(gcf,'Name','Ejercicio 7'); 
subplot(4,1,1); plot(t,y);
ylabel('Amplitud [V]'); 

subplot(4,1,2); plot(t,Sq);
title('Funcion deterministica cuantizada');
ylabel('Cuentas'); 

subplot(4,1,3); plot(t,Sn);
title('Error de cuantizacion');
ylabel('Cuentas');

subplot(4,1,4); stem(t,abs(Sn));
title('Espectro del error de cuantizacion');
xlabel ('Tiempo[s]'); ylabel('Cuentas');

end
%% 


%% Ejercicio 7 - Código: Ploteo de histograma.
%
%	\fn [] = plot_ejercicio7_hist(Sn,fx)
%	\brief Plotea el histográma de la señal: Cant. de errores en función 
%          de errores de cuantización.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param Sn - Señal
%   \param fx - Número de figura 
%	\date 2015.08.19


function [] = plot_ejercicio7_hist(Sn,fx)

figure(fx); set(gcf,'Name','Ejercicio 7'); 
hist(Sn,5);
title('Histograma de errores de cuantizacion');
xlabel('Error de cuantizacion'); ylabel('Cant. de errores');

end
%% 


%% Ejercicio 7 - Código: Cálculo de energía, valor medio y valor eficaz.
%
%	\fn [] = datos_EVV(y)
%	\brief Informa los valores estudiados de la señal.
%	\details Informa: Energía, valor medio, valor eficaz
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  y        - Señal a estudiar
%   \return Energia  - Energía de la señal
%   \return V_medio  - Valor medio de la señal
%   \return V_eficaz - Valor eficaz de la señal
%	\date 2015.08.19

function [Energia V_medio V_eficaz] = datos_EVV(y)

% Energia:
Energia = fenergia(y);

% Valor Medio:
V_medio = fv_medio(y);

% Valor Eficaz:
V_eficaz = feficaz(y);

end
%% 



%% Ejercicio 7 - Código: Calculo de energía, valor medio, valor eficaz, varianza y desvío
% La función informa ls valores de energía, valr medio, valor eficaz,
% varianza y desvio estándar de la señal.

function [Energia Medio Eficaz Var Desv] = datos_EVVVD(Sn)
%
%	\fn [] = datos_EVVVD(Sn)
%	\brief Devuelve los valores acerca de la señal que se pasa como parámetro.
%	\details Informa: Energía, valor medio, valor eficaz, varianza y desvio
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  Sn      - Señal a estudiar
%   \return Energia - Energía de la señal
%   \return Medio   - Valor medio de la señal
%   \return Eficaz  - Valor eficaz de la señal
%   \return Var     - Varianza de la señal
%   \return Desv    - Desvio estándar de la señal
%	\date 2015.08.19

% Energia:
Energia = fenergia(Sn);

% Valor Medio:
Medio = fv_medio(Sn);

% Valor Eficaz:
Eficaz = feficaz(Sn);

% Varianza: 
Var = fvar(Sn);

% Desvio estándar:
Desv = fdesvio(Sn);

end
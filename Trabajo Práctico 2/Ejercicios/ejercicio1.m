%% Ejercicio 1
%%
%% Enunciado 
% # Implemente las funciones para generar las siguientes ventanas:
%% 
% * Ventana: Triangular
% * Ventana: Hann (+). Note that Hann (-)
% * Ventana: Flat-Top
% * Ventana: Blackman Harris
%%
% Nota: Para cada caso grafique la correspondiente funcion w(n) y su
% espectro.


%% Ejercicio 1
% Banco de pruebas

function [] = ejercicio1()

%%
% Para este ejercicio se desarrolla el código de cada una de las ventanas
% pedidas, seguidamente se exponen los resultados obtenidos. Finalmente se
% desarrollan conclusiones.

% Cantidad de muestras de la ventana

N = 100;
fx = 1;

%% Ventana Triangular
%
    signal = get_wtriangular(N);

%% Ploteo de la ventana y su espectro
%
    PloteoEspectroW(signal,fx);
    fx = fx + 1;

%% Ploteo del módulo del espectro en dB
%
    PloteoEspectroWdb(signal,fx);
    fx = fx + 1;

%% Ventana Hann (-)
%
    signal = get_whann(N);

%% Ploteo de la ventana y su espectro
%
    PloteoEspectroW(signal,fx);
    fx = fx + 1;

%% Ploteo del módulo del espectro en dB
%
    PloteoEspectroWdb(signal,fx);
    fx = fx + 1;
    
%% Ventana Hann (+)
%
    signal = get_whann_2(N);
    

%% Ploteo de la ventana y su espectro
%
    PloteoEspectroW(signal,fx);
    fx = fx + 1;

%% Ploteo del módulo del espectro en dB
%
    PloteoEspectroWdb(signal,fx);
    fx = fx + 1;

%% Ventana Flat-Top
%
    signal = get_wflat_top(N);

%% Ploteo de la ventana y su espectro
%
    PloteoEspectroW(signal,fx);
    fx = fx + 1;

%% Ploteo del módulo del espectro en dB
%
    PloteoEspectroWdb(signal,fx);
    fx = fx + 1;
    
%% Ventana Blackman Harris
%
    signal = get_wblackman_harris(N);

%% Ploteo de la ventana y su espectro
%
    PloteoEspectroW(signal,fx);
    fx = fx + 1;

%% Ploteo del módulo del espectro en dB
%
    PloteoEspectroWdb(signal,fx);
    fx = fx + 1;
    
%% Conclusiones y comparaciones
% Los espectros resultantes de módulo en dB son los que se exponen a
% continuación:

    PlotearTodo(fx) 

end


%% Conclusiones y aclaraciones
% Para disminuir el efecto de "Leakage", se opta por utilizar ventanas que
% no son rectangulares (excepto algun caso especial). Estos tipos de
% ventana generalmente tienen la caracteristica de poseer valor cero (o
% cercano) en los extremos. Estas caracteristicas hacen que cuando se
% "ventanea" una captura, la misma tiende a cero en los extremos y por lo
% tanto cuando se aplica la DFT, la periodicidad implicita ya no provoca
% una distontinuidad importante dado que todos los periodos arrancan y
% terminan cerca del cero.
% La forma de la ventana es importante ya que naturalmente tambien modifica
% la forma del espectro resultante (como se vera en ejercicios futuros),
% esta alteracion del espectro es inevitable. Cualquier funcion que permita
% desarrollar su transformada de Fourier discreta puede ser utilizada como
% ventana, en este trabajo se exponen algunas de las ventanas mas
% conocidas y cada una de ellas tiene su aplicacion particular, basada en 
% como alterla la señal original, en el tiempo multiplica a la señal
% original y en la frecuencia se convoluciona con el espectro de la misma.
% Si se desea por ejemplo medir amplitudes con la mayor exactitud posible
% se puede utilizar la ventana Flat-Top. Otro ejemplo puede darse si se
% requiere resolver señales con componentes en frecuencias muy cercanas,
% para este tipo de señales se suele utilizar principalmente la ventana de
% Hanning o Hann.
% Para terminar con las conclusiones y aclaraciones que son de importancia
% destacar para este ejercicio introductorio a la guia, se expone a
% continuacion las ventanas que se utiizan segun el contenido de la señal y
% algunas caracteristicas de las mismas.



%% ACA VAN LAS DOS IMAGENES DE LA PARTE DE MEDIDAS I

%%
% Nota: Es importante destacar, que se incluyeron otras ventanas con sus
% respectivas caracteristicas agregadas a las pedidas por el trabajo
% practico, de forma tal de que el lector pueda recurrir a este trabajo a
% la hora de necesitar ventanear una señal para realizar un analisis
% futuro.


%% Ejercicio 1 - Códigos
% A continuación se exímen los códigos generadores de las ventanas y
% espectros del ejercicio.

%% Ejercicio 1 - Código: Ventana triangular
%
%	\fn     [output] = get_wtriangular(N)
%	\brief  Genera una ventana triangular
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_wtriangular(N)
    
    output = zeros(N,1);
    
    for n = 1:N
        output(n) = ((N+1)/2 - abs(n - (N-1)/2)) * 2/(N+1);
    end
end


%% Ejercicio 1 - Código: Ventana Hann (-)
%
%	\fn     [output] = get_whann(N)
%	\brief  Genera una ventana Hann con signo "-"
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_whann(N)
    
    output = zeros(N,1);
    
    for n = 1:N
        output(n) = 0.5*(1-cos(2*pi*n/(N-1)));
    end
end


%% Ejercicio 1 - Código: Ventana Hann (+)
%
%	\fn     [output] = get_whann_2(N)
%	\brief  Genera una ventana Hann con signo "+"
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_whann_2(N)
    
    output = zeros(N,1);
    
    for n = 1:N
        output(n) = 0.5*(1+cos(2*pi*n/(N-1)));
    end
end


%% Ejercicio 1 - Código: Ventana Flat-Top
%
%	\fn     [output] = get_wflat_top(N)
%	\brief  Genera una ventana Flat-Top
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_wflat_top(N)
    
    output = zeros(N,1);
    
    a0 = 1;
    a1 = 1.93;
    a2 = 1.29;
    a3 = 0.388;
    a4 = 0.032;
    
    for n = 1:N
        output(n) = a0-a1*cos(2*pi*n/(N-1))+a2*cos(4*pi*n/(N-1))-a3*cos(6*pi*n/(N-1))+a4*cos(8*pi*n/(N-1));
    end
end


%% Ejercicio 1 - Código: Ventana Blackman Harris
%
%	\fn     [output] = get_wblackman_harris(N)
%	\brief  Genera una ventana Blackman Harris
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15 
%	\param  N       - Número de muestras
%	\return output  - Vector ventana	
%**

function [output] = get_wblackman_harris(N)
    
    output = zeros(N,1);
    
    a0 = 0.35875;
    a1 = 0.48829;
    a2 = 0.14128;
    a3 = 0.01168;
    
    for n = 1:N
        output(n) = a0-a1*cos(2*pi*n/(N-1))+a2*cos(4*pi*n/(N-1))-a3*cos(6*pi*n/(N-1));
    end
end


%% Ejercicio 1 - Código: Ploteo de espectros
%
%	\fn [] = PLoteoEspectroW(signal)
%	\brief 
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 
%	\param amp      - 
%**

function [] = PloteoEspectroW(signal,fx) %wvtool()
    
  
    fs = 100; % Arbitrario
    
    output = my_dft(signal);
    N = length(output);
    
    f=0:fs/N:(N-1)*fs/N; 
    
    figure(fx); set(gcf,'Name','Ploteo de ventana'); 
    subplot(3,1,1); plot(signal);
    title('Ventana'); 
    xlabel('Muestras [n]'); ylabel('Amplitud(n)'); grid; 
    
    subplot(3,1,2); stem(f(1:length(output)/2),abs(output(1:length(output)/2)));
    title('Modulo de la Transoformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('|x[f]|'); 

    subplot(3,1,3); stem(f(1:length(output)/2),angle(output(1:length(output)/2)));
    title('Fase de la Transformada de Fourier Discreta'); 
    xlabel('Frecuencia[Hz]'); ylabel('fase x[f]');     
    
end


%% Ejercicio 1 - Código: Ploteo de espectro en dB
%
%	\fn [] = PloteoEspectroWdb(signal)
%	\brief  Agrega zero padding a la señal, luego plotea el espectro en db
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15
%	\param  signal - Señal a plotear.
%**

function [] = PloteoEspectroWdb(signal,fx,color) 

    if nargin == 2 
        color = 'b';
    end

    fs = 100; % Arbitrario
    M = zeros(500,1);
    
    output_Z = [signal' M'];
    output_Z = output_Z';
    N_Z = length(output_Z);
    f=0:fs/N_Z:(N_Z-1)*fs/N_Z;
     
    output_z_t = my_dft(output_Z);
    
    figure(fx); set(gcf,'Name','Espectro en dB');
    semilogy(f(1:length(output_z_t)/2),abs(output_z_t(1:length(output_z_t)/2)),color);
    title('Espectro en dB'); 
    xlabel('Frecuencia[Hz]'); ylabel('|x[f]|dB'); 
     
    if nargin == 3 
        legend('Hann(-)','Blackman Harris','Flat-Top','Hann(+)','Triangular');
     end
end

%% Ejercicio 1 - Código: Ploteo de todos los espectros de módulo en dB
%
%	\fn [] = PlotearTodo(fx)
%	\brief  Plotea en un mismo grafico todos los espectros de modulo
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15
%	\param  fx - Numero de figura actual.
%**
function [] = PlotearTodo(fx) 
    
    N = 100;
    output = get_whann(N);
    PloteoEspectroWdb(output,fx,'r');
    hold on;
    output = get_wblackman_harris(N);
    PloteoEspectroWdb(output,fx,'b');
    output = get_wflat_top(N);
    PloteoEspectroWdb(output,fx,'g');
    output = get_whann_2(N);
    PloteoEspectroWdb(output,fx,'m');
    output = get_wtriangular(N);
    PloteoEspectroWdb(output,fx,'k');
    hold off;
end



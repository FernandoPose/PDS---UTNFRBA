function [] = ejercicio2B()

    fx = 1;

    % Muestras, Experimentos y Sectores
    
    % Para ventana: hamming
%%    
    Experimentos = 1000;
    Muestras     = 500;
    L            = 10;
    over         = 0.5;
    ventana      = 2;  %hamming
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1000;
    L            = 20;
    over         = 0.5;
    ventana      = 2;  %hamming
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 50;
    over         = 0.5;
    ventana      = 2;  %hamming
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 10;
    over         = 0.5;
    ventana      = 2;  %hamming
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
    
   
    
    % Para ventana: hanning
%%    
    Experimentos = 1000;
    Muestras     = 500;
    L            = 10;
    over         = 0.5;
    ventana      = 3;  %hanning
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1000;
    L            = 20;
    over         = 0.5;
    ventana      = 3;  %hanning
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 50;
    over         = 0.5;
    ventana      = 3;  %hanning
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%    
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 10;
    over         = 0.5;
    ventana      = 3;  %hanning
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
    
    
    
    % Para ventana: bartlett
%%    
    Experimentos = 1000;
    Muestras     = 500;
    L            = 10;
    over         = 0.5;
    ventana      = 3;  %bartlett
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1000;
    L            = 20;
    over         = 0.5;
    ventana      = 3;  %bartlett
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 50;
    over         = 0.5;
    ventana      = 3;  %bartlett
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%    
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 10;
    over         = 0.5;
    ventana      = 3;  %bartlett
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
    
    
    
    % Para ventana: blackman
%%    
    Experimentos = 1000;
    Muestras     = 500;
    L            = 10;
    over         = 0.5;
    ventana      = 3;  %blackman
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1000;
    L            = 20;
    over         = 0.5;
    ventana      = 3;  %blackman
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 50;
    over         = 0.5;
    ventana      = 3;  %blackman
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
%%    
    Experimentos = 1000;
    Muestras     = 1500;
    L            = 10;
    over         = 0.5;
    ventana      = 3;  %blackman
    fx = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx);
    
    
end




function [fx] = welch_ploteo(Experimentos, Muestras,L,over,ventana, fx)

    % Parámetros del ruido

    Media  = 0;
    Desvio = 2;

    % Generación de Ruido Blanco

    %RuidoBlanco = random('normal',Media,Desvio,Experimentos,Muestras); 

    RuidoBlanco = Desvio * randn(Experimentos, Muestras);

    welch = zeros(Experimentos, Muestras);

    % Realizo la funcion welch sobre mis 500 experimentos.

    for cont = 1:Experimentos

        welch(cont,:)        = get_welch(RuidoBlanco(cont,:),L, over, ventana);
        media(cont)          = mean(welch(cont,:)); 
        varianza(cont)       = var(welch(cont,:));

    end

    % Calculo y grafico la varianza.

    figure(fx); set(gcf,'Name','Ejercicio 2'); 
    ylabel('Varianza'); xlabel('Muestras'); hold on;
    plot(varianza);
    
    % Varianza teorica a obtener: 0
    
    varianza_teorica_esperada = refline([0 0]);
    set(varianza_teorica_esperada,'Color','r');
    
    % Varianza experimental obtenida
    
    Resultado = mean(varianza);
    varianza_obtenida = refline([0 Resultado]);
    set(varianza_obtenida, 'color','m');
    legend('Varianza','Varianza teorica','Varianza Esperada');
    hold off; 
    
    % Valores de varianza teorica y experimental:
    
    disp('Varianza teorica : '),disp(num2str(0));
    disp('Varianza esperada: '),disp(num2str(Resultado));
    
    fx = fx + 1;
    
    % Calculo y grafico la media.
 
    figure(fx); set(gcf,'Name','Ejercicio 2'); 
    ylabel('Media'); xlabel('Muestras'); hold on;
    plot(media);
    
    % Media experimental obtenida
    
    Resultado = mean(media);
    media_obtenida = refline([0 Resultado]);
    set(media_obtenida, 'color','m');
    legend('Media','Media Esperada');
    hold off; 
    
    % Valor de esperanza experimental:
    
    disp('Media esperada: '),disp(num2str(Resultado));
    
    fx = fx + 1;
        
end


%% Ejercicio 1 - Código: Función Bartlett
%
%	\fn [output] = get_bartlett()
%	\brief Calcula con bartlett la DEP del vector intput
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.23
%**

function [output] = get_bartlett(input, nsector)
    
    L = floor(length(input)/nsector);
    output = zeros(1,length(input));
    n1 = 1;
    
    for i = 1:nsector
        output(1,n1:n1+L-1) = get_periodograma(input(1,n1:n1+L-1))/nsector;
        n1 = n1 + L;
    end;
end


%% Ejercicio 1 - Código: Función Welch
%
%	\fn [output] = get_welch()
%	\brief Calcula con welch la DEP del vector intput
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.23
%**

function [output] = get_welch(input, L, over, window)

    if ( over >= 1) || (over < 0)
        error ('overlap is invalid');
    end
    
    n1 = 1;
    n0 = (1-over)*L;
    
    nsect = 1 + floor((length(input) - L)/n0);
    
    output = zeros(1,length(input));
    
    for i = 1: nsect
        output(1,n1:n1+L-1) = get_periodograma_modificada(input, window, n1, n1+L-1)/nsect;
        n1 = n1 + n0;
    end
end



%% Ejercicio 1 - Código: Función Periodograma modificada
%
%	\fn [output] = get_periodograma_modificada(intput,window, inicio, fin)
%	\brief Calcula el periograma de una señal ventaneada
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.23
%**

function [output] = get_periodograma_modificada(input, ventana, inicio, fin)
    
    input = input'; %traspongo la matriz

    if nargin == 2
        inicio = 1; 
        fin = length(input);
    end
    
    N = fin - inicio + 1;
    W = ones(N,1);
    
    if (ventana == 2)
        W = hamming(N);
        elseif (ventana == 3)
            W = hanning(N);
        elseif (ventana ==  4)
            W = bartlett(N);
        elseif (ventana == 5)
            W = blackman(N);
    end;
        
    x_window = input(inicio:fin).^W/norm(W); % Norma del vector.-
    output = N * get_periodograma(x_window);
    
end





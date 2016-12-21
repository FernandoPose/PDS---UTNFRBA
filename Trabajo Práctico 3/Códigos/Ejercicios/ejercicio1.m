%% Enunciado 
% Compruebe experimentalmente que el periodograma:
%%
% # Es un estimador de la densisdad de potencia espectral no sesgado
% asintóticamente a medida que aumenta la ventana de registro N.
% # Tiene varianza constante y no depende de N.
%%
% Se sugiere utilizar ruido normalmnete distribuido de varianza sigma^2


%% Ejercicio 1
% Banco de pruebas

function [] = ejercicio1()

fx = 1;

% Muestras y Experimentos

%%
Experimentos = 500;
Muestras     = 5000;

fx = periodograma_ploteo(Experimentos, Muestras,fx);
%%
Experimentos = 500;
Muestras     = 10000;

fx = periodograma_ploteo(Experimentos, Muestras,fx);
%%
Experimentos = 500;
Muestras     = 20000;

fx = periodograma_ploteo(Experimentos, Muestras,fx);
%%
Experimentos = 2000;
Muestras     = 20000;

fx = periodograma_ploteo(Experimentos, Muestras,fx);
%%
Experimentos = 5000;
Muestras     = 2000;

fx = periodograma_ploteo(Experimentos, Muestras,fx);
%%
Experimentos = 8000;
Muestras     = 2000;

fx = periodograma_ploteo(Experimentos, Muestras,fx);

end

function [fx] = periodograma_ploteo(Experimentos, Muestras,fx)

% Parámetros del ruido

Media  = 0;
Desvio = 2;

% Generación de Ruido Blanco

%RuidoBlanco = random('normal',Media,Desvio,Experimentos,Muestras); 

RuidoBlanco = Desvio * randn(Muestras, Experimentos);

Periodograma = zeros(Muestras,Experimentos);

% Realizo la funcion periodograma sobre mis 500 experimentos.

for cont = 1:Experimentos
   
    Periodograma(:,cont) = get_periodograma(RuidoBlanco(:,cont));
    media(cont)          = mean(Periodograma(:,cont)); 
    varianza(cont)       = var(Periodograma(:,cont));

end
    
    % Calculo y grafico la varianza.

    figure(fx); set(gcf,'Name','Ejercicio 1'); 
    ylabel('Varianza'); xlabel('Muestras'); hold on;
    plot(varianza);
    
    % Varianza teorica a obtener: Sigma^4
    
    varianza_teorica_esperada = refline([0 Desvio^4]);
    set(varianza_teorica_esperada,'Color','r');
    
    % Varianza experimental obtenida
    
    Resultado = mean(varianza);
    varianza_obtenida = refline([0 Resultado]);
    set(varianza_obtenida, 'color','m');
    legend('Varianza','Varianza teorica','Varianza Esperada');
    hold off; 
    
    % Valores de varianza teorica y experimental:
    
    disp('Varianza teorica : '),disp(num2str(Desvio^4));
    disp('Varianza esperada: '),disp(num2str(Resultado));
    
    fx = fx + 1;
    
    % Calculo y grafico la media.
 
    figure(fx); set(gcf,'Name','Ejercicio 1'); 
    ylabel('Media'); xlabel('Muestras'); hold on;
    plot(media);
    
    % Media teorica a obtener: Sigma^2
    
    media_teorica_esperada = refline([0 Desvio^2]);
    set(media_teorica_esperada,'Color','r');
    
    % Media experimental obtenida
    
    Resultado = mean(media);
    media_obtenida = refline([0 Resultado]);
    set(media_obtenida, 'color','m');
    legend('Media','Media teorica','Media Esperada');
    hold off; 
    
    % Valores de esperanza teorica y experimental:
    
    disp('Media teorica : '),disp(num2str(Desvio^2));
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







%% Enunciado 
% Compruebe del mismo modo los estimadores del método de Bartlett y Welch.


%% Ejercicio 2
% Banco de pruebas

function [] = ejercicio2A()

    fx = 1;

    % Muestras, Experimentos y Sectores
%%
    Experimentos = 1000;
    Muestras     = 250;
    nsector      = 10;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 2000;
    Muestras     = 500;
    nsector      = 15;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 3000;
    Muestras     = 750;
    nsector      = 20;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%  
    Experimentos = 4000;
    Muestras     = 800;
    nsector      = 25;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 5000;
    Muestras     = 850;
    nsector      = 30;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 6000;
    Muestras     = 900;
    nsector      = 35;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 6000;
    Muestras     = 250;
    nsector      = 35;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 5000;
    Muestras     = 500;
    nsector      = 30;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 4000;
    Muestras     = 750;
    nsector      = 25;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 3000;
    Muestras     = 800;
    nsector      = 20;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%  
    Experimentos = 2000;
    Muestras     = 850;
    nsector      = 15;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
%%
    Experimentos = 1000;
    Muestras     = 900;
    nsector      = 10;
    fx = bartlett_ploteo(Experimentos, Muestras, nsector, fx);
   
 
end

    function [fx] = bartlett_ploteo(Experimentos, Muestras,nsector, fx)

    % Parámetros del ruido

    Media  = 0;
    Desvio = 2;

    % Generación de Ruido Blanco

    %RuidoBlanco = random('normal',Media,Desvio,Experimentos,Muestras); 

    RuidoBlanco = Desvio * randn(Experimentos, Muestras);

    bartlett = zeros(Experimentos, Muestras);

    % Realizo la funcion bartlett sobre mis 500 experimentos.

    for cont = 1:Experimentos

        bartlett(cont,:)     = get_bartlett(RuidoBlanco(cont,:), nsector);
        media(cont)          = mean(bartlett(cont,:)); 
        varianza(cont)       = var(bartlett(cont,:));

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


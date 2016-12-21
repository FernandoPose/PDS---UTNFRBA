%**
%	\fn [Signal_Int] = FuncIntPol(Signal,I)
%	\brief Agrega I-1 muestras entre valores sucesivos de la señal Signal
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal     - Señal a interpolar
%   \param  I          - Muestras a ingresar por muestra de Signal
%	\return Signal_Int - Señal interpolada

function [Signal_Int] = FuncIntPol(Signal,I)

    Order = 2;
    RollOff = 0.5;
    Scale = max(Signal);
    
    if I == 1
        Signal_Int = Signal;
        return;
    end
    
    %% Creacion del filtro y del banco de filtros
    
    % Creacion del filtro    
    OrderFilter = (Order * I);          
    Filtro = firnyquist(OrderFilter,I,RollOff);
    
    
    % Creacion del banco de filtros (Matriz de filtros)
    h(1,:) = downsample(Filtro,I,OrderFilter);
    for i = 1:1:I-1
        h(i+1,:) = [0 downsample(Filtro,I,i)];
    end
    
    % Filtro las señales
    for j = 0:1:I-1
        SignalFilter(j+1,:) = filtfilt(h(j+1,:), 1, Signal);
    end
    
    % Obención de Signal_Int (Salida ó retorno de la función)
    
    Signal_Int = [ SignalFilter(:,1)' ];

    for i = 2:1:length(SignalFilter)
        Signal_Int =  [ Signal_Int SignalFilter(:,i)' ];
    end
       
    %Escala
    Signal_Int = (Signal_Int / max(Signal_Int)) * Scale;
    
end
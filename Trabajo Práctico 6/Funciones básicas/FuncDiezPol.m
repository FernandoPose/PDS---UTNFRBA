%**
%	\fn [Signal_Diez] = FuncDiezPol(Signal,M)
%	\brief Elimina M-1 muestras entre valores sucesivos de la señal Signal
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal     - Señal a interpolar
%   \param  I          - Muestras a ingresar por muestra de Signal
%	\return Signal_Int - Señal interpolada

function [Signal_Diez] = FuncDiezPol(Signal,M)
    
    Order = 2;
    RollOff = 0.5;
    Scale = max(Signal);
    
    if M == 1
        Signal_Diez = Signal;
        return;
    end

    nS = length(Signal);
    nZ = ceil(nS/M) * M - nS; 
    
    Signal = [Signal zeros(1,nZ)];
    
    %% Creacion del filtro y del banco de filtros
    
    % Creacion del filtro
    OrderFilter = (Order * M);
    Filtro = firnyquist(OrderFilter,M,RollOff);

    % Creacion del banco de filtros (Matriz de filtros)
    h(1,:) = downsample(Filtro,M,OrderFilter);
    for i = 1:1:M-1
        h(i+1,:) = [0 downsample(Filtro,M,i)];
    end

    %%
    
    % Obtengo las señales a ser filtradas
    for j = 0:1:M-1
        SignalAFilter(j+1,:) = downsample(Signal,M,j);
    end

    % Filtro las señales
    for j = 0:1:M-1
        SignalFilter(j+1,:) = filtfilt(h(j+1,:), 1, SignalAFilter(j+1,:));
    end

    %Suma
    SignalSumFilter =  sum(SignalFilter,1);

    Signal_Diez = SignalSUmFilter;
    
    Signal_Diez = SignalSumFilter;
    Signal_Diez = (Signal_Diez / max(Signal_Diez)) * Scale;

end
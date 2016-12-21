%**
%	\fn [Signal_Resample] = Resample3(Signal,fs,fsx,tol)
%	\brief Función que resamplea (ejercicio: 3)
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal          - Señal a a trabajar
%   \param  fs              - Frecuencia de la señal de entrada
%   \param  fsx             - Frecuencia nueva de sampleo
%	\param tol              - Tolerancia de aproximacion
%   \return Signal_Resample - Señal resampleada

function [Signal_Resample] = Resample3(Signal,fs,fsx,tol)

    Coef_Rel = fsx/fs;
    
    % [N,D] = rat(X,tol) returns N./D approximating X to within tol.
    [I,M] = rat(Coef_Rel, tol * Coef_Rel);
    
    % Factorizo numerador y denominador.
    
    Ifact = factor(I);
    Mfact = factor(M);
    
    % Completo con 1s si alguno de los dos vectores obtenidos es menor
    % que el otro vector obtenido.
    
    if length(Ifact) > length(Mfact)
        Mfact = [Mfact ones(1,length(Ifact) - length(Mfact))];
    else
        Ifact = [Ifact ones(1,length(Mfact) - length(Ifact))];
    end
    
    % Ordeno de mayor a menor los vectores.
    
    Ifact = sort(Ifact);
    Mfact = sort(Mfact);
  
    Signal_Resample = Signal;
    
    nI = length(Ifact);
    nM = length(Mfact);
    i  = 1; j = 1;
    
    while (i <= nI && j <= nM)
        I = Ifact(i); M = Mfact(j);
        if I >= M
            Signal_Resample = FuncDiezPol(Signal,M);
            i = i+1;
        elseif M > I
            Signal_Resample = FuncIntPol(Signal,I);
            j = j+1;
        end
    end
end
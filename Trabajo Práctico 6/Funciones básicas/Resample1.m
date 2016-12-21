%**
%	\fn [Signal_Resample] = Resample1(Signal,fs,fsx,tol)
%	\brief Función que resamplea (ejercicio: 1)
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal          - Señal a a trabajar
%   \param  fs              - Frecuencia de la señal de entrada
%   \param  fsx             - Frecuencia nueva de sampleo
%	\param tol              - Tolerancia de aproximacion
%   \return Signal_Resample - Señal resampleada

function [Signal_Resample] = Resample1(Signal,fs,fsx,tol) 

    Coef_Rel = fsx/fs;
    
    % [N,D] = rat(X,tol) returns N./D approximating X to within tol.
    [I,M] = rat(Coef_Rel, tol * Coef_Rel);
    CoefMax = max(I,M);
    
    % Para el informe ver: Cap.11 - Pag.681 - Proakis.
    
    % Realizo el upsample
    out = func_interpol(Signal,I);
    
    % Realizo el filtrado
    SignalFilter = I * filterLp(out,1/CoefMax);
    
    % Realizo el downsample
    out = func_diez(SignalFilter, M);
    
    Signal_Resample = out;

end



%**
%	\fn [Signal_Diez] = func_diez(signal, M)
%	\brief Elimina M-1 muestras entre valores sucesivos de la señal Signal
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal     - Señal a decimar
%   \param  I          - Muestras a eliminar
%	\return Signal_Int - Señal diezmada

function [Signal_Diez] = func_diez(signal, M)
    if M == 1
        Signal_Diez = signal;
    else
        Signal_Diez = signal(1:M:end);
    end
end
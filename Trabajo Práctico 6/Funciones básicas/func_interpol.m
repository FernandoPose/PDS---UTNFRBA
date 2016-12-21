%**
%	\fn [Signal_Int] = func_interpol(Signal,I)
%	\brief Agrega I-1 muestras entre valores sucesivos de la señal Signal
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal     - Señal a interpolar
%   \param  I          - Muestras a ingresar por muestra de Signal
%	\return Signal_Int - Señal interpolada

function [Signal_Int] = func_interpol(Signal,I)

    if I == 1
        Signal_Int = Signal;
        return;
    else
        Signal_Int = zeros(1,length(Signal)*I);
        Signal_Int(1:I:end) = Signal;
    end
end




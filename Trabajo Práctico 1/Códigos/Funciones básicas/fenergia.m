%**
%	\fn [Energia] = fenergia (y)
%	\brief Calcula la energía de la señal
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  y       - Señal
%   \return Energia - Energia de la señal
%	\date 2015.08.23
%**

function [Energia] = fenergia (y)
    
    Y_aux = y.^2; 
    Energia = sum(abs(Y_aux));
    
end

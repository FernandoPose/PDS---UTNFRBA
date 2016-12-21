%**
%	\fn [Desvio] = fdesvio(y)
%	\brief Calcula el desvio estandar de la señal
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  y      - Señal
%   \return Desvio - Desvio estándar de la señal
%	\date 2015.08.23
%**

function [Desvio] = fdesvio(y)
   
   Var = fvar(y);
   Desvio = sqrt(1/length(y)*Var);
   
end

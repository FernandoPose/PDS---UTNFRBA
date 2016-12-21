%**
%	\fn [V_eficaz] = feficaz(y,Energia)
%	\brief Calcula el valor eficaz de la señal.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  y        - Señal.
%   \return V_eficaz - Valor eficaz de la señal.
%	\date 2015.08.23
%**

function [V_eficaz] = feficaz(y)
   
   Energia = fenergia (y);
   V_eficaz = sqrt(1/length(y) * Energia);
   
end
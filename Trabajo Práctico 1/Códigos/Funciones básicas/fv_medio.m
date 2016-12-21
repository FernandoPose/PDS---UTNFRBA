%**
%	\fn [V_medio] = fv_medio(y)
%	\brief Calcula el valor medio de la señal.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  y   - Señal
%   \return Var - Valor medio de la señal
%	\date 2015.08.23
%**

function [V_medio] = fv_medio(y)
    
    V_medio = 1/length(y) * sum(y);
    
end
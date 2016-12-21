%**
%	\fn [Var] = fvar(y)
%	\brief Calcula la varianza de la señal.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%   \param  y   - Señal
%   \return Var - Varianza de la señal
%	\date 2015.08.23
%**


function [Var] = fvar(y)
    
    arg = zeros(length(y),1);

    Media = fv_medio(y');
    
    j=1:1:length(y);
    arg = y(j)-Media;
    Var = sum(arg.^2);
    
end

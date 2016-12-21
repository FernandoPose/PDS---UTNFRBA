%**
%	\fn [output] = get_hw(N,limInf,limSup)
%	\brief Obtención de vectores.
%	\details Obtengo vectores de amplitud 1 entre limInf y LimSup.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [output] = get_hw(N,LimInf,LimSup)
    
    output = zeros(N,1);
    
    for j=0:1:N-1
        if  (j>=LimInf) && (j <= LimSup)  
            output(j+1) = 1.0;
        else
            output(j+1) = 0.0;
        end
    end
end
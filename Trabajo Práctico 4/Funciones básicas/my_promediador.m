%**
%	\fn [output] = my_promediador(NProm)
%	\brief Obtengo filtro promediador
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [output] = my_promediador(NProm)

    output = 1/NProm * ones(1,NProm);
    
end

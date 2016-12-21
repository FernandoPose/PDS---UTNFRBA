%**
%	\fn [output] = ZeroPadding(signal,N)
%	\brief Agrego ceros al final de la señal.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [output] = ZeroPadding(signal,N)

    M = zeros(N,1);
    output = [signal' M'];
    output = output';
    
end
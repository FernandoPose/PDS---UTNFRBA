%**
%	\fn [output] = ConvDisc(x,h)
%	\brief Realiza la convolución discreta entre x e h
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [output] = ConvDisc(x,h)

    % Hago los vectores a convolucionar vectores columna
    x = x(:);
    h = h(:); 
    
    LengthX = length(x);
    LengthH = length(h);
    
    LengthOutput = LengthX+LengthH-1;
    
    % Creo la matriz convolución
    X = zeros(LengthH,LengthOutput)';
    
    for i = 1:LengthH
        X((1:LengthX)+(i-1),i)=x;
    end
    
    output = X*h;
end
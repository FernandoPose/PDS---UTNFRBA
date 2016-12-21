%**
%	\fn output = fcuadrada(amp, fo, ciclo, offset, N, fs)
%	\brief Genera una señal cuadrada
%	\details Los parametros son ingresados por el usuario
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.19
%	\param Amplitud - Amplitud de la señal  
%	\param fo       - Frecuencia de la señal
%	\param duty     - Ciclo de actividad
%	\param offset   - Offset de la señal    
%	\param N        - Numero de muestras de la señal
%	\param fs       - Frecuencia de muestreo de la señal
%	\return output  - Vector con la señal cuadrada	
%   \return x_temp  - Vector temporal:muestra
%**

function [output, x_temp] = fcuadrada(amplitud, fo, duty, offset, N, fs)
    
    aux_y = zeros(N,1);
       
    x_temp = 0:1/fs:(N-1)*(1/fs);  
    to = 1/fo;
    
    duty = duty/100;
    
    for j=1:1:N
        if  rem(x_temp(j),to) < (duty*to)  
            aux_y(j) = 1;
        else
            aux_y(j) = 0;
        end
    end
    output = amplitud * aux_y + offset;
end
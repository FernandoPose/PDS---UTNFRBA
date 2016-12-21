%**
%	\fn [output,x_temp] = ftriangular(amp, fo, ciclo, offset, N, fs)
%	\brief Genera una señal triangular
%	\details Los parametros son ingresados por el usuario
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.19
%	\param Amplitud - Amplitud de la señal  
%	\param fo       - Frecuencia de la señal
%	\param simet    - Punto de simetría
%	\param offset   - Offset de la señal    
%	\param N        - Numero de muestras de la señal
%	\param fs       - Frecuencia de muestreo de la señal
%	\return output  - Vector con la señal cuadrada	
%   \return x_temp  - Vector de tiempo:muestra
%**


function [output,x_temp] = ftriangular(amplitud, fo, simet, offset, N, fs)
    
    aux_y = zeros(N,1);
       
    x_temp = 0:1/fs:(N-1)*(1/fs);  
    to = 1/fo;
    
    to = 1/fo;
    
    simet = simet/100;
    
    for j=1:1:N
        if  rem(x_temp(j),to) < (simet*to)  
            aux_y(j) = (amplitud/(simet*to)) * rem(x_temp(j),to);
        else
            aux_y(j) = - amplitud / (to - (simet*to)) * (rem(x_temp(j),to) - (simet*to)) + amplitud; 
        end
    end
    output = aux_y + offset;
end
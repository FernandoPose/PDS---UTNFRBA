%**
%	\fn [output,x_temp] = fsenoidal(amp, fo, phase, offset, N, fs)
%	\brief Genera una señal senoidal
%	\details Los parametros son ingresados por el usuario
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.17
%	\param amp      - Amplitud de la señal
%	\param fo       - Frecuencia de la señal
%	\param phase    - Fase inicial de la señal
%	\param offset   - Offset de la señal
%	\param N        - Numero de muestras de la señal
%	\param fs       - Frecuencia de muestreo de la señal
%	\return output  - Vector con la señal senoidal	
%   \return x_temp  - Vector temporal:muestra
%**

function [output,x_temp] = fsenoidal(amp, fo, phase, offset, N, fs)

    aux_y = zeros(N,1);
    x_temp = 0:1/fs:(N-1)*1/fs;

    for j =1:N
        aux_y(j,1) = offset + amp * sin(2*pi*fo*j/fs  + phase);
    end
    output = aux_y;
end




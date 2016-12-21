%**
%	\fn     [fx] = adc_Nbit(signal,f,fx,Amp,Nbit)
%	\brief  Conversor adc de Nbits
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   28/10/15 
%	\param  signal  - Señal a convertir
%	\param  f       - vector frecuencia
%	\param  fx      - Número de imágen
%	\param  Amp     - Amplitud de componente 2
%	\param  Nbit    - Bit del adc
%	\return output  - Número de imágen
%**

function [fx] = adc_Nbit(signal,f,fx,Amp,Nbit)

    % Parámetros para el ADC:

    K = 1;
    Vref = 3.3;

    % Preparo el ADC:

    escalado_sup = (2^(Nbit-1))-1;
    Resolucion = Vref/escalado_sup;

    Cuentas = signal/Resolucion;
    Sq_1 = round(Cuentas);

    Ploteo_dB(Sq_1,f,fx,Amp);
    fx = fx + 1;

end

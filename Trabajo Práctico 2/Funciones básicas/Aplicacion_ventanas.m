%**
%	\fn     Aplicacion_ventanas(signal,f,N,fx)
%	\brief  Aplica ventana a la señal y plotea el espectro
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   28/10/15 
%	\param  signal  - Señal a aplicar ventaneo
%	\param  f       - vector frecuencia
%	\param  N       - Número de muestras
%	\param  fx      - Número de imágen
%**

function [fx] = Aplicacion_ventanas(signal,f,N,fx)

    %ventana triangular:
    ventana = get_wtriangular(N);
    signal_v = signal .* ventana;
    ploteo_espectros_ventanas(signal_v,f,N,fx);
    fx = fx + 1;

    %ventana Hann:
    ventana = get_whann(N);
    signal_v = signal .* ventana;
    ploteo_espectros_ventanas(signal_v,f,N,fx);
    fx = fx + 1;


    %ventana Flat-Top:
    ventana = get_wflat_top(N);
    signal_v = signal .* ventana;
    ploteo_espectros_ventanas(signal_v,f,N,fx);
    fx = fx + 1;


    %ventana Blackman Harris:
    ventana = get_wblackman_harris(N);
    signal_v = signal .* ventana;
    ploteo_espectros_ventanas(signal_v,f,N,fx);
    fx = fx + 1;

end
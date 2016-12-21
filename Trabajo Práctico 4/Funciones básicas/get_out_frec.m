%**
%	\fn plot_signal_filter_frec(signal_tf,transf,Y,N,f,fc)
%	\brief Obtiene salida filtrada en frecuencia y luego plotea.
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17

function [Y,fc] = get_out_frec(signal,transf,N,f,fc)

    signal_tf = 2/N * fft(signal);
    
    Y = signal_tf .* transf;
    
    plot_signal_filter(signal_tf,transf,Y,N,f,fc);
    
    fc = fc + 1;

end

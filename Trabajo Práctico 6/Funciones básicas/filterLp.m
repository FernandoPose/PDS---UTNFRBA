%**
%	\fn [SignalFilter] = filterLp(Signal,fc)
%	\brief Filtro pasabajos
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal       - Señal a filtrar
%   \param  fc           - Frecuencia de corte del filtro pasa bajos
%	\return SignalFilter - Señal filtrada

function [SignalFilter] = filterLp(Signal,fc)
    
    Fwpass = fc*0.9;         % Passband Frequency
    Fwstop = fc*1.1;         % Stopband Frequency
    Dpass = 0.001;           % Passband Attenuation
    Dstop = 80;              % Stopband Attenuation
    
    if fc == 1
        SignalFilter = Signal;
        return;
    
    else
    
    % Diseño del filtro pasa bajos
    d=fdesign.lowpass('Fp,Fst,Ap,Ast',Fwpass,Fwstop,Dpass,Dstop);
    Hd = design(d);
    
    SignalFilter = filtfilt(Hd.Numerator,1,Signal);
    
    end
end
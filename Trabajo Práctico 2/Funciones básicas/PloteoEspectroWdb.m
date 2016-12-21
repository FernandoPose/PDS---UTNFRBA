%**
%	\fn [] = PloteoEspectroWdb(signal)
%	\brief  Agrega zero padding a la señal, luego plotea el espectro en db
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date   23/10/15
%	\param  signal - Señal a plotear.
%**

function [] = PloteoEspectroWdb(signal,color) 

    if nargin == 1 
        color = 'b';
    end

    fs = 100; % Arbitrario
    M = zeros(500,1);
    
    output_Z = [signal' M'];
    output_Z = output_Z';
    N_Z = length(output_Z);
    f=0:fs/N_Z:(N_Z-1)*fs/N_Z;
     
    output_z_t = my_dft(output_Z);
    
    figure(2); set(gcf,'Name','Espectro en dB');
    semilogy(f(1:length(output_z_t)/2),abs(output_z_t(1:length(output_z_t)/2)),color);
    title('Espectro en dB'); 
    xlabel('Frecuencia[Hz]'); ylabel('|x[f]|dB'); 
     
    if nargin == 2 
        legend('Hann(-)','Blackman Harris','Flat-Top','Hann(+)','Triangular');
     end
end


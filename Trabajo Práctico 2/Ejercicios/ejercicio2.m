
function [] = ejercicio2()

    fx = 1;

    % Declaro los parámetros para realizar la señal bitonal 

    % Parámetros comunes a ambas señales

    N = 400;
    fs = 100;
    phase = 0;
    offset = 0;

    df = fs/N;

    % Parámetros del primer tono:

    amp1 = 1;
    fo = N/4 * df;

    [output1] = fsenoidal(amp1, fo, phase, offset, N, fs);

    % Parámetros del segundo tono:

    amp2 = 1/100; % 40db por debajo de amp1
    fo = (N/4+10) * df;

    [output2,x_temp] = fsenoidal(amp2, fo, phase, offset, N, fs);

    signal = output1 + output2;

    f=0:fs/N:(N-1)*fs/N;


%% Ejercicio 2.E

    amp1 = 1;
    amp1_dB = 20 * log10(amp1);
    amp2_dB = amp1_dB - 40;
    amp2    = db2mag(amp2_dB);

    f=0:fs/N:(N-1)*fs/N;

    fo = (N/4+10) * df;

    [output2] = fsenoidal(amp2, fo, phase, offset, N, fs);

    % Repito 2D
    
    for desint = 0:10:20

        fo1 = (N/4+0.01*desint) * df;

        [output1] = fsenoidal(amp1, fo1, phase, offset, N, fs);

        signal = output1 + output2;
        fx = Aplicacion_ventanas(signal,f,N,fx);

    end
    

end




          






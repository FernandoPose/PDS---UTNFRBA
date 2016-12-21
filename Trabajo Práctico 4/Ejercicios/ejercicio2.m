function [] = ejercicio2()
    
    fc = 1;

    % Parametros de las señales de prueba
    
    amp = 1;
    fo  = 10;
    offset = 0;
    N = 100;
    fs = 100;

    phase = 0;
    simet = 50;
    duty  = 50;
    
    f = 0:fs/N:(N-1)*fs/N;
    t = 0:1/fs:(N-1)*(1/fs);  
    
    % Obtengo transferencia promediador
    NProm = 5;
    HProm = my_promediador(NProm);
    
    % Obtengo transferencia diferenciador
    HDif  = my_diferenciador();
    
    % Calculo la respuesta en frecuencia, el modulo y la fase
    HPromZP = ZeroPadding(HProm',N-NProm);
    fc = plot_espc2(HPromZP,N,f,t, fc);
    
    HDifZP = ZeroPadding(HDif',N-2);
    fc = plot_espc2(HDifZP,N,f,t, fc);
    
    SignalSin = fsenoidal(amp, fo, phase, offset, N, fs);
    SignalSqu = fcuadrada(amp, fo, duty, offset, N, fs);
    SignalTri = ftriangular(amp, fo, simet, offset, N, fs);
    
    %% Parte A del ejercicio.
    
    % Para la señal senoidal
    output = ConvDisc(SignalSin,HProm);
    fc = plot_senal_espectro(SignalSin,output,N,f,t, fc);
    
    % Para la señal Cuadrada
    output = ConvDisc(SignalSin,HProm);
    fc = plot_senal_espectro(SignalSqu,output,N,f,t, fc);
    
    % Para la señal Triangular
    output = ConvDisc(SignalSin,HProm);
    fc = plot_senal_espectro(SignalTri,output,N,f,t, fc);
    
    
    %% Parte B del ejercicio.
    
    % Utilizo NProm = 25
    
    % Obtengo transferencia promediador
    NProm = 25;
    HProm = my_promediador(NProm);
    
    % Obtengo transferencia diferenciador
    HDif  = my_diferenciadorB();
    
    % Calculo la respuesta en frecuencia, el modulo y la fase
    HPromZP = ZeroPadding(HProm',N-NProm);
    fc = plot_espc2(HPromZP,N,f,t, fc);
    
    HDifZP = ZeroPadding(HDif',N-7);
    fc = plot_espc2(HDifZP,N,f,t, fc);
    
end


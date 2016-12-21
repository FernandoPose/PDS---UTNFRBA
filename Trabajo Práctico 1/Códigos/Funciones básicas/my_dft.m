%**
%	\fn output = my_dft(samples)
%	\brief Realiza la DFT de samples
%	\details Samples debe ser un vector columna
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.08.17
%	\param Samples - Vector con muestras de la señal
%	\return output - Vector columna con la DFT de la señal	
%**

function output = my_dft(samples)
    
    N =length(samples);
    
    exponente = zeros(N,1);
    
    samples = samples';
    n = 1:1:N;
    
    exponente(n,1) = exp(-2* 1j * pi *n/N);
  
    for k=0:1:N-1
        output(k+1) = samples*(exponente.^k); 
    end
    output = output * 1/N;
    output = output';
end
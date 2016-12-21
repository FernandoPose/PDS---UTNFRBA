%**
%	\fn [fp] = FuncEjercicio3(Signal,fs,fsx,tol,fp) 
%	\brief Función manejadora de ejercicio 3
%	\author Pose, Fernando Ezequiel (fernandoepose@gmail.com)
%	\date 2015.10.17
%	\param  Signal          - Señal original
%   \param  Signal_Resample - Frecuencia de muestreo de la señal original
%	\param  ts              - Frecuencia de muestreo de la señal modificada
%   \param  tol             - Tolerancia
%   \param  fp              - Número de imagen
%   \return fp              - Nuevo número de imagen

function [fp] = FuncEjercicio3(Signal,fs,fsx,tol,fp) 

Signal_Resample = Resample3(Signal,fs,fsx,tol); 

%N  = length(Signal);
%Nx = length(Signal_Resample);

%ts  = 0:1/fs:(N-1)*1/fs;
%tsx = 0:1/fsx:(Nx-1)*1/fsx;

%%
%fp = Ploteo1(Signal,Signal_Resample,ts,tsx,fp);
%%
%fp = fp+1;

end
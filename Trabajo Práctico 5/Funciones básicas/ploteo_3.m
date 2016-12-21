function [fc] = ploteo_3(ECG1,EcgFilter,fc)

    figure(fc);
    hold on;
    plot(ECG1(1:length(EcgFilter)));
    plot(EcgFilter,'r');
    hold off;
    xlabel('Muestras'); ylabel('Amplitud');
    title('Filtrado de mediana');
    legend('ECG sin filtrar','ECG filtrado');
    fc = fc + 1;
    
end
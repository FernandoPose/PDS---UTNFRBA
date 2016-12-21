function [fc] = ploteo_33(ECG1,EcgFilter,fc)

    figure(fc);
    hold on;
    plot(2.5e5:2.6e5,ECG1(2.5e5:2.6e5));
    plot(2.5e5:2.6e5,EcgFilter(2.5e5:2.6e5),'r');
    hold off;
    xlabel('Muestras'); ylabel('Amplitud');
    title('Filtrado de mediana');
    legend('ECG sin filtrar','ECG filtrado');
    fc = fc + 1;
    
end
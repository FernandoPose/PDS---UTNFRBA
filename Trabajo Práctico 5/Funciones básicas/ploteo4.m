function [fc] = ploteo4(Ecg,EcgFilter,fc)

    figure(fc);
    hold on;
    plot(Ecg);
    plot(EcgFilter,'r');
    hold off;
    xlabel('Muestras'); ylabel('Amplitud');
    title('Ecg Vs. EcgFilter');
    legend('Ecg','EcgFilter');
    fc = fc + 1;
end
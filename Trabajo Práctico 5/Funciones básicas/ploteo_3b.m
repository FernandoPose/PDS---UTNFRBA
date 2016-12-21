function [fc] = ploteo_3b(EcgFilterMedia,EcgFilterMediana,fc)

    figure(fc);
    hold on;
    plot(EcgFilterMedia);
    plot(EcgFilterMediana,'r');
    hold off;
    xlabel('Muestras'); ylabel('Amplitud');
    title('EcgFilterMedia Vs. EcgFilterMediana');
    legend('EcgFilterMedia','EcgFilterMediana');
    fc = fc + 1;
    
end
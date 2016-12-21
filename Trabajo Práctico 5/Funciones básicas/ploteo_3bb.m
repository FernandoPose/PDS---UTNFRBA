function [fc] = ploteo_3bb(EcgFilterMedia,EcgFilterMediana,fc)

    figure(fc);
    hold on;
    plot(2.5e5:2.6e5,EcgFilterMedia(2.5e5:2.6e5));
    plot(2.5e5:2.6e5,EcgFilterMediana(2.5e5:2.6e5),'r');
    hold off;
    xlabel('Muestras'); ylabel('Amplitud');
    title('EcgFilterMedia Vs. EcgFilterMediana');
    legend('EcgFilterMedia','EcgFilterMediana');
    fc = fc + 1;
    
end
function [fc] = ploteo_2(Signal,SignalFilter,fc)

figure(fc);

hold on;
plot(4e5:4.02e5,Signal(4e5:4.02e5));
plot(4e5:4.02e5,SignalFilter(4e5:4.02e5),'r');
hold off;
xlabel('n'), ylabel('Amplitud');
legend('ECG sin filtrar','ECG filtrado');
title('Senal de ECG');

fc = fc + 1;

end
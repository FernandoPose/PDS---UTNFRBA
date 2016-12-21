function [fc] = ploteo_2B(Signal,SignalFilter,fc)

figure(fc);

hold on;
plot(Signal);
plot(SignalFilter,'r');
hold off;
xlabel('n'), ylabel('Amplitud');
legend('ECG sin filtrar','ECG filtrado');
title('Senal de ECG');

fc = fc + 1;

end
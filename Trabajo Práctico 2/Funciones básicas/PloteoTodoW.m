N = 100;

output = get_whann(N);
PloteoEspectroWdb(output,'r');
hold on;
output = get_wblackman_harris(N);
PloteoEspectroWdb(output,'b');
output = get_wflat_top(N);
PloteoEspectroWdb(output,'g');
output = get_whann_2(N);
PloteoEspectroWdb(output,'m');
output = get_wtriangular(N);
PloteoEspectroWdb(output,'k');
hold off;

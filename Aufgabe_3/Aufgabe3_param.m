clear all;
m = 10e-3;
ci = 0.01;
cy = 1;
L = 0.1;
R = 5;
low_lim = -0.05;
high_lim = 0.005;
op_lim = 6;
init_pos=-0.001;
Kr = 4000;

Tv_array = linspace(0.035, 0.11, 5);

for count=1:length(Tv_array)
Tv = Tv_array(count);

opt=simset('MaxStep', 0.0001);
simout=sim("Aufgabe3_sim.slx" , [0,3], opt);
time=simout.tout;
stellgroesse = simout.stellgroesse.Data;
regelgroesse = simout.regelgroesse.Data;

f=figure(count); clf;
title(strcat('Aufgabe 3b/c Tv=', num2str(Tv)));
hold on;
yyaxis left;
plot(time, stellgroesse,'b', 'LineWidth', 2);
yyaxis right;
plot(time, regelgroesse, 'r', 'LineWidth', 2);
xlabel('Zeit[s]');
legend("Stellgroesse", "Regelgroesse[m]");
hold off;
exportgraphics(f,strcat(strcat('./Schaubilder/Aufgabe3bcTv=', num2str(Tv)), '.png'),'Resolution',300);
end
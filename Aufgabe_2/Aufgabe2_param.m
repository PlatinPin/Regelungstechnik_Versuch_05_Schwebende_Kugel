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

Kr_array = [900, 500, 100, 1000, 1200, 1500];

for count=1:length(Kr_array)
Kr = Kr_array(count);

opt=simset('MaxStep', 0.0001);
simout=sim("Aufgabe2_sim.slx" , [0,25], opt);
time=simout.tout;
Sprung = simout.Sprung.Data;
Antwort = simout.Antwort.Data;

f=figure(count); clf;
title(strcat('Aufgabe 2a Kr=', num2str(Kr)));
hold on;
plot(time, Sprung,'b', 'LineWidth', 2);
plot(time, Antwort, 'r', 'LineWidth', 2);
xlabel('Zeit[s]');
legend("Sprung", "Antwort");
hold off;
%exportgraphics(f,strcat(strcat('./Schaubilder/Aufgabe2Kr=', num2str(Kr)), '.png'),'Resolution',300);
end
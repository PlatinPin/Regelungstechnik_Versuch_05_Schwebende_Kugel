m = 10e-3;
ci = 0.01;
cy = 1;
L = 0.1;
R = 5;

opt=simset('MaxStep', 0.00001);
simout=sim("Aufgabe1_sim.slx" , [0,1], opt);
time=simout.tout;
Sprung = simout.Sprung.Data;
Antwort = simout.Antwort.Data;

f=figure(1); clf;
title('Aufgabe 1d');
hold on;
plot(time, Sprung,'b', 'LineWidth', 2);
plot(time, Antwort, 'r', 'LineWidth', 2);
xlabel('Zeit[s]');
legend("Sprung", "Antwort");
exportgraphics(f,'./Schaubilder/Aufgabe1.png','Resolution',300);
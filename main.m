clc;
clear;
close all;

% parametry układu
l = 1; % odleglosc punktu masowego od osi obrotu
f_c_s = 0.61; % wspolczynnik tarcia statyczny 
f_c_k = 0.47; % wspolczynnik tarcia kinematyczny

% system model definition
A = 0;
B = 0;
C = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 0];
D = 0;


% Symulacja modelu
T = 10; % czas symulacji
sim_step = 0.01; %Krok symulacji
out = sim('Pendulum_dynamics.slx', T)

figure(1);
subplot(3, 2, 1);
plot(out.tout, out.y1);

subplot(3, 2, 2);
plot(out.tout, out.y2);

subplot(3, 2, 3);
plot(out.tout, out.y3);

subplot(3, 2, 4);
plot(out.tout, out.y4);

subplot(3, 2, 5);
plot(out.tout, out.y5);

subplot(3, 2, 6);
plot(out.tout, out.y6);

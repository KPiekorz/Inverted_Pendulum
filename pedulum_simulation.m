clc;
clear;
close all;

%% stan poczatkowy
x_0 = 0;
theta_0 = 0;

%% parametry ukladu
m = 0.12;
g = 9.81;
M = 0.5723;
l = 0.5;
fi = 0.67;

%% macierze stanu ukladu

A = [0 0 1 0; 0 0 0 1; 0 (-(m*g)/M) (-fi/M) 0; 0 (((M + m) * g)/(M * l)) (fi/(M * l)) 0]
B = [0; 0; (1/M); ((-1)/(M * l))]
C = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
D = [0; 0; 0; 0];



%% Real  model simulation
T = 100; % czas symulacji
sim_step = 0.01; %Krok symulacji
out = sim('Pendulum_dynamics.slx', T)


figure(1);
subplot(2, 2, 1);
plot(out.tout, out.states(:,1));
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(out.tout, out.states(:,3));
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(out.tout, out.states(:,2));
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(out.tout, out.states(:,4));
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")

%% Pendulum model simulation

figure(2);
subplot(2, 2, 1);
plot(out.tout, out.model(:,1));
title("x");
xlabel("Time t")
ylabel("x")

subplot(2, 2, 2);
plot(out.tout, out.model(:,2));
title("theta");
xlabel("Time t")
ylabel("theta")

subplot(2, 2, 3);
plot(out.tout, out.model(:,3));
title("x_prim");
xlabel("Time t")
ylabel("x_prim")

subplot(2, 2, 4);
plot(out.tout, out.model(:,4));
title("theta_prim");
xlabel("Time t")
ylabel("theta_prim")


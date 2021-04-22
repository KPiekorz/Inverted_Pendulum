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
l = 1;
fi = 0.41

%% macierze stanu ukladu

A = [0 0 1 0; 0 0 0 1; 0 (-(m*g)/M) (-fi/M) 0; 0 (((M + m) * g)/(M * l)) (fi/(M * l)) 0]
B = [0; 0; (1/M); ((-1)/(M * l))]
C = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 0];
D = [0; 0; 0; 0];


%% Symulacja modelu rzeczywistego 
T = 100; % czas symulacji
sim_step = 0.01; %Krok symulacji
out = sim('Pendulum_dynamics.slx', T)

%% Pozycja i predkosci ukladu rzeczywistego

figure(1);
subplot(2, 2, 1);
plot(out.tout, out.cart_position);
title("Real Cart position");
xlabel("Czas t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(out.tout, out.cart_velocity);
title("Real Cart velocity");
xlabel("Czas t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(out.tout, out.pendulum_angle);
title("Real Pendulum angle");
xlabel("Czas t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(out.tout, out.pendulum_velocity);
title("Real Pendulum velocity");
xlabel("Czas t")
ylabel("Pendulum velocity")

%% Stany ukladu rzeczywistego (wektory kolumnowe zmiennej out.states)

figure(2);
subplot(2, 2, 1);
plot(out.tout, out.states(:,1));
title("Real State Cart position");
xlabel("Czas t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(out.tout, out.states(:,3));
title("Real State Cart velocity");
xlabel("Czas t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(out.tout, out.states(:,2));
title("Real State Pendulum angle");
xlabel("Czas t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(out.tout, out.states(:,4));
title("Real State Pendulum velocity");
xlabel("Czas t")
ylabel("Pendulum velocity")

%% Model przemieszczneie wózka

figure(3);
plot(out.tout, out.model(:, 1))

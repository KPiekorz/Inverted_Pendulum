clc;
clear;
close all;

%% parametry układu
l = 1; % odleglosc punktu masowego od osi obrotu
f_c_s = 0.61; % wspolczynnik tarcia statyczny 
f_c_k = 0.47; % wspolczynnik tarcia kinematyczny

%% system model definition
A = 0;
B = 0;
C = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 0];
D = 0;


%% Symulacja modelu rzeczywistego 
T = 10; % czas symulacji
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

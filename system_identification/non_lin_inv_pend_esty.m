clc;
clear;
close all;

%% symulacja modelu rzeczywistego w simulinku
T = 100; % czas symulacji
sim_step = 0.01; %Krok symulacji
out = sim('pendulum_dynamics.slx', T)

%% prezentacja wymuszenia i odpowiedzi modelu rzeczywistego
figure(1);
plot(out.tout, out.u);
title("Input Cart Force")
xlabel("Time t")
ylabel("Force")

figure(2);
subplot(2, 2, 1);
plot(out.tout, out.states(:,1), "*r");
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(out.tout, out.states(:,3), "*r");
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(out.tout, out.states(:,2), ".-r");
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(out.tout, out.states(:,4), ".-r");
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")

%% stworzenie obiektu modelu do identyfikacji parametrycznej


%% testowanie odpowiedzi modelu przed estymacja


%% ientyfikacja parametrów


%% testowanie odpowiedzi modelu po estymacji


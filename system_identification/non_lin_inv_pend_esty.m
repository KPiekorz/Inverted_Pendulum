clc;
clear;
close all;

%% symulacja modelu rzeczywistego w simulinku
T = 20; % czas symulacji
sim_step = 0.0001; %Krok symulacji
out = sim('pendulum_dynamics.slx', T)

%% prezentacja wymuszenia i odpowiedzi modelu rzeczywistego
figure(1);
plot(out.tout, out.u, "-b");
title("Input Cart Force")
xlabel("Time t")
ylabel("Force")

figure(2);
subplot(2, 2, 1);
plot(out.tout, out.states(:,1), "*g");
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(out.tout, out.states(:,3), "*g");
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(out.tout, out.states(:,2), "*g");
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(out.tout, out.states(:,4), "*g");
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")

%% interpolacja stanów

t_inter = 1:0.001:T;
cart_pos = interp1(out.tout,out.states(:,1), t_inter);
cart_velo = interp1(out.tout,out.states(:,3), t_inter);
pend_pos = interp1(out.tout,out.states(:,2), t_inter);
pend_velo = interp1(out.tout,out.states(:,4), t_inter);

figure(3);
subplot(2, 2, 1);
plot(t_inter, cart_pos, "-k");
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(t_inter, cart_velo, "-k");
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(t_inter, pend_pos, "-k");
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(t_inter, pend_velo, "-k");
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")

%% stworzenie obiektu modelu do identyfikacji parametrycznej


%% testowanie odpowiedzi modelu przed estymacja


%% ientyfikacja parametrów


%% testowanie odpowiedzi modelu po estymacji


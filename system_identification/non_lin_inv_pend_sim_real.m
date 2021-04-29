clc;
clear;
close all;

%% symulacja modelu rzeczywistego w simulinku
T = 10; % czas symulacji
sim_step = 0.001; %Krok symulacji
t = 0:sim_step:T;
t = t';
impuls = 10;

% out = sim('pendulum_dynamics.slx', T)
out = sim('P1_Sim_2.slx', T);

%% prezentacja wymuszenia i odpowiedzi modelu rzeczywistego
figure(1);
plot(t, u, "-b");
title("Input Cart Force")
xlabel("Time t")
ylabel("Force")

figure(2);
subplot(2, 2, 1);
plot(t, states(:,1), ".g");
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(t, states(:,3), ".g");
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(t, states(:,2), ".g");
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(t, states(:,4), ".g");
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")

%% interpolacja stanów

% t_inter = 1:0.001:T;
% cart_pos = interp1(out.tout,out.states(:,1), t_inter);
% cart_velo = interp1(out.tout,out.states(:,3), t_inter);
% pend_pos = interp1(out.tout,out.states(:,2), t_inter);
% pend_velo = interp1(out.tout,out.states(:,4), t_inter);
% 
% figure(3);
% subplot(2, 2, 1);
% plot(t_inter, cart_pos, "-k");
% title("Real State Cart position");
% xlabel("Time t")
% ylabel("Cart position")
% 
% subplot(2, 2, 2);
% plot(t_inter, cart_velo, "-k");
% title("Real State Cart velocity");
% xlabel("Time t")
% ylabel("Cart velocity")
% 
% subplot(2, 2, 3);
% plot(t_inter, pend_pos, "-k");
% title("Real State Pendulum angle");
% xlabel("Time t")
% ylabel("Pendulum angle")
% 
% subplot(2, 2, 4);
% plot(t_inter, pend_velo, "-k");
% title("Real State Pendulum velocity");
% xlabel("Time t")
% ylabel("Pendulum velocity")

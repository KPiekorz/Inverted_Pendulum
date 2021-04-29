clc;
clear;
close all;

%% parametry symulacji

T = 10; % czas symulacji
sim_step = 0.01; %Krok symulacji
t = 0:sim_step:T;
t = t';
impuls = 1;

m = 0.12;
M = 0.5723;
g = 9.81;

fi = 0.00000041;
l = 0.019;

%% 
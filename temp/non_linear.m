clc;
clear;
close all;


fi = 0.41
m = 0.5
M = 1
g = 9.81
l = 1


T = 10; % czas symulacji
sim_step = 0.01; %Krok symulacji
out = sim('non_linear_model.slx', T);
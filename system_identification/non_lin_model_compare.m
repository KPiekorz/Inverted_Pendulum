clc;
clear;
close all;

%% parametry symulacji

T = 10;
sim_step = 0.01;
t = 0:sim_step:T;
t = t';
impuls = 10;

m = 0.12;
M = 0.5723;
g = 9.81;

fi = 0.4;
l =  0.012;

%% symulacja dla różnych parametrów

iter = 1

fric = linspace(0.0001, 0.0002, iter);
len = linspace(0.01, 0.03, iter);

figure(1);
for i = 1:iter
    for j = 1:iter

%         fi = fric(i);
%         l = len(j);
        fprintf("Tarcie: %d, Dlugosc: %d\n", fi, l);
        

        sim("non_lin_model_P1_Sim_2_compare");
        hold on;
        subplot(1, 2, 1);
        plot(non_lin_model_states);
        title("Non lin model");
        subplot(1, 2, 2);
        plot(real_states);
        title("Real model");
    end
end

%% 

q = quality_indicator_rmse(0, 0)

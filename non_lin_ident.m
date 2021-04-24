% clc;
% clear;
% close all;

%% Model for identyfication

file_name = 'non_linear_invpend_model';
Order = [4 1 4];
Parameters = [2; 0.41]; % l fi 
InitialStates = [0; pi; 0; 0]; % x theta dx/dt dtheta/dt

sys = idnlgrey(file_name, Order, Parameters, InitialStates, 0);

y_sys = sim(sys, out.data);

figure(5);
plot(y_sys);

%% Model parameter estimation

% m2 = nlgreyest(out.data, sys);

% y_m2 = sim(m2, out.data);
% 
% figure(6);
% plot(y_m2);

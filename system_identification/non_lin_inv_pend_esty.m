clc;
close all;

%% Data from real model for estimation
z = data;

z.Name = 'Inverted pendulum'
z.InputName = 'Force';
z.InputUnit = 'N';
z.OutputName = {'Cart position', 'Pendulum angle', 'Cart velocity', 'Pendulum angular velocity'}
z.OutputUnit = {'m', 'rad', 'm/s', 'rad/s'}
z.Tstart = 0;
z.TimeUnit = 's';

figure('Name', [z.Name ': Force -> Cart position']);
plot(z(:, 1, 1));

figure('Name', [z.Name ': Force -> Cart position']);
plot(z(:, 2, 1));

figure('Name', [z.Name ': Force -> Cart velocity']);
plot(z(:, 3, 1));

figure('Name', [z.Name ': Force -> Pendulum angular velocity']);
plot(z(:, 4, 1));

%% create non linear system model

file_name = 'non_lin_inverted_pendulum';
Order = [4 1 4];
% Parameters = [1; 0.41]; % l fi 
% Parameters = [0.3; 0.5]; % l fi 
% Parameters = [0.2; 0.5]; % l fi 

Parameters = [0.3; 0.6]; % l fi 

InitialStates = [0; pi; 0; 0]; % x theta dx/dt dtheta/dt

nlgr = idnlgrey(file_name, Order, Parameters, InitialStates, 0);

nlgr.SimulationOptions.AbsTol = 1e-12;
nlgr.SimulationOptions.RelTol = 1e-15;

%% compare real data and estimated model output

figure('Name', [z.Name ': Inverted pendulum model before estimation']);
compare(z, nlgr);

%% parameter model estimation

opt = nlgreyestOptions('Display', 'on', 'SearchMethod', 'auto');
opt.SearchOptions.MaxIterations = 1000;


nlgr = nlgreyest(z, nlgr, opt);

%% performance of evaluated model

nlgr.Report
fprintf('\n\nThe search termination condition:\n')
nlgr.Report.Termination

figure('Name', [z.Name ': Inverted pendulum model after estimation']);
compare(z, nlgr);

present(nlgr);

clear all;
load('ideal_pendulum_states.mat');

time = 0:0.01:20;
step_value = 1;
sim_step = 0.01;
T = 20;
g = 9.81;
figure(1);
plot(time,states(:,2));
[pks,locs] = findpeaks(states(:,2));
mean_period = mean(diff(time(locs)));

l = g*((mean_period/(2*pi))^2)

%%
load('cart_no_pendulum.mat');
figure(2);
plot(time,states(:,3));
M = 0.5723 + 0.12;
Fk = mean(fric);
f = Fk/(M*g)

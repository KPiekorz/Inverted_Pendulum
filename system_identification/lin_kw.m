clear all; close all;

m = 0.12;
M = 0.5723;
g = 9.81;
J = 0.0038583;
step_value = 10;
T = 50;
sim_step = 0.01;

l = 0.01955717;
f = 0.027344;

time = sim('lin_kw_sim.slx');
t = time;
%%
figure(1);
plot(t, u, "-b");
title("Input Cart Force")
xlabel("Time t")
ylabel("Force")

figure(2);
subplot(2, 2, 1);
plot(t, states(:,1));
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(t, states(:,3));
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(t, states(:,2));
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(t, states(:,4));
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")

figure(3);
subplot(2, 2, 1);
plot(t, states_ident(:,1));
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(t, states_ident(:,3));
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(t, states_ident(:,2));
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(t, states_ident(:,4));
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")




figure(4);
subplot(2, 2, 1);
plot(t, states_ident_v2(:,1));
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(t, states_ident_v2(:,3));
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(t, states_ident_v2(:,2));
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(t, states_ident_v2(:,4));
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")

figure(5);
subplot(2, 2, 1);
plot(t, states_ident_v3(:,1));
title("Real State Cart position");
xlabel("Time t")
ylabel("Cart position")

subplot(2, 2, 2);
plot(t, states_ident_v3(:,3));
title("Real State Cart velocity");
xlabel("Time t")
ylabel("Cart velocity")

subplot(2, 2, 3);
plot(t, states_ident_v3(:,2));
title("Real State Pendulum angle");
xlabel("Time t")
ylabel("Pendulum angle")

subplot(2, 2, 4);
plot(t, states_ident_v3(:,4));
title("Real State Pendulum velocity");
xlabel("Time t")
ylabel("Pendulum velocity")



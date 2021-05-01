clear all; close all;

% parameters
m = 0.12;
M = 0.5723;
g = 9.81;

% l and gamma2 from identification
gamma2 = 0.267534;
l = 0.512166;

% state matrices after linearization
A = [0          0           1           0;
     0          0           0           1;
     0      -(m*g/M)    -gamma2/M       0;
     0    g*((M+m))/(M*l)   gamma2/(M*l)    0];
B = [0 0 1/M -1/(M*l)]';
C = [1 1 1 1];
D = 0;

% observability and controllability test
ob = obsv(A,C);
rank(ob);                       % n=4: observable
ct = ctrb(A,B);
rank(ct);                       % n=4: controllable

% lqr coefficients calculation
Q = [0.0001 0 0 0;                   % "importance" of x state (low)
     0 100 0 0;                  % "importance" of theta state (high)
     0 0 0.001 0;                   % x' doesnt matter
     0 0 0 0.001];                  % theta' doesnt matter
R = 10;                         % control limitation (low)

K = lqr(A,B,Q,R);               % LQ regulator parameters
disp(['K = [',num2str(K(1)),',',num2str(K(2)),',',num2str(K(3)),',',num2str(K(4)),'];']);
K(4) = K(4)/100;
K(3) = K(3)/100;
% set simulation time, initial conditions and simulate 
t = 10;
init_cond = [0 -pi/100 0 0];
stab_point = [0 0 0 0];
sim('P1_Sim_2.slx');
u_states = [u,states];
% state and control observation
time = 0:0.01:t;
figure(1)
subplot(3,2,1:2)
plot(time,u);
title('control');
subplot(3,2,3)
plot(time, states(:,1));
title('displacement');
subplot(3,2,4)
plot(time, states(:,2));
title('angle');
subplot(3,2,5)
plot(time, states(:,3));
title('velocity');
subplot(3,2,6)
plot(time, states(:,4));
title('angular velocity');



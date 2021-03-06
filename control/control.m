clear all; close all;

% parameters
m = 0.12;
MM = 0.5723;
g = 9.81;
%M= 0.5723;

% l and gamma2 from identification
gamma2 = 0.267534;
l = 0.512166;

% state matrices after linearization
A = [0          0           1           0;
     0          0           0           1;
     0      -(m*g/MM)    -gamma2/MM     0;
     0  g*((MM+m))/(MM*l) gamma2/(MM*l) 0];
B = [0 0 1/MM -1/(MM*l)]';
C = [1 1 1 1];
D = 0;

% observability and controllability test
ob = obsv(A,C);
rank(ob);                       % n=4: observable
ct = ctrb(A,B);
rank(ct);                       % n=4: controllable

% lqr coefficients calculation
Q = [10 0 0 0;                   
     0 100 0 0;                   
     0 0 10 0;                   
     0 0 0 100];                
R = 1;                          

K = lqr(A,B,Q,R);               % LQ regulator parameters
disp(['K = [',num2str(K(1)),',',num2str(K(2)),',',num2str(K(3)),',',num2str(K(4)),'];']);
%K = [-1, -1.7, -1, -1.7];
% K(4) = K(4)/100;
% K(3) = K(3)/100;
% set simulation time, initial conditions and simulate 
t = 100;

init_cond = [0 pi 0 0];
stab_point = [0 0 0 0];
amplitude = 0.7;
%% simulate
sim('P1_Sim_2_1.slx');

u_states = [u,states];
errors_u = [error_x, error_theta, error_dx,u];
% state and control observation
time = 0:0.01:t;
close(figure(1));
figure(1)
subplot(3,2,1:2)
plot(time,u);
xlabel('time[s]');
ylabel('u[N]');
title('control');
subplot(3,2,3)
states(1:2117,1)=states(1:2117,1)./4;
plot(time, states(:,1));
title('displacement');
xlabel('time[s]');
ylabel('x_1[m]');
grid on
%axis([0 t -2 2]);
subplot(3,2,4)
plot(time, pendulum_angle_conv);
hold on; grid on;
plot(time, states(:,2));
title('angle');
xlabel('time[s]');
ylabel('x_2[rad]');
legend('normalized angle', 'original angle');
%axis([0 t -pi/4 pi/4]);
subplot(3,2,5)
plot(time, states(:,3));
%axis([0 t -1 1]);
title('velocity');
xlabel('time[s]');
ylabel('x_3[m/s]');
grid on
subplot(3,2,6)
plot(time, states(:,4));
%axis([0 t -2 2]);
grid on
title('angular velocity');
xlabel('time[s]');
ylabel('x_4[st/s]');



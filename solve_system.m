clc;
clear;
close all;

% x1 = x 
% x2 = theta
% x3 = dx/dt
% x4  = dtheta/dt

syms x y x3 x4 x1 x2 m M l F fi g i j

% x = ddx/ddt
% y = ddtheta/ddt

% i = sin(x2)
% j = cos(x2)

equ1 = (M + m)*x == F + (m*l*i*(x4)^2) - (m*l*j*y) - (fi*x3)

equ2 = (4/3)*l*y == (g*i) - (j*x)

[x, y] = solve(equ1, equ2, x, y)
function [A,B,C,D] = model_structure(par,T)

% A = [0 1; 0 par(1)]; 
% B = [0;par(2)];
% C = eye(2);
% D = zeros(2,1);
% K = zeros(2,2);
% x0 = [par(3);0];


M = 0.5723;
m = 0.12;
g = 9.81;

% fi = par(1)
% l = par(2)

A = [0 0 1 0; 0 0 0 1; 0 (-(m*g)/M) (-par(1)/M) 0; 0 (((M + m) * g)/(M * par(2))) (par(1)/(M * par(2))) 0]
B = [0; 0; (1/M); ((-1)/(M * par(2)))]
C = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
D = [0; 0; 0; 0]

% K = zeros(4,4);
% x0 = [0, pi, 0, 0];

end


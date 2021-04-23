function [dx, y] = non_linear_invpend_model(t, x, u, m, M, g, l, fi, varargin)

% Output equations.
y = [x(1);                         ... % Cart position.
     x(2);                         ... % Pendulum angle.
     x(3);                         ... % Cart velocity.
     x(4)                          ... % Pendulum angular velocity.
    ];

% State equations.
dx = [x(3);                        ... % Cart velocity.
      x(4);                        ... % Pendulum angular velocity.
      (-3*g*sin(x(2))*cos(x(2))*m^2 + 4*sin(x(2))*l*m*x(4)^2 + 4*u - 4*fi*x(3)) / (-3*m*cos(x(2))^2 + 4*M + 4*m);                                            ... % Cart acceleration.
      (3 * (g*sin(x(2))*m^2 - sin(x(2))*cos(x(2))*l*m*x(4)^2 + M*g*sin(x(2))*m - u*cos(x(2)) + fi*cos(x(2))*x(3))) / (l * (-3*m*cos(x(2))^2 + 4*M + 4*m))    ... % Pendulum angular acceleration.
     ];
  
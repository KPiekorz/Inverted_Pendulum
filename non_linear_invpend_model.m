function [dx, y] = non_linear_invpend_model(t, x, u, tau, k, varargin)

% Output equations.
y = [x(1);                         ... % Cart position.
     x(2);                         ... % Pendulum angle.
     x(3);                         ... % Cart velocity.
     x(4)                          ... % Pendulum angular velocity.
    ];

% State equations.
dx = [x(3);                        ... % Cart velocity.
      x(4);                        ... % Pendulum angular velocity.
      ;  ... % Cart acceleration.
         ... % Pendulum angular acceleration.
     ];
  
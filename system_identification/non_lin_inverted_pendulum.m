function [dx, y] = non_lin_inverted_pendulum(t, x, u, l, fi, varargin)

m = 0.12;
M = 0.5723;
g = 9.81;

% Output equations.
y = [x(1);                         ... % Cart position.
     x(2);                         ... % Pendulum angle.
     x(3);                         ... % Cart velocity.
     x(4)                          ... % Pendulum angular velocity.
    ];

% State equations.
dx = [x(3);                        ... % Cart velocity.
      x(4);                        ... % Pendulum angular velocity.
      ( ( 4*sin(x(2))*l*m*(x(4)^2) ) + ( 4*u ) - ( 4*fi*x(3) ) - ( 3*g*sin(x(2))*cos(x(2))*m ) ) / ( ( -3*m*(cos(x(2))^2) ) + ( 4*M ) + ( 4*m ) );                                            ... % Cart acceleration.
      ( 3 * ( ( -sin(x(2))*cos(x(2))*l*m*(x(4)^2) ) - ( u*cos(x(2)) ) + ( M*g*sin(x(2)) ) + ( g*sin(x(2))*m ) + ( fi*cos(x(2))*x(3) ) ) ) / ( l * ( ( -3*m*(cos(x(2))^2) ) + ( 4*M ) + ( 4*m ) ) )
      ];
end
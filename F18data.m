CG = 23.8;              % center of gravity as percent mac 
r2d = 180/pi;
d2r = 1/r2d;
k2fps = 1.68781; 
g = 32.2;               % gravitational constant,ft/s^2

Ixx = 23000;            % roll inertia (slug*ft^2)
Iyy = 151293;           % pitch inertia (slug*ft^2) 
Izz = 169945;           % yaw intertia (slug*ft^2) 
 Ixz = -2305;            % product of inertia (slug*ft^2)
 weight = 36099;         % lbs
 m = 1036;             % slug  
% S = 400;                % Reference Area, ft^2
% b =  37.42;             % Wing Span, ft
% c =  11.52;             % Aerodynamic Mean Chord, ft
% rho = 1.0660e-003;      % Air Density, slugs/ft^3  --- 25C / 25000 ft
R = 180/pi;
S = 400;                % Reference Area, ft^2
b =  37.42;             % Wing Span, ft
c =  11.52;             % Aerodynamic Mean Chord, ft
%rho = 1.0660e-003;      % Air Density, slugs/ft^3  --- 25C / 25000 ft
% Ixx = 23000;            % Principle Moment of Intertia around X-axis, slugs*ft^2
% Iyy = 151293;           % Principle Moment of Intertia around Y-axis,slugs*ft^2 
% Izz = 169945;           % Principle Moment of Intertia around Z-axis,slugs*ft^2 
% Ixz = - 2971;           % Principle Moment of Intertia around XZ-axis,slugs*ft^2
% m = 1034.5;             % mass, slugs
g = 32.2;               % gravitational constant,ft/s^2
% Last edit: 6/21/2017, GM
% Check windfield velocity, does not contribute to the air speed %

% Inputs :
% Vt       = y(1);      Air speed,  ft/s
% alpha    = y(2);      AOA, rad
% beta     = y(3);      Sideslip, rad
% p        = y(4);      Body-axis roll rate, pr, rad/s
% q        = y(5);      Body-axis pitch rate, pr, rad/s
% r        = y(6);      Body-axis yaw rate, pr, rad/s
% phi      = y(7);      Roll angle of body WRT Earth, roll, rad
% theta    = y(8);      Pitch angle of body WRT Earth, pitch, rad
% psi      = y(9);      Yaw angle of body WRT Earth, yaw, rad

%% Control Inputs in deg except throttle range: 0-1 %%
    
% dE   = u(1);      Elevator 
% dLEF = u(2);      Leading edge flap
% dTEF = u(3);      Trailing edge flap
% dSA  = u(4);      Stabilator
% dA   = u(5);      Aileron
% dR   = u(6);      Rudder
% dDHT = u(7);      Differential horizontal tail
% dT   = u(8);      Throttle

% Output

% ydot: Accelerations of the respective state

% EOM and Aerodynamic data extracted from
% Determination of the stability and control derivatives of the NASA F/A-18 HARV using flight data
% Napolitano and Spagnuolo, 1993, NASA Technical Report-CR-194838


function yd = aircraft_EOM(t,States,Controls)
 
y = States;
u = Controls;


run F18data.m 

V      = y(1);
alpha  = y(2); 
beta   = y(3); 
p      = y(4); 
q      = y(5);
r      = y(6); 
phi    = y(7);                                                                                                                              
theta  = y(8);
psi    = y(9);
T      = u(4);

    
rho = 1.225;	                     % Air density at sea level, Kg/m^3
rho = rho*0.0023768924;              % convert to slug/ft^3

[C_lift, C_drag,C_Y,Cl,Cm,Cn] = F18AERODYNAMICS(y,u);
    cosbeta  = cos(beta); 
    sinbeta  = sin(beta); 
    tanbeta  = tan(beta);  
    secbeta  = sec(beta); 
    cosalpha = cos(alpha); 
    sinalpha = sin(alpha); 
    cosphi   = cos(phi); 
    sinphi   = sin(phi); 
    costheta = cos(theta); 
    sintheta = sin(theta); 
    sectheta = sec(theta);
    tantheta =  tan(theta); 
gamma = asin(cosalpha*cosbeta*sintheta-sinbeta*sinphi*costheta-sinalpha*cosbeta*cosphi*costheta);
% chi   = asin(sec(gamma)*(cosalpha*cosbeta*costheta*sin(psi)+sinbeta*(sinphi*sintheta*sin(psi)...
%       + cosphi*cospsi)+sinalpha*cosbeta*(cosphi*sintheta*sin(psi)-sinphi*cos(psi))));

mu  = sec(gamma)*(sintheta*cosalpha*sinbeta+sinphi*costheta*cosbeta-sinalpha*sinbeta*cosphi*costheta);

singamma = sin(gamma);
cosmu    = cos(mu);
cosgamma = cos(gamma);

qbar = 0.5*rho*V^2;  % Dynamic pressure
L =  Cl*qbar*S*b ;
M =  Cm*qbar*S*c;
N =  Cn*qbar*S*b;
Y =  C_Y*qbar*S ;
Lift = C_lift*qbar*S ;
Drag = C_drag*qbar*S ;

% Body to Wind Axis Conversion of the Aerodynamic data
CD_w = C_drag*cosbeta-C_Y*sinbeta;
CY_w =  C_Y*cosbeta+C_drag*sinbeta;


% Vd =  (-qbar*S*CD_w/m)+g*(cosphi*costheta*sinalpha*cosbeta + ...
%      sinphi*costheta*sinbeta-sintheta*cosalpha*cosbeta) ...
%      + (T/m)*cosbeta*cosalpha;
% 
% betad =  ((qbar/(m*V))*S*CY_w)+p*sinalpha-r*cosalpha+....
%          (g*costheta*sinphi*cosbeta/V)+(sinbeta*(g*cosalpha*sintheta...
%          - g*sinalpha*cosphi*costheta+(T*cosalpha/m))/V);
% 
% alphad = (-Lift*secbeta/(m*V))+q-tanbeta*(p*cosalpha+r*sinalpha)...
%           + (g*(cosphi*costheta*cosalpha+sintheta*sinalpha)*secbeta/V)...
%           -(T*secbeta/(m*V))*sinalpha;
%       
% 
% 
% pd = ((Izz*L+Ixz*N-(Ixz*(Iyy-Ixx-Izz)*p+ ...
%      (Ixz^2+Izz*(Izz-Iyy))*r)*q)/(Ixx*Izz-Ixz^2));
%  
% qd = ((M+(Izz-Ixx)*p*r+(r^2-p^2)*Ixz)/Iyy);
% 
% rd =  ((Ixz*L+Ixx*N+(Ixz*(Iyy-Ixx-Izz)*r+...
%       (Ixz^2+Ixx*(Ixx-Iyy))*p)*q)/(Ixx*Izz-Ixz^2));

Vd     = (1/m)*(T*cosalpha*cosbeta- C_drag*qbar*S-m*g*singamma);
alphad = q-secbeta*((p*cosalpha+r*sinalpha)*sinbeta+(1/(m*V))*(T*sinalpha+C_lift*qbar*S-m*g*cosmu*cosgamma));
betad  = (1/(m*V))*(-T*cosalpha*sinbeta+C_Y*qbar*S+m*g*sin(mu)*cosgamma)+p*sinalpha-r*cosalpha;
pd     = ((Iyy-Izz)/Ixx)*q*r+(1/(2*Ixx))*L;
qd     = ((Izz-Ixx)/Iyy)*p*r+(1/(2*Iyy))*M;
rd     = ((Ixx-Iyy)/Izz)*p*q+(1/(2*Izz))*N;
%--------------------------------------------------------------------------
% Kinetics Equation

phid = p+(q*sinphi+r*cosphi)*tantheta;

thetad = q*cosphi-r*sinphi;

psid =  (q*sinphi+r*cosphi)*sectheta;



%--------------------------------------------------------------------------
% Group state derviatives

yd = [Vd ; alphad;betad; pd; qd; rd; phid; thetad; psid]; 


     





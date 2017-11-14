function [C_L, C_D,C_Y,Cl,Cm,Cn] = F18AERODYNAMICS(x,u)
r2d = 180/pi;
alpha =  r2d*x(2);
beta  =  r2d*x(3);
p     =  r2d*x(4);
q     =  r2d*x(5);
r     =  r2d*x(6);

u_e = u(1);
u_a = u(2);
u_r = u(3);

if -5<=alpha<=20
C_D = 0.0013*alpha^2-0.00438*alpha+0.1423;
else
C_D = -0.0000348*alpha^2+0.0473*alpha-0.3580;
end

C_Y = -0.0186*beta+(u_a/25)*(-0.00227*alpha+0.039)...
      +(u_r/30)*(-0.00265*alpha+0.141);

if -5<=alpha<=10  
C_L = 0.0751*alpha+0.0144*u_e+0.732;
else
C_L = -0.00148*alpha^2+0.106*alpha+0.0144*u_e+0.569;
end

if -5<=alpha<15
    cl1 = (-0.00012*alpha-0.00092)*beta;
else
    cl1 = (0.00022*alpha-0.006)*beta;
end
Cl  = cl1-0.0315*p+0.0126*r+...
    (u_a/25)*(0.00121*alpha-0.0628)-(u_r/30)*(0.000351*alpha-0.0124);

if -5<=alpha<=10
    cn1 = 0.00125*beta;
elseif 10<alpha&& alpha<=25
    cn1 = (-0.00022*alpha+0.00342)*beta;
else
    cn1 = -0.00201*beta;
end
Cn  = cn1-0.0142*r+(u_a/25)*(0.000213*alpha+0.00128)+(u_r/30)*(0.000804*alpha-0.0474);
Cm  = -0.00437*alpha-0.0196*u_e-0.123*q-0.1885;


end






%-------------------------------------------------------------------------
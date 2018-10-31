%Design conditions
Airfol = 'NACA 23015';
EW = 5 ; %kg
R_propeller = 0.35 ; %m ( propeller raidus)
A= pi*R_propeller^2;
h = 2; %km (altitud de vol de disseny)
h_al = 300; % m ( altura de vol de disseny)
N_blades = 2;
PL = 7.5 ; %kg
M_tip = 0.5;
Weight=EW + PL;


%Applying ISA and flight design conditions
a=-6.5;
T_0 = 288.15; %k
T_h= T_0 + a*h; %k
g=9.81;
gamma = 1.4;
R = 287;
v_proppeller = M_tip*sqrt(R*gamma*T_h);%m/s
omega_ideal = v_proppeller/R_propeller; %(rad/s)
rho_0 = 1.225;
rho = rho_0*(T_h/T_0)^(-(g)/(a*R));
vi_MTH = sqrt(((EW +PL)*g)/(2*rho*A));

% Chord distribution
r =  (linspace(0.05,R_propeller,N));
r=r';

% Non dimesional parameters
lamda_MTH_i= vi_MTH/(omega_ideal*R_propeller);
r = r/R_propeller;

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
Weight=EW + PL/2;

if(index == 1)
    v_c = 0;
end
if(index == 2)
    v_c = 2.5;
end
if(index == 3)
    v_c = 5;
end
if(index == 4)
    v_c = 7.5;
end



%Applying ISA and flight design conditions
a=-6.5;
T_0 = 288.15; %k
T_h= T_0 + a*h; %k
g=9.81;
gamma = 1.4;
R = 287;
v_sound = sqrt(R*gamma*T_h);
v_proppeller = M_tip*sqrt(R*gamma*T_h);%m/s
omega_ideal = v_proppeller/R_propeller; %(rad/s)
rho_0 = 1.225;
rho = rho_0*(T_h/T_0)^(-(g)/(a*R));


% Chord distribution
r =  (linspace(0.05,R_propeller,N));
r=r';

% Non dimesional parameters

r = r/R_propeller;

%Computing vi_MTH
if(v_c==0)
vi_MTH = sqrt(((EW +PL)*g)/(2*rho*A));
else
vi_MTH = (-v_c+ sqrt( v_c^2 + (4*(EW +PL)*g)/(2*rho*A)))/2;
end
lamda_MTH_i= vi_MTH/(omega_ideal*R_propeller);

Omega_vector(1,index) = omega_ideal;

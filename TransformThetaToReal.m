function [Theta_real] = TransformThetaToReal(r,Alpha_max_eff,lamda_MTH_i)

r_p = 0.7;

syms r_s Theta_sym(r_s);
Theta_s= deg2rad(Alpha_max_eff) + atan( (lamda_MTH_i)/r_s);
dTheta_s = diff(Theta_s,r_s);

%m
theta1_r= dTheta_s(0.7);
theta1=double(subs(theta1_r,0.7));

%thtea0
theta0 = double(subs(Theta_s(0.7),0.7))-theta1*r_p;

Theta_real = theta0 + theta1.*r;
end
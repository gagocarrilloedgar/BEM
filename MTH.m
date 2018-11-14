
Lambda_vector_MTH(:,index) = lamda_MTH_i*ones(N,1);

%Power
k= rho*0.5*(omega_ideal*R_propeller)^3 * R_propeller;
k_z = (0.5*rho*N_blades*(omega_ideal*R_propeller)^2);
lambda_c = v_c /(omega_ideal*R_propeller);
phi=atan((lambda_c + lamda_MTH_i)./r);

% Changin de cl for the correct one computed by alpha = theta - atan(lambda_i/r)
alpha_modified =  rad2deg(Theta_real - phi);

%Interpolation between alpha, cl and alpha_modified 
Cl_modified = interp1(Alpha,Cl,alpha_modified);
Cd_modified = interp1(Alpha, Cd,alpha_modified);
Cl_vector_MTH = Cl_modified;

dPi_dx_MTH(:,index) = k.*((lambda_c + lamda_MTH_i)^2 + r.^2).*sin(phi).*Chord_real.*Clopt;
dPp_dx_MTH(:,index) = k.*((lambda_c + lamda_MTH_i)^2 + r.^2).*cos(phi).*Chord_real.*Cd_modified;
dPt_dx_MTH(:,index) = dPi_dx_MTH(:,index) + dPp_dx_MTH(:,index);

P_tot_MTH(1,index) = 

%dFz
dFz_dx_MTH(:,index) = (k_z.*Chord_real.*((r.^2 +(lamda_MTH_i+lambda_c)^2)).*((Clopt.*r.*cos(phi))));


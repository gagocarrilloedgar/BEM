% Now prandtl root-tip vortex losses 
%[lambdai_BEM_PR] = InducedVelocityPrandtlLosses(Sigma_real,Cl_alpha,Theta_real,r,N,N_blades,omega_ideal,R_propeller,v_sound);

%BEM-Prandtl --> 
Cl_pchip2=pchip(Alpha,Cl);
Cd_pchip2=pchip(Alpha,Cd);
[lambdai_BEM_PR,phi] = InducedVelocityPrandtlLosses2(Sigma_real,Theta_real,r,N,N_blades,Cl_pchip2,Cd_pchip2,v_sound,omega_ideal,R_propeller);

% Changin de cl for the correct one computed by alpha = theta -
% atan(lambda_i/r) 
% We should ask if we have to do this

% Omega_BEM(1,1) = Omega_BEM(2,1);
% alpha_modified =  rad2deg(Theta_real - atan(lambdai_BEM./r));
% %Interpolation between alpha, cl and alpha_modified
% Cl_modified = interp1(Alpha, Cl,alpha_modified);
% Cd_modified = interp1(Alpha, Cd,alpha_modified);
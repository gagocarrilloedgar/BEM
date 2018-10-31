
format shortE;
format compact;

%Computing the induced velocities

% Now prandtl root-tip vortex losses 
[lambdai_BEM_PR] = InducedVelocityPrandtlLosses(Sigma_real,Cl_alpha,Theta_real,r,N,N_blades,M_tip);

% Changin de cl for the correct one computed by alpha = theta - atan(lambda_i/r)
alpha_modified =  rad2deg(Theta_real - atan(lambdai_BEM./r));

%Interpolation between alpha, cl and alpha_modified
Cl_modified = interp1(Alpha, Cl,alpha_modified);
Cd_modified = interp1(Alpha, Cd,alpha_modified);
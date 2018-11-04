
format shortE;
format compact;

%Computing the induced velocities

method = 2;
switch (method)
    case 1
        %Computing the induced velocities (Simplified )
        [lambdai_BEM] = InducedVelocityPrandtlLosses(Sigma_real,Cl_alpha,Theta_real,r,N,N_blades,omega_ideal,R_propeller,v_sound);
    case 2
        % Computing the induced BEM-Prandtl-Compr velocities (real)
        % To do de ppval
        Cl_pchip2=pchip(Alpha,Cl);
        Cd_pchip2=pchip(Alpha,Cd);
        [lambdai_BEM,phi] = InducedVelocityPrandtlLosses2(Sigma_real,Theta_real,r,N,N_blades,Cl_pchip2,Cd_pchip2,v_sound,omega_ideal,R_propeller,v_c);
    otherwise
        fprintf('Not available, sorry');
end

% Changin de cl for the correct one computed by alpha = theta - atan(lambda_i/r)
alpha_modified =  rad2deg(Theta_real - atan(lambdai_BEM./r));

%Interpolation between alpha, cl and alpha_modified ( we need to ask aleix
%if this is needed
Cl_modified = interp1(Alpha, Cl,alpha_modified);
Cd_modified = interp1(Alpha, Cd,alpha_modified);

%Now we need the limits for the Bolzano method
GettingOmegaLimits;

%This defines wether the bolzano method will take lambda_i into account or
%not
% 1 --> no
% 2 --> yes
BolzanoMethod = 2;

%Computing the bolzano theorem in order to find the right omega
BolzanoTheorem;
Omega_BEM = (omega_a + omega_c)/2;
lambda_c = v_c/(Omega_BEM*R_propeller);
ComputesPower

dFz_PrGl = dFz;
Lambdai_PrGl=lambdai_BEM;
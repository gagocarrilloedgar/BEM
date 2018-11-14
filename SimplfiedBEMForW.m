
format shortE;
format compact;

% Starting the BEM method without inclding prandtl neither compressibility
% corrections

method = 2;
K=N;
switch (method)
    case 1
        %Computing the induced velocities (Simplified )
        [lambdai_BEM] = InducedVelocityBEM(Sigma_real,Cl_alpha,Theta_real,r,N);
    case 2
        % Computing the induced velocities (real)
        % To do de ppval
        Cl_pchip2=pchip(Alpha,Cl);
        Cd_pchip2=pchip(Alpha,Cd);
        [lambdai_BEM,phi] = InducedVelocityBEM2(Sigma_real,Theta_real,r,N,Cl_pchip2,Cd_pchip2,v_c,omega_ideal,R_propeller);
    otherwise
        fprintf('Not available, sorry');
end

% Changin de cl for the correct one computed by alpha = theta - atan(lambda_i/r)
alpha_modified =  rad2deg(Theta_real - atan(phi'));

%Interpolation between alpha, cl and alpha_modified
Cl_modified = interp1(Alpha, Cl,alpha_modified);
Cd_modified = interp1(Alpha, Cd,alpha_modified);
Cl_modified_Simpl = Cl_modified;

%Now we need the limits for the Bolzano method
F_comp =ones(N,1);
GettingOmegaLimits;

%This defines wether the bolzano method will take lambda_i into account or
%not
% 1 --> no
% 2 --> yes
if(index ==1)
    BolzanoMethod = 1;
    VcValue = 0;
else
    BolzanoMethod = 1;
    VcValue = 1;
end

%Computing the bolzano theorem in order to find the right omega
BolzanoTheorem;

Omega_BEM = (omega_a + omega_c)/2;
Omega_vector(2,index) = Omega_BEM;
lambda_c = v_c/(Omega_BEM*R_propeller);

%Computing the power needed
ComputesPower; 
dPt_Deltax_Sim = dPt_Deltax;
dPi_Deltax_Sim = dPi_Deltax;
dPt_dx_BEM(1:end-1,index) = dPp_Deltax;
Cl_vector_BEM = Cl_modified;
dFz_dx_BEM(:,index) = -dFz;
P_tot_BEM(1,index) = Pt;

lambda_vector_BEM(:,index) = lambdai_BEM;

format shortE;
format compact;

%Computing the induced velocities

method = 2;
K=N-1;
switch (method)
    case 1
        %Computing the induced velocities (Simplified )
        [lambdai_BEM] = InducedVelocityPrandtlLosses(Sigma_real,Cl_alpha,Theta_real,r,N,N_blades,omega_ideal,R_propeller,v_sound);
    case 2
        % Computing the induced BEM-Prandtl-Compr velocities (real)
        % To do de ppval
        Cl_pchip2=pchip(Alpha,Cl);
        Cd_pchip2=pchip(Alpha,Cd);
        [lambdai_BEM,phi,F_Comp] = InducedVelocityPrandtlLosses2(Sigma_real,Theta_real,r,N,N_blades,Cl_pchip2,Cd_pchip2,v_sound,omega_ideal,R_propeller,v_c);
    otherwise
        fprintf('Not available, sorry');
end

% Changin de cl for the correct one computed by alpha = theta - atan(lambda_i/r)
alpha_modified =  rad2deg(Theta_real - atan(phi'));

%Interpolation between alpha, cl and alpha_modified ( we need to ask aleix
%if this is needed
Cl_modified = interp1(Alpha,Cl,alpha_modified);
Cl_modified =Cl_modified./F_Comp;
Cd_modified = interp1(Alpha, Cd,alpha_modified);
Cl_modified_Pr = Cl_modified;
Cd_modified_Pr = Cd_modified;

%Now we need the limits for the Bolzano method

GettingOmegaLimits2;

%This defines wether the bolzano method will take lambda_i into account or
%not
% 1 --> no
% 2 --> yes

BolzanoMethod = 2;
VcValue = 0;

%Computing the bolzano theorem in order to find the right omegas
BolzanoTheorem;
Omega_BEMPr= (omega_a + omega_c)/2;
Omega_vector(3,index) = Omega_BEMPr;
lambda_c = v_c/(Omega_BEMPr*R_propeller);

%Computing the power needed
ComputesPower2; 
dPt_Deltax_Pr = dPt_Deltax;
dPi_Deltax_Pr = dPi_Deltax;
dPp_Deltax_Pr = dPp_Deltax;

%Preparing vectors for the plots
dPt_dx_Pr(1:end-1,index) = dPt_Deltax;
dPt_dx_Pr(1:end-1,index) = dPt_Deltax;
dPt_dx_Pr(1:end-1,index) = dPt_Deltax;

Cl_vector_Pr = Cl_modified;
dFz_dx_Pr(:,index) = -dFz;
P_tot_Pr(1,index) = Pt;
P_i_Pr(1,index) = Pi;
P_p_Pr(1,index) = Pp;

lambda_vector_Pr(:,index)=lambdai_BEM;
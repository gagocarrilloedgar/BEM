
format shortE;
format compact;

%Computing the induced velocities
%[lambdai_BEM] = InducedVelocityBEM(Sigma_real,Cl_alpha,Theta_real,r,N);

% To do de ppval
Cl_pchip2=pchip(Alpha,Cl);
Cd_pchip2=pchip(Alpha,Cd);
[lambdai_BEM,phi] = InducedVelocityBEM2(Sigma_real,Theta_real,r,N,Cl_pchip2,Cd_pchip2);

% Changin de cl for the correct one computed by alpha = theta - atan(lambda_i/r)
alpha_modified =  rad2deg(Theta_real - atan(lambdai_BEM./r));

%Interpolation between alpha, cl and alpha_modified
Cl_modified = interp1(Alpha, Cl,alpha_modified);
Cd_modified = interp1(Alpha, Cd,alpha_modified);
% 
%We will start calculation  with omega_ideal
%Finding the omega limits in order to be aable to apply the bolzano theorem
omega = omega_ideal;
F1=-3;
i=0;
option = 2;
switch(option)
    case 1
        while(F1<0)
            [F1] =   WdFz(omega,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,N_blades,phi,lambdai_BEM);
            omega = omega*1.5;
        end
    case 2 % Numerical integration in order to find the right 

        while(F1<0)
            [F1] =  WdFzNumeric(omega,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,r,N_blades,phi,lambdai_BEM);
            omega = omega - 100;
        end
    otherwise
end



%Computing the bolzano theorem in order to find the right omega
BolzanoTheorem;

Omega_BEM = (omega_a + omega_c)/2;
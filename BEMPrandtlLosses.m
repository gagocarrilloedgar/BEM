
format shortE;
format compact;

%Computing the induced velocities

InducedPrGl;

F1=-3;
i=0;
option = 2;
omega = omega_ideal;
switch(option)
    case 1
        while(F1<0)
            [F1] =   WdFz(omega,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,N_blades,phi,lambdai_BEM_PR);
            omega = omega*1.5;
        end
    case 2 % Numerical integration in order to find the right 
        while(F1<0)
            [F1] =  WdFzNumeric(omega,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,r,N_blades,phi,lambdai_BEM_PR);
            omega = omega - 50;
        end
    otherwise
end

%Computing the bolzano theorem in order to find the right omega
BolzanoTheorem2;
Omega_BEM(2,1) = (omega_a + omega_c)/2;

err = abs(Omega_BEM(2,1) - Omega_BEM(1,1));


omega = omega_ideal;
F1=3;
i=0;
option = 2;
switch(option)
    case 1
        while(F1<0)
            [F1,dFza] =   WdFz(omega,R_propeller,rho,Chord_real,Cl_modified,Cd_modified,N,Weight,N_blades,phi,lambdai_BEM);
            omega = omega*1.5;
        end
    case 2 % Numerical integration in order to find the right 

        while(F1>0)
            [F1,dFza] =  WdFzNumeric(omega,R_propeller,rho,Chord_real,Cl_modified,Cd_modified,N,Weight,r,N_blades,phi,lambdai_BEM,v_c,F_comp,K);
            omega = omega + 100;
        end
    otherwise
end
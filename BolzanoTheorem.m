%Bolzano theorem around W
epsilon = 10^(-3); % covergence limit
omega_a = omega_ideal; % first omega limit
omega_b = omega; % last omega limit

%Error definion
epsilon_1 = 1 ;
epsilon_2 = 1 ;

%Option definition
option = 2; % 1)symbolic; 2) numerical

while(epsilon_1>epsilon && epsilon_2> epsilon)
    
    i=i+1;
    %Mid point
    omega_c = (omega_a + omega_b) / 2; % % omega average
    switch(option)
        case 1
            %Computing the needed points
            [F1_a,dFza] =  WdFz(omega_a,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,N_blades,phi,lambdai_BEM);
            [F1_b,dFzb] =  WdFz(omega_b,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,N_blades,phi,lambdai_BEM);
            [F1_c,dFz] =  WdFz(omega_c,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,N_blades,phi,lambdai_BEM);
        case 2
            %Computing the needed points
            [F1_a,dFza] =  WdFzNumeric(omega_a,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,r,N_blades,phi,lambdai_BEM,v_c);
            [F1_b,dFzb] =  WdFzNumeric(omega_b,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,r,N_blades,phi,lambdai_BEM,v_c);
            [F1_c,dFz] =  WdFzNumeric(omega_c,R_propeller,rho,Chord_real,Cl,Cd,N,Weight,r,N_blades,phi,lambdai_BEM,v_c);
        otherwise
            fprintf('Not an option');
            break;
    end
    
    %Error evaluation
    epsilon_1 = abs(F1_c);
    epsilon_2 = abs(omega_a - omega_b)/omega_c;
    
    if(F1_a * F1_b < 0)
        if(F1_a * F1_c >0)
            omega_a = omega_c;
        else
            omega_b = omega_c;
        end
    end
    if(F1_a * F1_b > 0)
        omega_b = 1.5*omega_b;
    end
    
    if(BolzanoMethod == 2)
        [lambdai_BEM_PR,phi] = InducedVelocityPrandtlLosses2(Sigma_real,Theta_real,r,N,N_blades,Cl_pchip2,Cd_pchip2,v_sound,omega_ideal,R_propeller,v_c);
    end
    
    if(VcValue == 1)
        InducedVelocityBEM2(Sigma_real,Theta_real,r,N,Cl_pchip2,Cd_pchip2,v_c,omega_c,R_propeller);
    end
    
    
end
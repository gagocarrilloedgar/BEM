function [x_c] = MetodoDeLabBiseccion(TW,omega_ideal)

%Compute X_c
x_a = omega_ideal;
x_b = 4*x_a;
x_c = (x_a + x_b) / 2 ;

% Here we have to call F1(omega) in order to evaluate the convergence
% F1 = w/(omega_ideal)^2 * pi *rho - int( dC_fz)
[F1] = CompuesFc(omega_ideal,R,rho,lamda_i,v_c);

% convergence of the function
epsilon = 10^(-3);

epsilon_1 = abs(F1) / TW ;
epsilon_2 = abs(x_a - x_b)/x_c;

while( epsilon_1 < epsilon && epsilon_2 < epsilon )
    
    % Here we have to call F1(omega) in order to evaluate the convergence
    [F1] = CompuesFc();
    
    % convergence of the function
    epsilon = 10^(-3);
    
    epsilon_1 = abs(F1) / TW ;
    epsilon_2 = abs(x_a - x_b)/x_c;
    
end

end
function [lambda_i] = InducedVelocityPrandtlLosses(sigma,Cl_alpha,theta,r,N,nblades,Mtip)


%Hipotesis taken in order to simplified the bem equation:
%Vc = 0 ( Design Condition)
%Cl(alpha) = Cl_alpha * alpha
%Introducint F and f_tip , f_root

%Minimum error:
delta = 10e-3;

%Computing phi^k , F^k
fun = @Solver;
x0 = zeros(N,1);
lambda_i_k=fsolve(fun,x0);

%Prandtl-Glauert compressibility corrections
PrGl = Cl_alpha/sqrt(1 - Mtip^2); % m va multiplicado por r(i)

%Deifintion of functions F,f_tip,f_root and phi
r_root=r(1,1);
k=4/pi^2; % just to make the equation more understandable
f_tip =@(phi,r)0.5*nblades.*( (1 - r )./(r.*sin(phi)));
f_root =@(phi,r)0.5*nblades.*( (r - r_root)./ (r.*sin(phi)));
F_Pr =@(f_tip,f_root,r,phi)k.*acos(exp(-f_tip)).*acos(exp(-f_root));
phi=@(lamda_i,F,r,phi_k)0.5.*(phi_k + atan(lamda_i./(F.*r)));

%Defining prandlt-losses  and phi functions for K
phi_k = atan(lambda_i_k./r);
f_tip_k  =0.5*nblades*( (1 - r )./(r.*sin(phi_k)));
f_root_k =0.5*nblades*( (r -r_root)./(r.*sin(phi_k)));
F_K = k.*acos(exp(-f_tip_k)).*acos(exp(-f_root_k));

%Computing phi_k+1
phi_k_1 = phi(lambda_i_k,F_K,phi_k,r);

%Convergence
phi_err = max(abs(phi_k_1 - phi_k));

while (phi_err>delta)
    
    %Starting the iteration process ....F_k_1
    f_tip_k_1  =f_tip(phi_k_1,r);
    f_root_k_1=f_root(phi_k_1,r);
    F_K_1 =F_Pr(f_tip_k_1,f_root_k_1,r,phi_k_1);
    
    phi_k = phi_k_1;
    
    %Convergence
    phi_err = max(abs(phi_k_1 - phi_k));
    
end

%Now we re-compute  lambda_i
fun = @SolverPrandtl;
x0 = zeros(N,1);
lambda_i=fsolve(fun,x0);

%Computing 
    function F = Solver(x)
        F=zeros(N,1);
        for i = 1:N
            F(i) = 4*(x(i)^2)*r(i) - 0.5*sigma(i)*r(i)*Cl_alpha*(theta(i) - atan(x(i)/r(i)));
        end
    end

    function F1 = SolverPrandtl(x)
        F1=zeros(N,1);
        for i = 2:N-1
            F1(i) = 4*(x(i)^2)*r(i) - 0.5*sigma(i)*r(i)*Cl_alpha*(theta(i) - atan(x(i)/(F_K_1(i)*r(i))));
        end
    end

end
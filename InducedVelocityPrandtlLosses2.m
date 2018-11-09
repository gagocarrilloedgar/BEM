function [lambda_iPr,phi_pr,F_Comp] = InducedVelocityPrandtlLosses2(sigma,theta,r,N,nblades,cl_vec,cd_vec,v_sound,omega,R_propeller,v_c)

Cl_f =@(y) ppval(cl_vec,y);
Cd_f =@(y) ppval(cd_vec,y);

delta =10e-3;
Mtip = (omega*R_propeller )/ v_sound;
lambda_c = v_c/(omega*R_propeller);

for i = 1:N
    x0 =[0 0 0];
    fun = @(x) BEM(r(i),sigma(i),theta(i),Cl_f,Cd_f,x,Mtip,lambda_c);
    sol = fsolve(fun,x0);
    
    lambda_i_k(i) =sol(1);
    phi_pr(i) = sol(2);
end

lambda_i_k = lambda_i_k';
%Deifintion of functions F,f_tip,f_root and phi nad Mtip
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

lambda_iPr = zeros(N,1);
F_Comp =zeros(N,1);
for i =2:N-1
    x0 = [0.001 0.001 0.001 0.001 0.001 0.001];
    fun = @(x) SolverPrandtl(r(i),sigma(i),theta(i),Cl_f,Cd_f,x,F_K_1(i),Mtip,lambda_c);
    sol=fsolve(fun,x0);
    lambda_iPr(i) = sol(1);
    phi_pr(i) = sol(2);
    F_Comp(i) = (sqrt(1-(Mtip^2)*(r(i)^2)));
    F_Comp(1,1) = 1;
    F_Comp(67,1) = (sqrt(1-(Mtip^2)*(1^2)));
end

end

function F = BEM(r,sigma,theta,Cl_f,Cd_f,x,Mtip,lambda_c)
lambda_i = x(1);
phi = x(2);
alpha = x(3);

F(1) = (8*(lambda_i)*(lambda_c+lambda_i) * r) - (( (Cl_f(rad2deg(alpha))*cos(phi))/(sqrt(1-(Mtip^2)*(r^2))) -Cd_f(rad2deg(alpha))*sin(phi))*sigma*(r^2 + (lambda_i+lambda_c)^2));
F(2) = phi - atan(lambda_i/r);
F(3) = alpha- theta + phi;
end

function F = SolverPrandtl(r,sigma,theta,Cl_f,Cd_f,x,F_K_1,Mtip,lambda_c)
lambda_i = x(1);
phi = x(2);
alpha = x(3);

F(1) = (8*(lambda_i)*(lambda_c+lambda_i) * r) - (( (Cl_f(rad2deg(alpha))*cos(phi))/(sqrt(1-(Mtip^2)*(r^2))) - Cd_f(rad2deg(alpha))*sin(phi))*sigma*(r^2 + (lambda_c+lambda_i)^2));
F(2) = phi - atan((lambda_i+lambda_c)/(r*F_K_1));
F(3) = alpha- theta + phi;
end
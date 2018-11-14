function [lambda_i,phi_bem] = InducedVelocityBEM2(sigma,theta,r,N,cl_vec,cd_vec,v_c,omega,R_propeller)

Cl_f =@(y) ppval(cl_vec,y);
Cd_f =@(y) ppval(cd_vec,y);

lambda_i = zeros(N,1);
x0 =[0 0 0];
lambda_c = v_c / (omega*R_propeller);
for i =1:N
    
    fun = @(x) BEM(r(i),sigma(i),theta(i),Cl_f,Cd_f,x,lambda_c);
    sol = fsolve(fun,x0);
    
    lambda_i(i,1) =sol(1);
    phi_bem(i)=sol(2);
end

end

function F = BEM(r,sigma,theta,Cl_f,Cd_f,x,lambda_c)
        lambda_i = x(1);
        phi = x(2);
        alpha = x(3);
        
        F(1) = (8*((lambda_i)*(lambda_c + lambda_i)) * r) - (( Cl_f(rad2deg(alpha))*cos(phi) - Cd_f(rad2deg(alpha))*sin(phi))*sigma*(r^2 + (lambda_i + lambda_c)^2));
        F(2) = phi - atan((lambda_i+lambda_c)/r);
        F(3) = alpha - theta + phi;
end

%% Recomputing power with omega BEM

dx = R_propeller/N;
PMTH=zeros(1,4);
v_c=[0 2.5 5 7.5];
lambda_c = v_c./(Omega_vector(2,:)*R_propeller);
for i=1:N
    for j=1:4
    P_MTH(i,j) =  4*pi*r(i)*(Omega_vector(2,j)*R_propeller)^3*R_propeller^2*lambda_vector_BEM(i,j)*((lambda_c(j)+lambda_vector_BEM(i,j))^2)*dx;
    PMTH(1,j) = PMTH(1,j) + P_MTH(i,j);
    end
end
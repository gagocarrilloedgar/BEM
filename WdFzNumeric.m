function [F1,dFz] =WdFzNumeric(omega,R_propeller,rho,C,Cl_modified,Cd_modified,N,Weight,r,nblades,phi,lambda_i,v_c,F_comp,K)


k= -(0.5*rho*nblades*(omega*R_propeller)^2); % constant values of the int
DeltaR = R_propeller/N;
r = r + DeltaR/2;
Fz = 0;
lambda_c = v_c /(omega*R_propeller);
dFz = zeros(N,1);
for i=1:K
    Int = (k*C(i)*(((r(i)^2 +(lambda_i(i)+lambda_c)^2))*(((Cl_modified(i)/(F_comp(i)))*r(i)*cos(phi(i))) - ((Cd_modified(i)*sin(phi(i)))))*DeltaR));
    Fz= Fz + Int;
    dFz(i,1) = Fz;
end

F1= 3.2*9.819 + Fz ;

end
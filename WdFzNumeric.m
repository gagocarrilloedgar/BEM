function [F1] =WdFzNumeric(omega,R_propeller,rho,C,Cl_modified,Cd_modified,N,Weight,r,nblades,phi,lambda_i)


k= -(0.5*rho*nblades*(omega*R_propeller)^2); % constant values of the int
DeltaR = R_propeller/N;
r = r + DeltaR/2;
Fz = 0;

for i=1:N
    Int = (k*C(i)*sqrt((r(i)^2+(lambda_i(i))^2))*((Cl_modified(i)*r(i)*cos(phi(i))) - ((Cd_modified(i)*sin(phi(i)))))*DeltaR);
    Fz= Fz + Int;
end

F1= (Weight*9.819)/4 + Fz ;

end
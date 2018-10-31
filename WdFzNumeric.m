function [F1] =WdFzNumeric(omega,R_propeller,rho,C,Cl_modified,lambda_i,Cd_modified,N,Weight,r)


k= -(0.5*rho*(omega*R_propeller)); % constant values of the int
DeltaR = R_propeller/N;
r = r + DeltaR/2;
Fz = 0;

for i=1:N
    Int = (k*((Cl_modified(i)*C(i)*r(i))/(sqrt( lambda_i(i)^2 + r(i)^2))) - ((Cd_modified(i)*C(i)*lambda_i(i))/(sqrt( lambda_i(i)^2 + r(i)^2))))*DeltaR;
    Fz= Fz + Int;
end
F1= Weight*9.81 + Fz ;

end
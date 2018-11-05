function [F1] = WdFz(omega,R_propeller,rho,C,Cl_modified,Cd_modified,N,Weight,nblades,phi,lambda_i)

k= -(0.5*rho*nblades*(omega*R_propeller)^2); % constant values of the int
syms r;
dF =0;

for i=2:N-1
    fun = (k*C(i)*sqrt((r(i)^2+(lambda_i(i))^2))*((Cl_modified(i)*r(i)*cos(phi(i))) - ((Cd_modified(i)*sin(phi(i))))));
    dF_int= int(fun);
    dF = dF + double(subs(dF_int, i/N));
end
F1= Weight*9.81/4 + dF;

end
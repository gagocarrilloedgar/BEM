function [F1] = WdFz(omega,R,rho,C,Cl_modified,lambda_i,Cd_modified,N,Weight)

k= -(0.5*rho*(omega*R)); % constant values of the int
syms r;
dF =0;

for i=1:N
    fun = k*((Cl_modified(i)*C(i)*r)/(sqrt( lambda_i(i)^2 + r^2))) - ((Cd_modified(i)*C(i)*lambda_i(i))/(sqrt( lambda_i(i)^2 + r^2)));
    dF_int= int(fun);
    dF = dF + double(subs(dF_int, i/N));
end
F1= Weight*9.81 + dF;
end

% Now we need to compute the power in order to size the batery
k= rho*0.5*(Omega_BEM*R_propeller)^3 * R_propeller*N_blades;
dr = R_propeller/N;
Pi =0;
Pp =0;
for i= 1:N-1
dPi(i,1) = dr*k*((lambda_c + lambdai_BEM(i))^2 + r(i)^2)*sin(phi(i))*Chord_real(i)*Cl_vector_BEM(i,index);
Pi = Pi + dPi(i,1);
dPp(i,1) = dr*k*((lambda_c + lambdai_BEM(i))^2 + r(i)^2)*cos(phi(i))*Chord_real(i)*Cd_vector_BEM(i,index);
Pp = Pp + dPp(i,1);
dPt(i,1) = dPp(i,1) + dPi(i,1);
Pt = Pp + Pi;
end

dPt_Deltax = dPt/dr; 
dPi_Deltax = dPi/dr; 
dPp_Deltax = dPp/dr; 
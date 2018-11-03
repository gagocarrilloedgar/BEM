
%Creating pchip and spline functions...
Alpha_unf = -20:1:90;
Alpha_unf = Alpha_unf';

Cl_pchip = pchip(Alpha,Cl,Alpha_unf);
Cl_spline = pchip(Alpha,Cl,Alpha_unf);

Cd_pchip = pchip(Alpha,Cd,Alpha_unf);
Cd_spline = pchip(Alpha,Cd,Alpha_unf);

Efficiency_spline = Cl_spline./Cd_spline;
Efficiency_pchip = Cl_pchip./Cd_pchip;



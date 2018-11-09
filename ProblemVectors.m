%Defining the vector for each induced velocity

% 1,1 --> v_c =0
% 2,1 --> v_c =2.5
% 3,1 --> v_c =5
% 4,1 --> v_c =7.5

Cl_vector_MTH = zeros(N,4);
Cl_vector_BEM = zeros(N,4);
Cl_vector_Pr = zeros(N,4);

lambda_vector_MTH = zeros(N,4);
lambda_vector_BEM = zeros(N,4);
lambda_vector_Pr = zeros(N,4);

dFz_dx_MTH = zeros(N,4);
dFx_dx_MTH = zeros(N,4);
dPi_dx_MTH = zeros(N,4);
dPp_dx_MTH = zeros(N,4);
dPt_dx_MTH = zeros(N,4);

dFz_dx_BEM = zeros(N,4);
dFx_dx_BEM = zeros(N,4);
dPi_dx_BEM = zeros(N,4);
dPp_dx_BEM = zeros(N,4);
dPt_dx_BEM = zeros(N,4);

dFz_dx_Pr = zeros(N,4);
dFx_dx_Pr = zeros(N,4);
dPi_dx_Pr = zeros(N,4);
dPp_dx_Pr = zeros(N,4);
dPt_dx_Pr = zeros(N,4);



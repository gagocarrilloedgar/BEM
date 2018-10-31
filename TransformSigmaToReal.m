function [Sigma_real] = TransformSigmaToReal(r,lamda_MTH_i,Clopt)

r_p = 0.7;

syms r_s Sigma_sym(r_s);

Sigma_s = (8*(lamda_MTH_i)^2)/(Clopt*r_s);
dSigma_s = diff(Sigma_s,r_s);

%m
Sigma1_r= dSigma_s(0.7);
Sigma1=double(subs(Sigma1_r,0.7));

%thtea0
Sigma0 = double(subs(Sigma_s(0.7),0.7)) - Sigma1*r_p;

Sigma_real = Sigma0 + Sigma1.*r;
end
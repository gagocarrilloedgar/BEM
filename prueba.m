r_p = 0.7;
r=linspace(0,1,30);
x=linspace(0,5,30);
Sigma_i=8./(Clopt*r);

syms r_s Sigma_sym(r_s);
Sigma_s =8/(Clopt*r_s);
dSigma_s = diff(Sigma_s,r_s);
Sigma_ideal=r.^2;
%m
Sigma1_r= dSigma_s(0.7);
Sigma1=double(subs(Sigma1_r,0.7));

%thtea0
Sigma0 = double(subs(Sigma_s(0.7),0.7)) - Sigma1*r_p;

Sigma_real = Sigma0 + Sigma1.*r;

figure;
plot(Sigma_i,r,'b');
hold on;
plot(Sigma_real,r,'g');
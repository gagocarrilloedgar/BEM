
%utilitzant rotor ideal
[Theta_ideal_r] = ThetaMTH(Alpha_max_eff,lamda_MTH_i,r);
[Sigma_ideal_r] = SigmaMTH(lamda_MTH_i,r,Clopt);
[c_r] = ChordMTH(Sigma_ideal_r,R_propeller,N_blades);

%Utilizant aproximació real
[Theta_real] = TransformThetaToReal(r,Alpha_max_eff,lamda_MTH_i);
[Sigma_real] = TransformSigmaToReal(r,lamda_MTH_i,Clopt);
[Chord_real] = ChordMTH(Sigma_real,R_propeller,N_blades);
function [Theta]= ThetaMTH(Alpha_max_eff,lamda_MTH_i,r)

Theta = deg2rad(Alpha_max_eff) + atan((lamda_MTH_i)./r );

end
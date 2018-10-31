function [Sigma] = SigmaMTH(lamda_MTH_i,r,Clopt)

Sigma = (8*(lamda_MTH_i).^2)./(Clopt.*r);

end
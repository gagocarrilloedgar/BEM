function [c_r] = ChordMTH(sigma_ideal_r,R,N_blades)

c_r = (sigma_ideal_r.*R.*pi)./N_blades;
end
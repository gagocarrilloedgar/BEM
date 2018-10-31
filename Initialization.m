
%Createing the array and extracting the data from the .txt
Alpha = table2array(ImportAlpha('AirfoilData.txt', 8, 74));
Cl = table2array(ImportCl('AirfoilData.txt', 8, 74));
Cd = table2array(ImportCD('AirfoilData.txt', 8, 74));
Efficiency = Cl./Cd;

%Vectors size
N=size(Alpha,1);

%Cl_alpha for simplified BEM equation
alpha1 = find(Alpha == 4);
alpha2 = find(Alpha == 6);

Cl_alpha = (Cl(alpha2) - Cl(alpha1))/deg2rad(2);
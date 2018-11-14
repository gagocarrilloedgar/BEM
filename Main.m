clear;
close all;
clc;


%% Initialization
format shortE;
format compact;

%Shor form of calling a script whitout having a function, if we do not have
%to call several times this function there is no reason of making one. This
%way the program will be faster and more understandable

%This function reads a .txt, import and create the main needed vectors
Initialization;

%Creating solution vectors
ProblemVectors;

%Polynomial interpolation
CreatePchipVectors;

for index = 1:4
%Design and problem conditions
DesignConditions;

%Alpha when efficiency is max and Clopt;
Cl_opt;

%% Lleis de corda (theta) i solidesa (sigma)

ChordAndSolidity;


%% MTH
MTH;

%% BEM
SimplfiedBEMForW; 
% % BEM applying Prandtl & Compressibility
BEMPrandtlLosses; 

end
%% Printing the plots
PrintingThePlots;



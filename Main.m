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

%Polynomial interpolation
CreatePchipVectors;

%Design and problem conditions
DesignConditions;

%Alpha when efficiency is max and Clopt;
Cl_opt;

%% Lleis de corda (theta) i solidesa (sigma)
ChordAndSolidity;

%% Aplicación de BEM
SimplfiedBEMForW; % Not taking into account the prandtl losses
% BEM applying Prandtl & Compressibility

BEMPrandtlLosses; 

% pasar por referencia = https://es.mathworks.com/matlabcentral/answers/96960-does-matlab-pass-parameters-using-call-by-value-or-call-by-reference

%% Printing the plots
PrintingThePlots;


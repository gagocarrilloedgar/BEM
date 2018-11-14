
%% UX --> A little of user implementation
confirmation = 1;

dx = R_propeller/N;
PMTH=zeros(1,4);
v_c=[0 2.5 5 7.5];
lambda_c = v_c./(Omega_vector(2,:)*R_propeller);
for i=1:N
    for j=1:4
    P_MTH(i,j) =  4*pi*r(i)*(Omega_vector(2,j)*R_propeller)^3*R_propeller^2*lambda_vector_BEM(i,j)*((lambda_c(j)+lambda_vector_BEM(i,j))^2)*dx;
    PMTH(1,j) = PMTH(1,j) + P_MTH(i,j);
    end
end

dPt_dx_MTH = P_MTH/dx;

while (confirmation)
    option = input('Do you want to print the plots? \n A) Yes \n B) No \n','s');
    
    if(option == 'A' || option =='a')
        %Plots of differences between Pchip, spline and sample points
        
        %This function creates the axis and the titles  for pchip plots
        [Cl_axis,Cd_axis,Eff_axis,Cl_title,Cd_title,Eff_title] = AxisAndTitleDefinition();
        
%         CreateFigure(Alpha,Cl,Alpha_unf,Cl_pchip,Cl_spline,Cl_axis,Cl_title);
%         CreateFigure(Alpha,Cd,Alpha_unf,Cd_pchip,Cd_spline,Cd_axis,Cd_title);
%         CreateFigure(Alpha,Efficiency,Alpha_unf,Efficiency_pchip,Efficiency_spline,Eff_axis,Eff_title);
%         
%         %Pots of Theta and Sigma
%         CreateFiguresOfThetaAndSigma(Theta_ideal_r,Sigma_ideal_r,Theta_real,Sigma_real,r);
%         
%         %Lambda for the diferent Methods
%         CreateFigureOFLambdas(Lambda_vector_MTH,lambda_vector_BEM,lambda_vector_Pr,r,N);
        
        %Power Figures
%         CreateFiguresOfPowerMTH(dPt_dx_MTH(:,1),dPt_dx_MTH(:,2),dPt_dx_MTH(:,3),dPt_dx_MTH(:,4),r);
%         CreateFiguresOfPowerBEM(dPt_dx_BEM(:,1),dPt_dx_BEM(:,2),dPt_dx_BEM(:,3),dPt_dx_BEM(:,4),r);
%         CreateFiguresOfPowerPr(dPt_dx_Pr(:,1),dPt_dx_Pr(:,2),dPt_dx_Pr(:,3),dPt_dx_Pr(:,4),r);
        CreateFiguresOfPower(dPt_dx_MTH,dPt_dx_BEM,dPt_dx_Pr,r);
        
        %Cl(r)
        Cl_vector_MTH = Clopt*ones(N,1);
        CreateFiguresOfCl(Cl_vector_MTH,Cl_vector_BEM,Cl_vector_Pr,r);

        %Fz_dx
%         CreateFiguresOfFzMTH(dFz_dx_MTH(:,1),dFz_dx_MTH(:,2),dFz_dx_MTH(:,3),dFz_dx_MTH(:,4),r);
%         CreateFiguresOfFzBEM(dFz_dx_BEM(:,1),dFz_dx_BEM(:,2),dFz_dx_BEM(:,3),dFz_dx_BEM(:,4),r);
%         CreateFiguresOfFzPr(dFz_dx_Pr(:,1),dFz_dx_Pr(:,2),dFz_dx_Pr(:,3),dFz_dx_Pr(:,4),r);
        
        %Cuerda
%         CreateFigureOfChord(Chord_real,r);
        
        confirmation = 0;

        
    elseif(option == 'B' || option =='b')
        fprintf('That is fine by\n' );
        confirmation = 0;
    else
        fprintf('Something went wrong, try again\n');
        confirmation = 1;
        
    end
    
end

fprintf(P_tot_MTH );
fprintf('\n');
fprintf(P_tot_BEM );
fprintf('\n');
fprintf(P_tot_PC );
fprintf('\n');

%% UX --> A little of user implementation
confirmation = 1;

while (confirmation)
    option = input('Do you want to print the plots? \n A) Yes \n B) No \n','s');
    
    if(option == 'A' || option =='a')
        %Plots of differences between Pchip, spline and sample points
        
        %This function creates the axis and the titles  for pchip plots
        [Cl_axis,Cd_axis,Eff_axis,Cl_title,Cd_title,Eff_title] = AxisAndTitleDefinition();
        
        CreateFigure(Alpha,Cl,Alpha_unf,Cl_pchip,Cl_spline,Cl_axis,Cl_title);
        CreateFigure(Alpha,Cd,Alpha_unf,Cd_pchip,Cd_spline,Cd_axis,Cd_title);
        CreateFigure(Alpha,Efficiency,Alpha_unf,Efficiency_pchip,Efficiency_spline,Eff_axis,Eff_title);
        
        %Pots of Theta and Sigma
        CreateFiguresOfThetaAndSigma(Theta_ideal_r,Sigma_ideal_r,Theta_real,Sigma_real,r);
        confirmation = 0;
        
        %Lambda for the diferent Methods
        CreateFigureOFLambdas(lamda_MTH_i,lambdai_BEM,lambdai_BEM_PR,r,N);
        
    elseif(option == 'B' || option =='b')
        fprintf('That is fine by\n' );
        confirmation = 0;
    else
        fprintf('Something went wrong, try again\n');
        confirmation = 1;
        
    end
    
end
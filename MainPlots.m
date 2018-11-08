Confirmation = 1;

while (Confirmation == 1)
    Printingplots = input('Would you like to print the plots \n A) Yes \n B) No \n','s');
    
    if(Printingplots == 'A' || Printingplots =='a')
        
        Confirmation = 0;
    elseif(Printingplots == 'B' || Printingplots =='b')
        fprintf('That is fine by\n' );
        Confirmation = 0;
    else
        fprintf('Something went wrong, try again\n');
        Confirmation = 1;
        
    end
end
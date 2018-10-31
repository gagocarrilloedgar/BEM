function [lambda_i] = InducedVelocityBEM(sigma,Cl_alpha,theta,r,N)

%Hipotesis taken in order to simplified the bem equation:
%Vc = 0 ( Design Condition)
%Cl(alpha) = Cl_alpha * alpha
%v_i << omgegaR

method = 2;

switch(method)
    case 1
        lambda_i = (( (sigma.*Cl_alpha)/16 ) .* ( sqrt( 1 + (32./(Cl_alpha.*sigma)).*theta.*r ) ) - 1 );
    case 2
        fun = @Solver;
        x0 = zeros(N,1);
        lambda_i=fsolve(fun,x0);
    otherwise
        fprintf('Method not found \n');
        
end

    function F = Solver(x)
        F=zeros(N,1);
        for i = 1:N
            F(i) = 4*(x(i)^2)*r(i) - 0.5*sigma(i)*r(i)*Cl_alpha*(theta(i) - atan(x(i)/r(i)));
        end
    end
        
end
function CreateFigureOFLambdas(LambdaMTH,LambdaBEM,LambdaBEMPr,r,N)

figure;
plot(r,LambdaMTH(:,1),'b',r,LambdaBEM(:,1),'g',r,LambdaBEMPr(:,1));
title('Non dimensional induced velocity $\lambda_i$ $v_c = 0$ ','Interpreter','Latex');
legend('\lambda_{MTH}','\lambda_{BEM}','\lambda_{BEM + Pr}','Location','SouthEast');
ylabel('$\lambda_i$','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');

figure;
plot(r,LambdaMTH(:,2),'b',r,LambdaBEM(:,2),'g',r,LambdaBEMPr(:,2));
title('Non dimensional induced velocity $\lambda_i$ for $v_c = 2.5$','Interpreter','Latex');
legend('\lambda_{MTH}','\lambda_{BEM}','\lambda_{BEM + Pr}','Location','SouthEast');
ylabel('$\lambda_i$','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');

figure;
plot(r,LambdaMTH(:,3),'b',r,LambdaBEM(:,3),'g',r,LambdaBEMPr(:,3));
title('Non dimensional induced velocity $\lambda_i$ $v_c = 5$ ','Interpreter','Latex');
legend('\lambda_{MTH}','\lambda_{BEM}','\lambda_{BEM + Pr}','Location','SouthEast');
ylabel('$\lambda_i$','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');

figure;
plot(r,LambdaMTH(:,4),'b',r,LambdaBEM(:,4),'g',r,LambdaBEMPr(:,4));
title('Non dimensional induced velocity $\lambda_i$ $v_c = 7.5$ ','Interpreter','Latex');
legend('\lambda_{MTH}','\lambda_{BEM}','\lambda_{BEM + Pr}','Location','SouthEast');
ylabel('$\lambda_i$','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');


end